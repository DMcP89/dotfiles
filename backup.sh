#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# check to see is git command line installed in this machine
IS_GIT_AVAILABLE="$(git --version)"
if [[ $IS_GIT_AVAILABLE == *"version"* ]]; then
  echo "Git is Available"
else
  echo "Git is not installed"
  exit 1
fi

# copy dotfiles
cp $HOME/{.bash_aliases,.bashrc,.gitconfig,.vimrc,.profile} $DIR
cp -r $HOME/.vim/colors $DIR/.vim/

gs="$(git --git-dir $DIR/.git status | grep -i "modified")"
if [[ $gs == *"modified"* ]]; then
    # push to Github
    git --git-dir $DIR/.git add -u;
    git --git-dir $DIR/.git commit -m "New backup `date +'%Y-%m-%d %H:%M:%S'`";
    git --git-dir $DIR/.git push origin master
fi
