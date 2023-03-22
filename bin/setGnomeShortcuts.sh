#!/bin/bash

n=9

for(( i=1; i<=n; i++ )); do
    echo "${i}"
    gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-$i "['<Super>${i}']"
    gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-$i "['<Shift><Super>${i}']"
    gsettings set org.gnome.shell.extensions.dash-to-dock app-hotkey-$i "[]" 
    gsettings set org.gnome.shell.extensions.dash-to-dock app-shift-hotkey-$i "[]"
    gsettings set org.gnome.shell.keybindings switch-to-application-$i "[]"

done

gsettings set org.gnome.desktop.wm.keybindings toggle-maximized "['<Super>f']"
gsettings set org.gnome.shell.extensions.pop-shell activate-launcher "[]"
gsettings set org.gnome.desktop.wm.keybindings close "['<Super>q']"
gsettings set org.gnome.shell.extensions.dash-to-dock hot-keys false
gsettings set org.gnome.mutter.keybindings toggle-tiled-left "[]"
gsettings set org.gnome.mutter.keybindings toggle-tiled-right "[]"
gsettings set org.gnome.mutter overlay-key ''
gsettings set org.gnome.desktop.wm.keybindings show-desktop "[]"
gsettings set org.gnome.shell.keybindings toggle-application-view "[]"
gsettings set org.gnome.shell.keybindings toggle-overview "['<Super>d']"
