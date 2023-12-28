#!/bin/bash

source app.sh

install_app() {
    yay -Sq --noconfirm $1  > /dev/null 2>&1
    echo "Installing $1..."
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

for app in "${APPS[@]}"; do
    install_app "$app"
    copy_configs "$app"
done

echo "Installation complete."

