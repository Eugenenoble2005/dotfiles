echo "Removing problematic conflicts"
rm -rf ~/.config/waybar ~/Pictures ~/.themes ~/.icons

echo "Beginning Stow"
stow --adopt *

git reset --hard

stow .

echo "Initial setup complete"

