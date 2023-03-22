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

function installVSCode ()
{
  sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
  sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
  dnf -y check-update
  sudo dnf -y install code
}

function installHomeBrew ()
{
  # TODO
}

function installHomeBrewPackages ()
{
  brew install fasd glab
}

function customizeGnomeSettings ()
{
  gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-1 "['<Super>1']"
}

installDependencies
installDocker
installDDEV
installOhMyZsh
installSpacevim
installNVM
installVSCode
installFlatpakPackages
