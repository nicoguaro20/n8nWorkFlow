FROM n8nio/n8n:latest

# Copiamos tus flujos desde la carpeta N8N
COPY N8N /workflows

COPY docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod +x /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]


