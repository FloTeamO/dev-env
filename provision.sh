# software update/upgrade + gnome desktop installation
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install -y xinit unity ubuntu-desktop

# development software installation
sudo apt-get install -y aptitude vim autojump screen wget vim git git-completion autojump screen build-essential

# Android Debug Bridge (ADB) dependencies (http://developer.android.com/sdk/installing/index.html?pkg=tools)
sudo aptitude install -y lib32z1 lib32ncurses5 lib32bz2-1.0 lib32stdc++6
sudo aptitude install -y default-jdk

# Android Studio (including SDK) installation (http://developer.android.com/sdk/index.html)
mkdir ~/workspace
cd ~/workspace
wget --no-check-certificate https://dl.google.com/dl/android/studio/ide-zips/1.2.1.1/android-studio-ide-141.1903250-linux.zip
unzip android-studio-ide-141.1903250-linux.zip
rm android-studio-ide-141.1903250-linux.zip
mv android-studio android-studio-1.2.1.1
ln -s android-studio-1.2.1.1 android-studio
mkdir ~/bin
ln -s ~/workspace/android-studio/bin/studio.sh ~/bin/studio.sh

# Android NDK (https://developer.android.com/tools/sdk/ndk/index.html)
cd ~/workspace
wget --no-check-certificate http://dl.google.com/android/ndk/android-ndk-r10e-linux-x86_64.bin
chmod a+x android-ndk-r10e-linux-x86_64.bin
./android-ndk-r10e-linux-x86_64.bin
rm android-ndk-r10e-linux-x86_64.bin
ln -s android-ndk-r10e android-ndk

# add git prompt
echo "" >> ~/.bashrc
echo "# add git prompt" >> ~/.bashrc
echo "if [ -f ~/.git-prompt.sh ]; then" >> ~/.bashrc
echo "    . ~/.git-prompt.sh" >> ~/.bashrc
echo "    GIT_PS1_SHOWDIRTYSTATE=true" >> ~/.bashrc
echo "    GIT_PS1_SHOWCOLORHINTS=true" >> ~/.bashrc
echo "    GIT_PS1_UNTRACKEDFILES=true" >> ~/.bashrc
echo "    PROMPT_COMMAND=\"__git_ps1 '[\u@\h \W]' '\\$ '\"" >> ~/.bashrc
echo "fi" >> ~/.bashrc
ln -s /etc/bash_completion.d/git-prompt ~/.git-prompt.sh

# required autojump source
echo "" >> ~/.bashrc
echo "source /usr/share/autojump/autojump.sh" >> ~/.bashrc

# various configuration
cp /vagrant/data/dotscreenrc ~/.screenrc
cp /vagrant/data/dotgdbinit ~/.gdbinit
cp /vagrant/data/dotpylintrc ~/.pylintrc
cp /vagrant/data/dotjshintrc ~/.jshintrc

# vim configuration
cp -r /vagrant/data/dotvim ~/.vim
cp /vagrant/data/dotvimrc ~/.vimrc
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
sudo aptitude install -y libpython-dev libboost-all-dev libclang-dev cmake
cd ~/.vim/bundle/YouCompleteMe
./install.sh --clang-completer --system-libclang --system-boost
