import StaticDashboard from './_components/static-dashboard';
import { getCurrentStageConfig, isFeatureEnabled } from './_config/stages';

// Obtener configuración de la etapa actual
const stageConfig = getCurrentStageConfig();
const useStaticDashboard = isFeatureEnabled('staticDashboard');

export default function HomePage() {
  return (
    <div className="space-y-8">
      {/* Header */}
      <div className="flex items-center justify-between">
        <div>
          <h1 className="text-3xl font-bold text-gray-900">
            🎯 La Huella - Análisis de Sentimientos
          </h1>
          <p className="text-gray-600 mt-2">
            Monitorea y analiza los comentarios de productos de calzado
          </p>
          <div className="mt-2 px-3 py-1 bg-blue-100 text-blue-800 text-sm rounded-full inline-block">
            🎯 Etapa {stageConfig.number}: {stageConfig.name}
          </div>
        </div>
      </div>

      {/* Renderizar dashboard según configuración */}
      {useStaticDashboard ? (
        <StaticDashboard />
      ) : (
        <></>
      )}
    </div>
  );
}
