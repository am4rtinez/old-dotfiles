" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  "autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/autoload/plugged')
   
" Themes
Plug 'dracula/vim'              " Theme Dracula
" Plug 'tanvirtin/monokai.nvim'   " Monokai theme
" Plug 'phanviet/vim-monokai-pro'
Plug 'tomasr/molokai'

Plug 'scrooloose/NERDTree'      " File Explorer 
Plug 'ryanoasis/vim-devicons'   " Devicon support for nerdtree


" Typing
Plug 'jiangmiao/auto-pairs'     " Auto pairs for '(' '[' '{'
Plug 'sheerun/vim-polyglot'     " Better Syntax Support
Plug 'alvan/vim-closetag'
Plug 'tpope/vim-surround'
Plug 'ap/vim-css-color'         " Color previews for CSS

" Autocomplete
Plug 'SirVer/ultisnips'         " Snippets engine
Plug 'honza/vim-snippets'       " a collection of snippets
" Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Status bar
Plug 'maximbaz/lightline-ale'
Plug 'itchyny/lightline.vim'

" IDE
Plug 'easymotion/vim-easymotion'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'mhinz/vim-signify'
Plug 'yggdroot/indentline'
Plug 'scrooloose/nerdcommenter'  " An easy way for commenting out lines

call plug#end()

colorscheme molokai

