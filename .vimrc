set nocompatible

" Vundle setup
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'benmills/vimux'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-git'
Plugin 'tpope/vim-markdown'
Plugin 'tpope/vim-surround'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'scrooloose/nerdtree'
Plugin 'junegunn/vim-easy-align'
Plugin 'junegunn/fzf.vim'
Plugin 'jansenm/vim-cmake'
Plugin 'vimwiki/vimwiki'
Plugin 'Valloric/YouCompleteMe'
call vundle#end()
filetype plugin indent on

" Colors
syntax enable       " Enable Syntax highlighting

" Spaces and tabs
set tabstop=4       " number of visual spaces per TAB
set softtabstop=4   " insert mode tab and backspace use 2 spaces
set shiftwidth=4    " normal mode indentation command use 2 spaces
set showtabline=4   " always show tab bar
set expandtab       " tabs are spaces

" UI Config
let mapleader = "," " Set leader
set mouse=a         " Enable use of mouse for all modes
if has("mouse_sgr") " Make the mouse usable on large screens
    set ttymouse=sgr
else
    set ttymouse=xterm2
end
set encoding=utf-8
set number          " show line numbers
set relativenumber  " show line numbers relative to current line
set showcmd         " show command in bottom bar
set cursorline      " highlight current line
set ruler           " display cursor position on screen
set visualbell      " use a visual bell instead of beeping on errors
set t_vb=           "reset the terminal code for the visual bell
set lazyredraw      " redraw only when need to
set autoread        " reload files when they change on disk
set showmatch       " highlight matching [{()}]
set autoindent      " the same indent as the line you're currentlly on
set backspace=indent,eol,start  " backspacing over autoindent, line breaks etc
set nostartofline   " dont jump to start of the line
set wildmenu        " visual autocomplete for command menu
set wildmode=longest,list,full
set colorcolumn=81  " colored column at 81
set textwidth=80    " insert newline after 80
set confirm         " raise dialogue on failed command
set cmdheight=2     " set height of command window to 2
set laststatus=2    " always display the status line
set list            " display unprintable characters
" Use textmate-style whitespace characters
set lcs=eol:¬,tab:▸\
" Quickly time out on keycodes, but never time out on mappings
set notimeout ttimeout ttimeoutlen=200

" Searching
set incsearch       " search as characters are entered
set hlsearch        " highlight matches

" Folding
set foldenable      " enable folding
set foldlevelstart=10   " open most folds by default
set foldnestmax=10  " 10 nested fold max
" space open/close folds
nnoremap <space> za
set foldmethod=indent   " fold based on indent level

" Window splitting and movement
set nocompatible    " ward off unexpected things from distro
set splitright      " vsplit on the right
set splitbelow      " split below
nnoremap <silent>vv <C-w>v
" automatically rebalance windows on vim resize
autocmd VimResized * :wincmd =
if exists('$TMUX') " Support resizing in tmux
  set ttymouse=xterm2
endif
" fix Cursor in TMUX
if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

" Linux
set shell=bash      " enable bash aliases from vim shell
set switchbuf=useopen   " on opening a file, jump to current open file
set clipboard=unnamed

" Diffs
highlight diffAdded guifg=#00bf00
highlight diffRemoved guifg=#bf0000

" Quick-commands
nnoremap <leader>d dd
map <leader>n :noh<CR>
map <leader>C :ccl<CR><CR>

" Highlighting
hi NonText ctermfg=240 guifg=#666666

" Git
set statusline=%F\ %m\ %{fugitive#statusline()}\ %y%=%l,%c\ %P
" Gitv settings:
" do not allow gitv to generate control key mappings
" as these collide with the above
let g:Gitv_DoNotMapCtrlKey = 1
nmap <leader>gv :Gitv --all<cr>
nmap <leader>gV :Gitv! --all<cr>
vmap <leader>gV :Gitv! --all<cr>
" manage working dir: the nearest ancestor that contains a .git
let g:ctrlp_working_path_mode = 'r'
let g:ctrlp_max_height = 90
let g:ctrlp_max_depth = 40
let g:ctrlp_match_window = 'bottom,order:ttb,min:1,max:90,results:90'

" NERD Tree
let NERDTreeShowHidden=1
map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeQuitOpen=1

" Vim easy align Plugin
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for motion/text object (e.g. gaip)
xmap ga <Plug>(EasyAlign)

" YouCompleteMe
" disable auto_triggering ycm suggestions pane and instead use semantic
" cpmlietion only on Ctrl-n
let g:ycm_use_clangd = "Never"
let ycm_trigger_key = '<C-n>'
let g:ycm_auto_trigger = 0
let g:ycm_key_invoke_completion = ycm_trigger_key

" this is some arcane magic to allow cycling through the YCM options with the
" same key that opened it.
" See http://vim.wikia.com/wiki/Improve_completion_popup_menu for more info.
let g:ycm_key_list_select_completion = ['<TAB>', '<C-j>']
inoremap <expr> ycm_trigger_key pumvisible() ? "<C-j>" : ycm_trigger_key;

