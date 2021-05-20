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
sudo apt-get install -y python3-pip

# <- tmux ->
sudo apt-get install -y tmux

# <- Powerline -> 

sudo apt-get install -y fonts-powerline
git clone https://github.com/b-ryan/powerline-shell
cd powerline-shell && sudo python3 setup.py install && sudo rm -r powerline-shell/ 

git clone https://github.com/powerline/fonts.git --depth=1
# install
cd fonts
./install.sh
# clean-up a bit
cd ..
rm -rf fonts

touch ~/.config/fish/config.fish
echo "function fish_prompt" >> ~/.config/fish/config.fish
echo "  powerline-shell --shell bare \$status" >> ~/.config/fish/config.fish
echo "end" >> ~/.config/fish/config.fish
echo "" >> ~/.config/fish/config.fish
# echo "clear" >> ~/.config << Enable this to hide fish welcome
echo "neofetch" >> ~/.config/fish/config.fish

# Tmux config
touch ~/.tmux.conf
echo "set-option -g default-shell /usr/bin/fish" >> ~/.tmux.conf

# <- exa -> 
wget https://github.com/ogham/exa/releases/download/v0.10.0/exa-linux-x86_64-v0.10.0.zip -P ~/Tools/
unzip ~/Tools/exa-linux-x86_64-v0.10.0.zip
sudo mv cd ~/Tools/bin/ && mv * /usr/local/bin
sudo cd ~/Tools/man/ && mv * /usr/share/man/man1
sudo cd ~/Tools/completions/ && mv *.fish usr/share/fish/vendor_completions.d

# <- Shell Font ->
wget "https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Hack/Regular/complete/Hack%20Regular%20Nerd%20Font%20Complete.ttf" -P ~/.local/share/fonts/
echo ""
echo "" 
echo " [>>] REMEMBER TO SET THE FONT FOR SHELL/SYSTEM MANUALLY"
echo ""
echo "" 

# TODO: Setup to edit ~/.local/cd ~/.local/lib/python2.7/site-packages/powerline_shell/__init__.py
## lego fade powerline bar 
# 'patched': {
#      'lock': u'\uE0A2',
#      'network': u'\uE0A2',
#      'separator': u'\uE0C6',
#      'separator_thin': u'\uE0C6'
# },


     # :::::::::::::::::::::::::::::: Alias Setup ::::::::::::::::::::::::::::::


echo ""
echo ""
echo ":::::::::::::::::::::::::::::: [Alias Setup] ::::::::::::::::::::::::::::::"
echo ""
echo ""

# <- cat enhancment/plugin -> 
sudo snap install batcat

# <- ls enhancment/plugin ->
echo "alias ls=\"exa --icons\"" ~/.config/fish/config.fish

# <- Create alias ->
echo "" >> ~/.config/fish/config.fish
echo "alias bcat=\"batcat\"" >> ~/.config/fish/config.fish



     # :::::::::::::::::::::::::::::: Tooling Setup ::::::::::::::::::::::::::::::

echo ""
echo ""
echo ":::::::::::::::::::::::::::::: [Tooling Setup] ::::::::::::::::::::::::::::::"
echo ""
echo ""


mkdir ~/Tools

# <- pwndbg ->
git clone https://github.com/pwndbg/pwndbg ~/Tools/pwndbg
cd ~/Tools/pwndbg && chmod +x setup.sh && ./setup.sh

# <- nmap ->
sudo apt-get install -y nmap

# <- openvpn ->
sudo apt-get install -y openvpn


# <- cutter ->
wget https://github.com/rizinorg/cutter/releases/download/v2.0.2/Cutter-v2.0.2-x64.Linux.appimage -P ~/Tools/
chmod +x ~/Tools/Cutter-v2.0.2-x64.Linux.appimage

# <- pwntools ->
apt-get install python3 python3-pip python3-dev git libssl-dev libffi-dev build-essential
python3 -m pip install --upgrade pip
python3 -m pip install --upgrade pwntools

# <- seclists ->
mkdir ~/Tools/Wordlists/
wget -c https://github.com/danielmiessler/SecLists/archive/master.zip -O ~/Tools/Wordlists/SecList.zip \
  && unzip ~/Tools/Wordlists/SecList.zip \
  && rm -f ~/Tools/Wordlists/SecList.zip

# <- golang ->
sudo apt-get install -y golang

# <- fuff ->
wget https://github.com/ffuf/ffuf/releases/download/v1.3.1/ffuf_1.3.1_linux_amd64.tar.gz -P ~/Tools/
unzip -xf ~/Tools/ffuf_1.3.1_linux_amd64.tar.gz
sudo mv ~/Tools/ffuf /bin/
rm ~/Tools/ffuf_1.3.1_linux_amd64.tar.gz


# <- lazyrecon ->
git clone https://github.com/nahamsec/lazyrecon.git ~/Tools/lazyrecon/
chmod +x ~/Tools/lazyrecon/lazyrecon.sh

# <- net-tools ->
sudo apt-get install -y net-tools

# <- burp-package-version (will need manual update) -> 
# cd ./packages/ && chmod +x burpsuite_community_linux.sh && ./burpsuite_community_linux.sh

# <- Figma ->
sudo snap install figma-linux

# <- gitkraken ->
sudo snap install gitkraken --classic

# <- jetbrains toolbox ->
wget https://download.jetbrains.com/toolbox/jetbrains-toolbox-1.20.8352.tar.gz -P ~/Tools/

# <- hashcat ->
sudo apt-get install hashcat
