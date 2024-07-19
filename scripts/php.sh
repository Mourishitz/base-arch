echo "Installing PECL"
sudo pacman -S --noconfirm php-pecl > /dev/null 2>&1

echo "Installing PHP extensions"


read -rp " - Do you want to install Swoole? [Y/n]" read response

response=${response:-Y}
response=$(echo "$response" | tr '[:lower:]' '[:upper:]')

if [[ "$response" == "Y" ]]; then
    sudo pecl install swoole
fi
