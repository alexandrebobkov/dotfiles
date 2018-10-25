#!/bin/bash

# Install Vim Plug
echo "Installing Vim Plug"
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Setting up dotfiles
echo "Setting up dotfiles"
git clone --bare https://github.com/dougmaitelli/dotfiles.git $HOME/.cfg
function config {
   /usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME $@
}
mkdir -p .config-backup
config checkout
if [ $? = 0 ]; then
  echo "Checked out config.";
  else
    echo "Backing up pre-existing dot files.";
    config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} .config-backup/{}
    config checkout
fi;
config config status.showUntrackedFiles no
config ls-files --deleted -z | config update-index --assume-unchanged -z README.md setup.sh
