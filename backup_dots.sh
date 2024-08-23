cd ~/.dotfiles
rm -rf simple-sddm-2
sudo cp -r /usr/share/sddm/themes/simple-sddm-2 .
sudo chown -R $USER simple-sddm-2
git add .
stow --adopt .
echo "Commit Mesage"
read commit_message
git commit -m "${commit_message}"
git push
