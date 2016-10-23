#1/bin/sh

sudo apt-get update && \
    sudo apt-get upgrade

sudo apt-get install -y \
    zsh tmux docker.io \
    python3-pip openjdk-8-jdk \
    software-properties-common

# zsh
chsh -s /bin/zsh

# leiningen
curl -sfLo ~/bin/lein --create-dirs \
 https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein
chmod +x ~/bin/lein

# neovim
sudo add-apt-repository -y ppa:neovim-ppa/unstable
sudo apt-get update
sudo apt-get install neovim
sudo pip3 install neovim

# dotfiles
curl -L http://bit.ly/uochan_dotfile | bash
