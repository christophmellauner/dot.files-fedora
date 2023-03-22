#!/bin/bash

n=9

for(( i=1; i<=n; i++ )); do
    echo "${i}"
    gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-$i "['<Super>${i}']"
    gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-$i "['<Shift><Super>${i}']"
done

gsettings set org.gnome.desktop.wm.keybindings toggle-maximized "['<Super>f']"
gsettings set org.gnome.shell.extensions.pop-shell activate-launcher "[]"