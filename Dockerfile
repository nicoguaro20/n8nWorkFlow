# Usa la imagen oficial
FROM n8nio/n8n:latest

# Copiamos workflows al contenedor ajuste
COPY workflows /workFlows
COPY docker-entrypoint.sh /docker-entrypoint.sh

RUN chmod +x /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]



