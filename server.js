require('express')()
.get('/health', (req, res) => res.sendStatus(200))
.listen(3000, '0.0.0.0', () => console.log('READY'));
