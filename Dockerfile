FROM n8nio/n8n:latest

# Copiamos tus flujos desde la carpeta N8NWORKFLOW/workflows
COPY ./workflows /workflows

# Copiamos el entrypoint personalizado
COPY docker-entrypoint.sh /docker-entrypoint.sh

# 🔹 Le damos permisos de ejecución
RUN chmod +x /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]