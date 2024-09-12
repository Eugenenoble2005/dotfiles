cd ~/.dotfiles
git add .
stow --adopt .
echo "Commit Mesage"
read commit_message
git commit -m "${commit_message}"
git push
