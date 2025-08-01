const express = require('express');
const { sendRconCommand } = require('./rconClient.js');

const app = express();
app.use(express.json());

app.post('/rcon', async (req, res) => {
    const { command } = req.body;
    if (!command) {
        return res.status(400).json({ error: 'Missing command' });
    }

    try {
        const result = await sendRconCommand(command);
        res.json({ result });
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
});

app.listen(3000, () => {
    console.log('Listening on port 3000');
});