FROM mcr.microsoft.com/playwright:v1.42.1-jammy

WORKDIR /app

# Installation des dépendances système requises
RUN apt-get update && apt-get install -y curl

# Copie et installation des dépendances Node
COPY package.json package-lock.json ./
RUN npm ci --omit=dev && \
    npx playwright install --with-deps

# Copie du code
COPY . .

# Configuration santé et port
HEALTHCHECK --interval=10s --timeout=3s --start-period=5s \
    CMD curl -f http://localhost:3000/health || exit 1
EXPOSE 3000

# Commande de démarrage
CMD ["node", "server.js"]
