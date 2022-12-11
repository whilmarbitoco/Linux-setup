#!/bin/bash

# Update package manager
sudo apt-get update

# Install basic tools
sudo apt-get install -y vim curl wget git

# Set up SSH keys
ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa

# Add SSH key to ssh-agent
echo "Enter your GitHub username: "
read username
echo "Enter your GitHub email: "
read email
curl -u "$username:$password" --data "{\"title\":\"$HOSTNAME\",\"key\":\"$(cat ~/.ssh/id_rsa.pub)\"}" https://api.github.com/user/keys

# Set Git global config
git config --global user.name "$username"
git config --global user.email "$email"

# Install and set up Oh My Zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
sed -i -e 's/ZSH_THEME="robbyrussell"/ZSH_THEME="agnoster"/g' ~/.zshrc

# Set default editor to Vim
echo "export EDITOR='vim'" >> ~/.bashrc
echo "export EDITOR='vim'" >> ~/.zshrc