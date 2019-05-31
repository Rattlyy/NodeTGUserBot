const TelegramAPI = require('tg-cli-node');
const path = require('path');
const fs = require("fs");
const admin = "ur-id"; //admin id
const Client = new TelegramAPI({
  telegram_cli_path: path.join(__dirname, 'tg/bin/telegram-cli'), //path to tg-cli
  telegram_cli_socket_path: path.join(__dirname, 'socket'), //path for socket file
  server_publickey_path: path.join(__dirname, 'tg/tg-server.pub') //path to server key (traditionally, in tg/tg-server.pub)
                              });

Client.connect(connection => {
    connection.on('message', message => {
      const msg = message;
      //logs message
        console.log(message.from.peer_id+": "+message.text);

       try {
         if (fs.existsSync(`./commands/${msg.text}.js`)) { //if command exists
           try {
            let commandFile = require(`./commands/${msg.text}.js`);
                commandFile.run(message, msg, admin); //run file
              } catch(err) {
                console.log(err); //log errors
              }
              }
      } catch (err) {
      console.log(err);
      }

    });

    connection.on('error', e => { //in case of an error from telegram, like FLOOD_WAITs etc, logs the error
        console.log('Error from Telegram API:', e);
    });

    connection.on('disconnect', () => {
        console.log('Disconnected from Telegram API');
    });
});
