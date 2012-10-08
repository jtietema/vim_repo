set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" My Bundles here:
"
" original repos on github
Bundle 'wincent/Command-T'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-surround'
Bundle 'mileszs/ack.vim'
Bundle 'duff/vim-scratch'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/nerdcommenter'
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'
Bundle "honza/snipmate-snippets"
Bundle 'garbas/vim-snipmate'

" Android / Java bundles
Bundle 'vim-scripts/javacomplete'
Bundle 'bpowell/vim-android', { 'rtp': 'findAndroidManifest' }

" Color Bundles
Bundle 'altercation/vim-colors-solarized'
Bundle 'ervandew/supertab'

" Configuration
filetype plugin indent on

syntax on

" Set clipboard to unnamed to share it with the OS
set clipboard=unnamed

" Add special file types
au BufNewFile,BufRead *.json set ft=javascript   " Treat JSON files like JavaScriptt

set term=screen-256color
set mouse=a                         " Enable mouse
set ttymouse=xterm2                 " Do more with your mouse
set number                          " Show line numbers
set ruler                           " Show line and column number
set encoding=utf-8                  " Set default encoding to UTF-8
set t_Co=256                        " Explicitly tell vim that the terminal has 256 colors
set background=dark
"color solarized

set nowrap                          " don't wrap lines
set tabstop=4                       " a tab is four spaces
set shiftwidth=4                    " an autoindent (with <<) is two spaces
set expandtab                       " use spaces, not tabs
set list                            " Show invisible characters
set autoindent                      " Automatically indent
set smartindent                     " Do smart indenting
set backspace=indent,eol,start      " backspace through everything in insert mode
set linespace=4                     " Increased line height
set colorcolumn=100                 " Show a column at 100 chars
highlight ColorColumn ctermbg=grey guibg=grey guifg=black

set splitright 						" Always split on the right

set showcmd                         " Show the current command
set showmode                        " Show the current mode
set visualbell                      " No beeping allowed
set autoread                        " Auto read changed files

set listchars=""                    " Reset the listchars
set listchars=tab:\ \               " a tab should display as "  "
set listchars+=trail:.              " show trailing spaces as dots
set listchars+=extends:>            " The character to show in the last column when wrap is
                                    " off and the line continues beyond the right of the screen
set listchars+=precedes:<           " The character to show in the last column when wrap is
                                    " off and the line continues beyond the right of the screen

set hlsearch                                    " highlight matches
set incsearch                                   " incremental searching
set ignorecase                                  " searches are case insensitive...
set smartcase                                   " ... unless they contain at least one capital letter
nmap <leader>hs :set hlsearch! hlsearch?<CR>    " Toggle hlsearch with <leader>hs

set wildignore+=*.o,*.out,*.obj,.git,*.rbc,*.class,.svn,*.gem   " Disable output and VCS files
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz         " Disable archive files
set wildignore+=*.swp,*~,._*                                    " Disable temp and backup files

set backupdir=~/.vim/backup//       " where to put backup files.
set directory=~/.vim/tmp//          " where to put swap files.
set nobackup                        " disable backups
set noswapfile                      " disable swap files

" use :w!! to write to a file using sudo if you forgot to 'sudo vim file'
" (it will prompt for sudo password when writing)
cmap w!! %!sudo tee > /dev/null %

" Folding
set foldenable
set foldmethod=indent
set foldlevel=99999

" Folding expand/collapse mappings
map + zo
map - zc
map ++ zR
map -- zM

map <Leader>= <C-w>=                        " Adjust viewports to the same size

" prevent indenting when pasting
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>

" Statusline setup
if has("statusline") && !&cp
    set laststatus=2  " always show the status bar

    " Without setting this, ZoomWin restores windows in a way that causes
    " equalalways behavior to be triggered the next time CommandT is used.
    " This is likely a bludgeon to solve some other issue, but it works
    set noequalalways

    " Start the status line
    set statusline=%f\ %m\ %r

    " Add fugitive
    set statusline+=%{fugitive#statusline()}

    " Add syntastic
    "set statusline+=%#warningmsg#
    "set statusline+=%{SyntasticStatuslineFlag()}
    "set statusline+=%*

    " Finish the statusline
    set statusline+=%=
    set statusline+=Line:%l/%L[%p%%]\ |
    set statusline+=Col:%v\ |
    set statusline+=Buf:#%n\ |
    set statusline+=[%b][0x%B]
endif

" Android
set tags+=/home/jeroen/.vim/tags
autocmd Filetype java setlocal omnifunc=javacomplete#Complete
let g:SuperTabDefaultCompletionType = 'context'

" Command-T
let g:CommandTMaxFiles=20000
