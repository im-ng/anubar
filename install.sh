#!/bin/bash

echo 'Anubar installer'

DP=$([[ "$XDG_CURRENT_DESKTOP" == *"GNOME"* ]] && echo true || echo false)
if [ $DP == false ]; then
    echo "This script works only in Gnome environment"
    exit 1
fi

echo -e 'Start default upgrade'
sudo apt update
sudo apt upgrade -y
echo -e ''
sleep 1

echo -e 'Start default upgrade'
sudo apt install wget -y
sudo apt install chrome-gnome-shell -y
sudo apt install gnome-browser-connector -y
echo -e ''
sleep 1

echo -e 'Download necessary gnome-extensions'
wget https://extensions.gnome.org/extension-data/openbarneuromorph.v35.shell-extension.zip
gnome-extensions install openbarneuromorph.v35.shell-extension.zip --force

wget https://extensions.gnome.org/extension-data/tilingshellferrarodomenico.com.v12.shell-extension.zip
gnome-extensions install tilingshellferrarodomenico.com.v12.shell-extension.zip --force

wget https://extensions.gnome.org/extension-data/VitalsCoreCoding.com.v68.shell-extension.zip
gnome-extensions install VitalsCoreCoding.com.v68.shell-extension.zip --force

wget https://extensions.gnome.org/extension-data/appindicatorsupportrgcjonas.gmail.com.v58.shell-extension.zip
gnome-extensions install appindicatorsupportrgcjonas.gmail.com.v58.shell-extension.zip --force

echo -e 'Download necessary gnome apps'
wget https://github.com/Ulauncher/Ulauncher/releases/download/5.15.7/ulauncher_5.15.7_all.deb
sudo apt install ./ulauncher_5.15.7_all.deb -y
cp config/ulauncher.desktop ~/.config/autostart/
echo -e ''

echo -e 'Load gnome keyboard shortcuts and pre-settings'
dconf load / < config/dconf-settings.ini
echo -e ''
sleep 1

echo -e 'Remove downloaded dependencies'
rm openbarneuromorph.v35.shell-extension.zip
rm tilingshellferrarodomenico.com.v12.shell-extension.zip
rm VitalsCoreCoding.com.v68.shell-extension.zip
rm appindicatorsupportrgcjonas.gmail.com.v58.shell-extension.zip
rm ulauncher_5.15.7_all.deb
echo -e ''

echo -e "Clean up done"
sleep 1

echo -e "Anubar installation completed"
sleep 2

gnome-session-quit --force