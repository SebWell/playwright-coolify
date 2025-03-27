const express = require('express');
const app = express();
app.get('/', (req, res) => res.send('API Ready !'));
app.listen(3000);
