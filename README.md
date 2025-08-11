# La Huella - Análisis de Sentimientos

Aplicación Next.js para análisis de sentimientos de comentarios de productos de calzado.

## 🚀 Despliegue Local

### Requisitos
- Node.js 20+ o 22+
- pnpm
- Docker

### Instalación

1. **Clonar el repositorio**
   ```bash
   git clone <repository-url>
   cd eu-devops-6-sentiment
   ```

2. **Instalar dependencias**
   ```bash
   pnpm install
   ```

3. **Ejecutar en desarrollo**
   ```bash
   pnpm dev
   ```
   
   La aplicación estará disponible en `http://localhost:3000`

4. **Build para producción**
   ```bash
   pnpm build
   pnpm start
   ```

## 🧪 Testing

### Ejecutar tests
```bash
# Ejecutar todos los tests
pnpm test

# Verificar linting
pnpm run lint
```

Los tests incluyen:
- Tests unitarios de componentes
- Tests de configuración
- Tests de API endpoints
- Tests de integración

## 🐳 Docker

### Construcción y despliegue
```bash
# Construir imagen
docker build -t la-huella-test:latest .

# Ejecutar contenedor
docker run -d \
  --name la-huella-test \
  -p 3000:3000 \
  -e CURRENT_STAGE=1 \
  la-huella-test:latest
```

### Health Check
La aplicación incluye un endpoint de health check en `/api/health`

## 🔄 Pipeline CI/CD

El pipeline automatizado ejecuta los siguientes pasos:

1. **Test y Validación**
   - Instalación de dependencias
   - Verificación de linting
   - Ejecución de tests
   - Validación de build

2. **Construcción Docker**
   - Build de imagen Docker local
   - Etiquetado con `latest`

3. **Despliegue Local**
   - Parada de contenedor anterior
   - Despliegue de nueva versión
   - Verificación de health check
   - Confirmación de despliegue exitoso

### Configuración del Runner

Para ejecutar el pipeline necesitas:
- Self-hosted runner configurado
- Docker instalado en el runner
- pnpm disponible en el sistema

El pipeline se ejecuta automáticamente en:
- Push a `main`

## 📝 Variables de Entorno

```bash
CURRENT_STAGE=1  # Etapa actual del proyecto
NODE_ENV=production  # Entorno de ejecución
```

## 🆘 Troubleshooting

- **Puerto ocupado**: Cambiar puerto con `-p 3001:3000`
- **Tests fallan**: Verificar dependencias con `pnpm install`
- **Docker build falla**: Verificar que Docker esté ejecutándose
- **Pipeline falla**: Revisar logs en GitHub Actions