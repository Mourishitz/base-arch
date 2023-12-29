#!/bin/bash

source app.sh

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

post_install() {
    app_name=$1
    script_file="scripts/$app_name.sh"

    if [ -f "$script_file" ]; then
        echo "Script for $app_name found! Executing $app_name.sh"
        $script_file
    fi
}

for app in "${APPS[@]}"; do
    echo "======================="
    install_app "$app"
    copy_configs "$app"
    post_install "$app"
    echo "======================="
done

echo "Installation complete."

