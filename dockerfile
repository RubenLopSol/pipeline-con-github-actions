# ---------- Deps ----------
FROM node:22-alpine AS deps
WORKDIR /app
# Usamos corepack para pnpm sin instalar globalmente
RUN corepack enable
COPY package.json pnpm-lock.yaml ./
RUN pnpm install --frozen-lockfile

# ---------- Build ----------
FROM node:22-alpine AS builder
WORKDIR /app
ENV NODE_ENV=production
RUN corepack enable
COPY --from=deps /app/node_modules ./node_modules
COPY . .
# Build de Next.js (genera salida "standalone")
RUN pnpm run build

# ---------- Runtime ----------
FROM node:22-alpine AS runner
WORKDIR /app
ENV NODE_ENV=production \
    PORT=3000 \
    NEXT_TELEMETRY_DISABLED=1
# Usuario no-root
RUN addgroup -S nextjs && adduser -S nextjs -G nextjs

# Copiamos solo lo necesario para ejecutar
COPY --from=builder /app/.next/standalone ./
COPY --from=builder /app/public ./public
COPY --from=builder /app/.next/static ./.next/static

USER nextjs
EXPOSE 3000
CMD ["node", "server.js"]


