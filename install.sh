#!/bin/bash

source app.sh

install_yay() {
    echo "Installing yay..."
    git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg -si --noconfirm
    cd ..
    rm -rf yay
}

install_app() {
    echo "Installing $1..."
    yay -Sq --noconfirm $1  > /dev/null 2>&1
}

copy_configs() {
    app_name=$1
    config_folder="configs/$app_name"

    if [ -d "$config_folder" ]; then
        echo "Copying config files for $app_name..."
        cp -r "$config_folder" ~/.config/
    else
        echo "Config folder not found for $app_name."
    fi
}

pre_install() {
    echo "Updating system..."
    sudo pacman -Syu --noconfirm > /dev/null 2>&1

    if ! command -v yay &> /dev/null
    then
        echo "Yay not found. Installing..."
        install_yay
    
    else
        echo "Yay found. Skipping installation."
    fi
}

post_install() {
    app_name=$1
    script_file="scripts/$app_name.sh"

    if [ -f "$script_file" ]; then
        echo "Script for $app_name found! Executing $app_name.sh"
        $script_file
    fi
}


echo "Starting instalation process..."
pre_install

for app in "${APPS[@]}"; do
    echo "======================="
    install_app "$app"
    copy_configs "$app"
    post_install "$app"
    echo "======================="
done

echo "Installation complete."

