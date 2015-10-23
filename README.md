vimrc
=====

Installation
------------
### centos(7 or above)

```sh
cd ~ && git clone https://github.com/stcai/vimrc.git .vim

cd ~ && mkdir .vim-plugin
cd .vim-plugin && git clone https://github.com/gmarik/Vundle.vim.git
vim +PluginInstall +qall

yum install epel-release
yum install clang boost-devel python-devel
yum install vim ctags git cmake gcc gcc-c++
yum install golang

cd ~/.vim-plugin/YouCompleteMe
TRAVIS=1 ./install.sh --clang-completer --system-libclang --system-boost --gocode-completer
```
