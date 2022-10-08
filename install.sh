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
  echo '[ddev]
  name=DDEV Repo
  baseurl=https://yum.fury.io/drud/
  enabled=1
  gpgcheck=0' | sudo tee -a /etc/yum.repos.d/ddev.repo
  sudo dnf install --refresh ddev
}

function installDependencies ()
{

  sudo dnf -y update
  sudo dnf -y install $(cat dnf-package-list.txt | tr "\n" " ")
}

function installOhMyZsh ()
{
  echo "Installing OhMyZsh"
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  sudo dnf config-manager -y --add-repo https://download.opensuse.org/repositories/shells:zsh-users:zsh-autosuggestions/Fedora_36/shells:zsh-users:zsh-autosuggestions.repo
  sudo dnf -y install zsh-autosuggestions 
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