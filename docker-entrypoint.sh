#!/bin/sh
set -e

# Importa todos los json en /workflows (no falla si ya existe)
for f in /workflows/*.json; do
  [ -e "$f" ] || continue
  echo "Importando $f ..."
  # --overwrite true para reemplazar si ya existe (opcional)
  n8n import:workflow --input="$f" --separate --overwrite
done

# Arranca n8n; si Railway expone PORT, n8n lo usará automáticamente
exec n8n start
