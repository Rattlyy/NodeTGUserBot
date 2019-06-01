#!/bin/sh
echo "[NodeTGUserBot] - Installer"
echo "[NodeTGUserBot] - Installing Required Packages"
sudo apt-get update
sudo apt-get install nodejs npm git screen gcc libreadline-dev libconfig-dev libpng-dev libssl-dev lua5.2 liblua5.2-dev libevent-dev libjansson-dev libpython-dev make  -y
echo "[NodeTGUserBot] - Packages Installed"
echo "[NodeTGUserBot] - Installing Telegram-CLI"
git clone --recursive https://github.com/vysheng/tg.git && cd tg
./configure
echo "[NodeTGUserBot] - Compiling Telegram-CLI"
sudo make
echo "[NodeTGUserBot] - Compiled Telegram-CLI"
echo "[NodeTGUserBot] - Installing Required Node.js Dependencies"
npm i --save tg-cli-node
npm i -g pm2
echo "[NodeTGUserBot] - Installed Node.js Dependencies"
echo "[NodeTGUserBot] - Install Finished"
echo "[NodeTGUserBot] - To run your code, use pm2 start index.js"
echo "[NodeTGUserBot] - Entering Telegram-CLI so you can configure it with your number."
echo "[NodeTGUserBot] - Created by Rattly"
tg/bin/telegram-cli -k tg-server.pub
