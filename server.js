const express = require('express');
const app = express();

// Middleware essentiel
app.use(express.json());

// Route de santé obligatoire
app.get('/health', (req, res) => {
  console.log('Health check OK');
  res.status(200).json({ 
    status: 'OK', 
    timestamp: Date.now() 
  });
});

// Démarrer le serveur
const PORT = process.env.PORT || 3000;
app.listen(PORT, '0.0.0.0', () => {
  console.log(`Server running on http://0.0.0.0:${PORT}`);
});
