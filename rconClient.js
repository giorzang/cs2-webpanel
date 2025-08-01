const rconModule = require('rcon-srcds');
const Rcon = rconModule.default;

const server = new Rcon({
    host: "192.168.36.105",
    port: 27019
});

async function sendRconCommand(command) {    
    try {
        await server.authenticate('2312');
        console.log('authenticated');
        
        server.execute(command);
        // const result = await server.execute(command);
    } catch (e) {
        console.log(e);
    }
}

module.exports = { sendRconCommand };