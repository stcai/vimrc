" Felix's vimrc
" Coding: C/C++(mainly), Python, Go, Shell, Lua, etc.

if v:version > 700

    "------------------------------------------------------------------------
    set nocompatible              " be iMproved, required
    filetype off                  " required

    " https://github.com/gmarik/Vundle.vim.git
    " set the runtime path to include Vundle and initialize
    set rtp+=~/.vim-plugin/Vundle.vim/
    call vundle#begin('~/.vim-plugin')

    " let Vundle manage Vundle, required
    Plugin 'gmarik/Vundle.vim'

    Plugin 'tomasr/molokai'
    "Plugin 'altercation/vim-colors-solarized'
    Plugin 'vim-scripts/a.vim'
    Plugin 'jlanzarotta/bufexplorer'
    Plugin 'scrooloose/nerdtree'
    Plugin 'vim-scripts/taglist.vim'
    if v:version >= 704
        Plugin 'Valloric/YouCompleteMe'
    endif
    Plugin 'fatih/vim-go'

    call vundle#end()
    filetype plugin indent on	" required
    "------------------------------------------------------------------------

    set nobackup
    set timeoutlen=10000

    ""For econdings
    set encoding=utf-8
    set termencoding=utf-8
    set fileencoding=utf-8
    set fileencodings=ucs-bom,chinese,utf-8
    set ambiwidth=double

    ""For colors
    set t_Co=256
    set cursorline
    set cursorcolumn

    ""For syntax highlighting
    syntax on
    syntax enable

    ""For history
    set history=10000

    ""For search
    set ignorecase smartcase

    ""For folder
    set foldcolumn=1
    set foldlevelstart=2

    ""Showing line numbers and length
    set number  " show line numbers
    set tw=79   " width of document (used by gd)
    set nowrap  " don't automatically wrap on load
    set fo-=t   " don't automatically wrap text when typing
    if v:version > 703
        set colorcolumn=80
    endif
    highlight ColorColumn ctermbg=233

    ""Rebind <Leader> key
    ""I like to have it here becuase it is easier to reach than the default and
    ""it is next to ``m`` and ``n`` which I use for navigating between tabs.
    let mapleader = ","

    ""Automatic reloading of .vimrc
    au! bufwritepost .vimrc source %

    ""For better copy & paste
    set pastetoggle=<F9>

    ""Easy quit command
    noremap <silent> <Leader>q :q<CR>  " Quit current window
    noremap <silent> <Leader>Q :q<CR>:q<CR>   " Quit all windows
    ""Easy save command
    noremap <silent> <Leader>w :w<CR>
    noremap <silent> <Leader>W :wa<CR>
    ""Easy switch left-most and right-most window
    noremap <silent> <Leader>h 999999<c-w><c-h>
    noremap <silent> <Leader>j 999999<c-w><c-j>
    noremap <silent> <Leader>k 999999<c-w><c-k>
    noremap <silent> <Leader>l 999999<c-w><c-l>
    ""Easy open shell
    noremap <silent><Leader>s :shell<CR>
    ""Easy get diff
    noremap <silent> <leader>2 :diffget 2<CR> :diffupdate<CR>
    noremap <silent> <leader>3 :diffget 3<CR> :diffupdate<CR>
    noremap <silent> <leader>4 :diffget 4<CR> :diffupdate<CR>
    ""Easy redo
    nnoremap U <c-r>
    ""Easy split navigation
    nnoremap <C-h> <C-w>h
    nnoremap <C-j> <C-w>j
    nnoremap <C-k> <C-w>k
    nnoremap <C-l> <C-w>l
    ""Make 'Y' behave like other capitals
    nnoremap Y y$
    ""Reselect visual block after indent/outdent
    vnoremap < <gv
    vnoremap > >gv
    vnoremap = =gv
    ""For auto open search and command history
    nnoremap : q:
    nnoremap / q/
    nnoremap ? q?
    ""For make
    noremap <silent> <Leader>m :make!<CR>
    noremap <silent> <Leader>M :make! %:r<CR>
    ""For quickfix
    noremap <silent> <Leader>co :copen<CR>
    noremap <silent> <Leader>cc :cclose<CR>
    noremap <silent> <Leader>cn :cnext<CR>
    noremap <silent> <Leader>cp :cprevious<CR>

    ""For molokai
    let g:rehash256 = 1
    colorscheme molokai

    ""For solarized
    "set background=dark
    "colorscheme solarized
    "set background=light
    "colorscheme solarized
    
    ""For A
    noremap <silent> <Leader>a :AV<CR>

    ""For NERDTree
    let g:NERDTree_title = 'NERDTree'
    let NERDTreeIgnore = [
                \ '^\.',
                \ '^cscope\.',
                \ '\.o$', '\.a$', '\.so$', '\.d$',
                \ '\.pyc',
                \]
    noremap <silent> <Leader>v :NERDTreeToggle<CR>

    ""For taglist
    let Tlist_Show_One_File=1
    let Tlist_Exit_OnlyWindow=1
    let Tlist_Use_Right_Window = 1
    let Tlist_WinWidth = 50
    noremap <silent> <Leader>t :TlistToggle<CR>

    ""For vim-go
    au FileType go nmap <leader>r <Plug>(go-run)
    au FileType go nmap <leader>b <Plug>(go-build)
    au FileType go nmap <leader>t <Plug>(go-test)
    au FileType go nmap <leader>c <Plug>(go-coverage)

    ""For ycm
    let g:ycm_global_ycm_extra_conf = '~/.vim/ycm_extra_conf.py'
    let g:ycm_complete_in_comments=1
    nnoremap <silent> <Leader>d :YcmCompleter GoToDeclaration<CR>
    nnoremap <silent> <Leader>e :YcmCompleter GoToDefinition<CR>
    let g:ycm_collect_identifiers_from_tags_files = 1
    let g:ycm_seed_identifiers_with_syntax = 1
    let g:ycm_confirm_extra_conf=0
    let g:ycm_add_preview_to_completeopt=1
    let g:ycm_autoclose_preview_window_after_insertion=1

endif " if version > 700

""For python
au FileType python setlocal shiftwidth=4 tabstop=4 expandtab smartindent 
            \ foldmethod=indent
""For C/C++
au FileType c,cpp setlocal shiftwidth=4 tabstop=4 expandtab 
            \ foldmethod=syntax
""For make
au FileType make setlocal tabstop=4
""For go
au FileType make setlocal tabstop=4
""For lua/perl/sh/vim
au FileType lua,perl,sh,vim setlocal shiftwidth=4 tabstop=4 expandtab 
            \ foldmethod=indent
