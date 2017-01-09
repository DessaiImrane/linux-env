# Installation Meteor
curl https://install.meteor.com/ | sh


# Installation SDK Android
apt-get install ubuntu-make
umake android

apt-get install nodejs npm

# Installation bashcompletion meteor
wget https://raw.githubusercontent.com/stef-k/meteor_bash_completions/master/meteor.bash -O ~/.meteor.bash
cat >> ~/.bashrc <<EOT
if [ -f ~/.meteor.bash ]; then
    . ~/.meteor.bash
fi
EOT


# Installation plugin vim meteor
curl https://raw.githubusercontent.com/Slava/vimrc/master/.vimrc >> ~/.vimrc
mkdir -p ~/.vim/bundle
git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
vim -c "NeoBundleInstall" -c "q"
cd ~/.vim/bundle/tern_for_vim/
npm install
curl https://raw.githubusercontent.com/Slava/tern-meteor/master/meteor.js > node_modules/tern/plugin/meteor.js
cd ~
