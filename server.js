const express = require('express');
const app = express();
app.get('/health', (req, res) => res.sendStatus(200));
app.listen(3000, '0.0.0.0', () => console.log('API Ready'));
