echo "Backing up existing nvim configurations"
cp -r ~/.config/nvim ~/.config/bckp-nvim

echo "Removing nvim configurations"
rm -rf ~/.config/nvim

echo " - Copying AstroNvim dotfiles"
cp -r configs/nvim ~/.config/nvim
