FROM mcr.microsoft.com/playwright:v1.42.1-jammy

WORKDIR /app

# Copie et installation des dépendances (optimisation du cache Docker)
COPY package.json package-lock.json ./
RUN npm ci --omit=dev  # Utilise `npm ci` pour des installations reproductibles

# Copie du code et installation des browsers
COPY . .
RUN npx playwright install --with-deps

# Health check et exposition du port
HEALTHCHECK --interval=30s --timeout=3s CMD curl -f http://localhost:3000/health || exit 1
EXPOSE 3000

# Commande de démarrage
CMD ["node", "server.js"]
