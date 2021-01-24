#!/bin/bash
#Author:ymc023
#Mail:ymc023@163.com 
#Platform:centos7
#Date:2016年02月04日 星期四 10时21分07秒
#Update:2020年12月13日 星期日 17:50:11 

echo "vimIDE setup is running now......"

#apt
if which apt-get >/dev/null; then
  	sudo apt-get install -y vim  exuberant-ctags xclip astyle  python3-dev git \
	gcc g++ cmake
#yum
elif which yum >/dev/null; then
	sudo yum install -y gcc git ctags xclip python3-devel python-setuptools python-devel cmake \
    gcc-c++ zlib zlib-devel clang-devel  centos-release-scl devtoolset-8 libffi-devel	
#Mac OS
elif which brew >/dev/null;then
    echo "You are using HomeBrew tool"
    brew install vim ctags git astyle
fi

sudo pip3 install  autopep8 
sudo pip3 install flake8
sudo ln -s /usr/bin/ctags /usr/local/bin/ctags

mv -f ~/.vimrc ~/.vimrc_old
mv -f ~/.vim/bundle  ~/.vim/bundle_old
mkdir -p ~/.vim/bundle/vundle

echo  "install Vundle.vim" 
git clone https://github.com/VundleVim/Vundle.vim.git  ~/.vim/bundle/Vundle.vim 

cp -rf vimrc   ~/.vimrc
cp -rf colors/ ~/.vim/

echo  "install vim plugin now......"
vim +PluginInstall +qall 


if [ $GOPATH ];then 
    if [ -d $GOPATH/src ];then 
        echo "export GOPROXY=https://goproxy.io" >>/etc/profile
        source /etc/profile
        echo "install YouCompleteMe"
        cd ~/.vim/bundle/YouCompleteMe/
        git submodule update --init  --recursive
        ~/.vim/bundle/YouCompleteMe/install.py --gocode-completer 
        go get -u github.com/jstemmer/gotags
        # ~/.vim/bundle/YouCompleteMe/install.py --go-completer --clang-completer \
        # --system-libclang 

    else
        mkdir $GOPATH/src
        cd $GOPATH/src 
        echo "export GOPROXY=https://goproxy.io" >>/etc/profile
        source /etc/profile
        echo "install YouCompleteMe"
        cd ~/.vim/bundle/YouCompleteMe/
        git submodule update --init  --recursive
        ~/.vim/bundle/YouCompleteMe/install.py --gocode-completer 
        go get -u github.com/jstemmer/gotags
        # ~/.vim/bundle/YouCompleteMe/install.py --go-completer --clang-completer \
        # --system-libclang 
    fi

fi

echo "OK.Congratulations!"

