#!/bin/sh

# Check to see is git command line installed in this machine
IS_GIT_AVAILABLE="$(git --version)"
if [[ $IS_GIT_AVAILABLE == *"version"* ]]; then
  echo "Git is Available"
else
  echo "Git is not installed"
  exit 1
fi

cp  $HOME/{.zshrc,.xinitrc} .

cp -r $HOME/.config/{polybar,i3} .

# Check git status
gs="$(git status | grep -i "modified")"


# If there is a new change
if [[ $gs == *"modified"* ]]; then
  echo "push"
fi


# push to Github
git add .;
git commit -m "Backup `date +'%Y-%m-%d %H:%M:%S'`";
git push
