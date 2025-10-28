#!/bin/sh
set -e

echo "🚀 Iniciando script de entrada de n8n..."

# Verifica si existe la carpeta /workflows
if [ -d "/workflows" ]; then
  echo "📁 Carpeta /workflows encontrada. Importando archivos JSON..."
  
  for f in /workflows/*.json; do
    # Evita error si no hay archivos
    [ -e "$f" ] || { echo "⚠️ No se encontraron archivos JSON en /workflows."; break; }

    echo "➡️ Importando workflow: $f"
    n8n import:workflow --input="$f" --separate --overwrite
  done
else
  echo "⚠️ Carpeta /workflows no encontrada. Saltando importación."
fi

echo "✅ Importación completada. Iniciando n8n..."

# Railway define PORT automáticamente, n8n lo usará si existe
exec n8n start
