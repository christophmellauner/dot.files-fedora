#!/bin/bash

function installDocker ()
{ 
  sudo dnf -y install dnf-plugins-core
  sudo dnf config-manager \
    --add-repo \
    https://download.docker.com/linux/fedora/docker-ce.repo
  sudo dnf -y install docker-ce docker-ce-cli containerd.io docker-compose-plugin 
  sudo systemctl start docker.service
  sudo systemctl enable docker.service
  sudo systemctl enable containerd.service
  sudo usermod -aG docker $USER
}

function installDDEV ()
{
  curl -fsSL https://raw.githubusercontent.com/drud/ddev/master/scripts/install_ddev.sh | bash
}

function installDependencies ()
{

  sudo dnf -y update
  sudo dnf -y install $(cat dnf-package-list.txt | tr "\n" " ")
}

function installOhMyZsh ()
{
  echo "Installing OhMyZsh"
  rm -rf ~/.oh-my-zsh
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
  echo "finished installing"
}

function installSpacevim ()
{
  echo "Installing Spacevim"
  curl -sLf https://spacevim.org/install.sh | bash
  echo "finished installing"
}

function installNVM ()
{
  echo "Installing NVM"
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
  echo "finished installing"

}

function installFlatpakPackages ()
{
  flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
  flatpak -y install $(cat flatpak-package-list.txt | tr "\n" " ")
}

installDependencies
installDocker
installDDEV
installOhMyZsh
installSpacevim
installNVM
installFlatpakPackages
