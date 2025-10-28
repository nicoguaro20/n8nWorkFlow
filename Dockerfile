FROM n8nio/n8n:latest

# Copiamos tus flujos desde la carpeta N8NWORKFLOW/workflows
COPY ./workflows /workflows

COPY docker-entrypoint.sh /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]