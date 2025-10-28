FROM n8nio/n8n:latest

# Copiamos tus flujos y el script de arranque
COPY ./workflows /workflows
COPY docker-entrypoint.sh /docker-entrypoint.sh

# Volvemos a usar el usuario por defecto de n8n (node)
USER node

ENTRYPOINT ["/docker-entrypoint.sh"]