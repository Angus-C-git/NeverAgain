#!/bin/bash

##########################################################################################
#   ___  ____    ____       _                 ____            _       _                  #
#  / _ \/ ___|  / ___|  ___| |_ _   _ _ __   / ___|  ___ _ __(_)_ __ | |_                #
# | | | \___ \  \___ \ / _ \ __| | | | '_ \  \___ \ / __| '__| | '_ \| __|               #
# | |_| |___) |  ___) |  __/ |_| |_| | |_) |  ___) | (__| |  | | |_) | |_                #
#  \___/|____/  |____/ \___|\__|\__,_| .__/  |____/ \___|_|  |_| .__/ \__|               #
#                                    |_|                       |_|                       #
##########################################################################################


echo ""
echo ""
echo "_|                    _|_|      _|_|_|        _|_|_|              _|                          "
echo "  _|                _|    _|  _|            _|          _|_|    _|_|_|_|  _|    _|  _|_|_|    "
echo "    _|              _|    _|    _|_|          _|_|    _|_|_|_|    _|      _|    _|  _|    _|  "
echo "  _|                _|    _|        _|            _|  _|          _|      _|    _|  _|    _|  "
echo "_|                    _|_|    _|_|_|        _|_|_|      _|_|_|      _|_|    _|_|_|  _|_|_|    "
echo "                                                                                    _|        "
echo "    _|_|_|_|_|                                                                      _|        "
echo ""
echo ""

     # :::::::::::::::::::::::::::::: Terminal Setup ::::::::::::::::::::::::::::::

echo ""
echo ""
echo ":::::::::::::::::::::::::::::: [Terminal Setup] ::::::::::::::::::::::::::::::"
echo ""
echo ""

sudo apt-get update
sudo apt install -y fish
sudo apt install -y neofetch

# <- Powerline -> 

pip3 install powerline-shell
sudo apt-get install -y fonts-powerline

clone
git clone https://github.com/powerline/fonts.git --depth=1
# install
cd fonts
./install.sh
# clean-up a bit
cd ..
rm -rf fonts

echo "function fish_prompt" >> ~/.config/fish/config.fish
echo "  powerline-shell --shell bare \$status" >> ~/.config/fish/config.fish
echo "end" >> ~/.config/fish/config.fish
echo "" >> ~/.config/fish/config.fish
# echo "clear" >> ~/.config << Enable this to hide fish welcome
echo "neofetch" >> ~/.config/fish/config.fish


     # :::::::::::::::::::::::::::::: Alias Setup ::::::::::::::::::::::::::::::


echo ""
echo ""
echo ":::::::::::::::::::::::::::::: [Alias Setup] ::::::::::::::::::::::::::::::"
echo ""
echo ""

# <- cat enhancment/plugin -> 
sudo snap install batcat

# <- ls enhancment/plugin (pain) ->
sudo apt install -y exa  # << Works on some distros
# curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
# wget https://github.com/ogham/exa/releases/download/v0.10.0/exa-linux-x86_64-v0.10.0.zip
# unzip exa-linux-x86_64-v0.10.0.zip


# <- Create alias ->
echo "" >> ~/.config/fish/config.fish
echo "alias bcat=\"batcat\"" >> ~/.config/fish/config.fish

