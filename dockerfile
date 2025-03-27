FROM mcr.microsoft.com/playwright:v1.42.1-jammy  
WORKDIR /app  
COPY package.json .  
RUN npm install || echo "Ignorer les erreurs"  
COPY . .  
RUN npx playwright install --with-deps  
EXPOSE 3000  
CMD ["node", "server.js"]  
