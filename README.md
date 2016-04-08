# my_vimrc

All the plugins are managed by [Vundle](https://github.com/VundleVim/Vundle.vim). So, first of all, you should do this:

    git clone https:github.comVundleVimVundle.vim.git ~.vimbundleVundle.vim

Next step, execute `:PluginInstall` while open this `.vimrc'. Some plugins are really HUGE, so this step may take a while.

All done!

# Some gotcha

1. In order to use all the plugins, make sure that the version of vim is 7.4+, and is compiled with python supported, say:

        ./configure --with-features=huge --enable-pythoninterp --with-python-config-dir=/usr/lib/python2.7/config/
        make && make install
    
2. An extra complile is needed for plugin `YouCompleteMe`. See <https://github.com/Valloric/YouCompleteMe#mac-os-x> for more details.
