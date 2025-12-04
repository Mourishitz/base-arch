if [ -f ~/.zshrc ]; then
    echo " - .zshrc already exists, skipping zsh installation"
    exit 0
fi

echo " - Writing .zshrc"
cp configs/zsh/.zshrc ~/.zshrc

echo " - Instaling zoxide"
curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh

