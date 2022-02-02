#!/bin/bash
# sudo apt update && sudo apt upgrade -y
USER_CONF_DIR="$HOME/.config"
CONF_DIR=".config"
NVIM_DIR="$CONF_DIR/nvim"
ZSH_DIR="$CONF_DIR/zsh"

echo "============================================"
echo "           - Software Setup -"
echo "============================================"
#sudo apt install git neovim zsh tmux curl
sudo apt install git neovim tmux curl


echo "============================================"
echo "              - GIT Setup -"
echo "============================================"
echo -n "Enter user's full name: "
read git_user;
echo -n "Enter user email: "
read git_email;
git config --global user.name "${git_user}"
git config --global user.email "${git_email}"

echo "============================================"
echo "          - Aliases Setup -"
echo "============================================"
echo "$USER_CONF_DIR"
if [ -d "$USER_CONF_DIR" ]; then
  echo "Setting aliases file"
  cp "$CONF_DIR"/.aliases "$USER_CONF_DIR"/.aliases
  echo "Done."
fi

echo "============================================"
echo "              - Nvim Setup -"
echo "============================================"
echo "Setting nvim config:"
cp -r "$NVIM_DIR" "$USER_CONF_DIR"
echo "Done."

echo "Setting nvim as default editor:"
sudo update-alternatives --set editor /usr/bin/nvim && echo "Done."
echo "Done."


echo "============================================"
echo "               - ZSH Setup -"
echo "============================================"
echo "Changing default shell for user $USER"
chsh -s $(which zsh)
echo "Done."

echo "Setting zsh config:"
cp -r "$NVIM_DIR" "$USER_CONF_DIR"
echo "Done."
