#!/bin/sh
set -e

echo "🚀 Iniciando script de entrada de n8n..."

# Verifica si existe la carpeta /workflows
if [ -d "/workflows" ]; then
  echo "📁 Carpeta /workflows encontrada. Importando archivos JSON..."
  
  for f in /workflows/*.json; do
    [ -e "$f" ] || { echo "⚠️ No se encontraron archivos JSON en /workflows."; break; }

    echo "➡️ Importando workflow: $f"
    n8n import:workflow --input="$f" --separate --overwrite
  done

  echo "✅ Importación completada. Activando workflows..."
  n8n update:workflow --all --active=true
else
  echo "⚠️ Carpeta /workflows no encontrada. Saltando importación."
fi

echo "✅ Workflows importados y activados. Iniciando n8n..."

# Railway define PORT automáticamente, n8n lo usará si existe
exec n8n start
