#!/bin/bash

dnf install zsh
sudo dnf install wget curl
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

cd $HOME/Downloads
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf

mkdir ~/.fonts
cp *.ttf ~/.fonts/
sudo fc-cache -f -v

git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k
sed -i '' 's#ZSH_THEME=".*#ZSH_THEME="powerlevel10k/powerlevel10k"#' ~/.zshrc

# Resets middle click button on Kensington Slimblade on unlock
dbus-monitor --session "type='signal',interface='org.gnome.ScreenSaver'" |
  while read x; do
    case "$x" in
      *"boolean false"*) xinput set-button-map "Kensington Kensington Slimblade Trackball" 1 2 3 4 5 6 7 2;;
    esac
  done &

