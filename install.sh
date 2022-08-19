#!/bin/sh

echo "Prepare the environment..."
sudo apt-get install software-properties-common 
sudo add-apt-repository ppa:neovim-ppa/stable 
sudo apt update 

#Install nodejs and npm
curl -fsSL https://deb.nodesource.com/setup_current.x | sudo -E bash -
sudo apt-get install -y nodejs
sudo apt-get install nodejs-dev node-gyp libssl1.0-dev
sudo apt-get install npm
sudo sudo npm install -g yarn
yarn global add tree-sitter-cli
npm i -g pyright

echo "Install the neovim..."
sudo apt install -y neovim 

echo "Install the Packer..."
git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim

FinderPath = "~/.config"

if [ ! -d "$FinderPath" ];then
    mkdir $FinderPath && cd $FinderPath
    echo "Create a New Finder..."
else
    cd ~/.config
    echo "Finder has been exists..."
fi


sudo ln -s /usr/bin/nvim /usr/local/bin/vi
nvim

