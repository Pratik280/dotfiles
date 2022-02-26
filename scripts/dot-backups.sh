#! /bin/sh 
cd ~/00MAIN/ &&
git add -A &&
git commit -am. &&
git push origin main &&
cd ~/dotfiles/ &&
git add -A &&
git commit -am. &&
git push origin main &&
cd ~/.config/nvim/ &&
git add -A &&
git commit -am. &&
git push origin main
