#!/bin/bash

xcode-select --install

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew cask install iterm2
brew cask install homebrew/cask-fonts/font-hack-nerd-font

brew install wget
brew install zsh

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
upgrade_oh_my_zsh

git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
sed -i '' 's#ZSH_THEME=".*#ZSH_THEME="powerlevel9k/powerlevel9k"#' ~/.zshrc

defaults write com.apple.finder AppleShowAllFiles YES
