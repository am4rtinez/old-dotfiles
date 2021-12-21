" =====================
" settings config
" =====================

syntax enable								" Enables syntax highlighting
set hidden									" Required to keep multiple buffers open multiple buffers
set nowrap									" Display long lines as just one line
set encoding=utf-8					" The encoding displayed
set pumheight=10						" Makes popup menu smaller
set title
set number									" Line numbers
set mouse=a									" Enable your mouse
set mouse=v                 " middle-click paste with 
set cursorline							" Enable highlighting of the current line
set ruler              			" Show the cursor position all the time
set showmatch               " show matching 
set noshowmode              " Hides de --INSERT-- tag
" Searching
set hlsearch                " highlight search 
set incsearch               " incremental search
set ignorecase              " searches are case insensitive
set smartcase               " ... unless they contain at least one capital letter

set tabstop=2               " Insert 2 spaces for a tab
set softtabstop=2           " see multiple spaces as tabstops so <BS> does the right thing
set showtabline=2           " Always show tabs
set shiftwidth=2            " Change the number of space characters inserted for indentation
set smartindent             " Makes indenting smart
set smarttab                " Makes tabbing smarter will realize you have 2 vs 4
set expandtab               " Converts tabs to spaces
set autoindent              " Good auto indent

set shiftround
set fileencoding=utf-8      " The encoding written to file
set cmdheight=2             " More space for displaying messages
set iskeyword+=-            " treat dash separated words as a word text object"
set t_Co=256                " Support 256 colors
set conceallevel=0          " So that I can see `` in markdown files
set laststatus=2            " Always display the status line
set background=dark         " tell vim what the background color looks like
set nobackup                " This is recommended by coc
set nowritebackup           " This is recommended by coc
set updatetime=300          " Faster completion
set timeout timeoutlen=500          " By default timeoutlen is 1000 ms
filetype plugin indent on   "allow auto-indenting depending on file type
filetype plugin on
set formatoptions-=cro      " Stop newline continution of comments
set clipboard=unnamedplus   " Copy paste between vim and everything else
set ttyfast                 " Speed up scrolling in Vim
set spelllang=en,es					" Corregir palabras usando diccionarios en inglés y español

" open new split panes to right and below
set splitright              " Vertical splits will automatically be to the right
set splitbelow              " Horizontal splits will automatically be below

" color schemes
" set termguicolors

command! -bang -nargs=* Ag
  \ call fzf#vim#grep(
  \   'ag --column --numbers --noheading --color --smart-case '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)
