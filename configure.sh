#!/bin/bash
DIR=$PWD/files

if [ -e $HOME/.emacs_$USER ]
then
    rm -rf $HOME/.emacs_$USER
    echo "Removing previous custom emacs directory : .imrane_emacs"
    sleep 0.5s
fi

cd $DIR
echo "Copying bash file : "
for f in `/bin/ls bash* `;
do
    cp $f $HOME/.$f
    echo ".$f "
    sleep 0.5s
done;

echo "Copying emacs files and directory  "
sleep 0.5s
sed "s/\$USER/"$USER"/" emacs > $HOME/.emacs
cp -r imrane_emacs $HOME/.emacs_$USER

echo "Copying vim file "
sleep 0.5s
cp vimrc $HOME/.vimrc

cd $PWD



echo "Sourcing all changings"
sleep 0.5s
. $HOME/.bashrc


echo "End of configuration"


