const express = require('express');
const { chromium } = require('playwright'); // N'oubliez pas d'importer Playwright

const app = express();

// Route de health check obligatoire
app.get('/health', (req, res) => res.status(200).send('OK'));

// Votre route de scraping
app.post('/scrape', async (req, res) => {
  const browser = await chromium.launch({ headless: true });
  // ... (votre code existant)
});

app.listen(3000, '0.0.0.0', () => console.log('API running on 0.0.0.0:3000')); // Écoute sur toutes les interfaces
