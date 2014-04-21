
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General
"set nocompatible " Use Vim settings, rather then Vi settings (much better!).
"set cpo-=u " undo is vi compatible
"set backspace=indent,eol,start " allow backspacing over everything in insert mode
"set tabstop=4     " a tab is four spaces
"set shiftwidth=4  " number of spaces to use for autoindenting
"set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'
"set smarttab      " insert tabs on the start of a line according to shiftwidth, not tabstop
"set autoindent    " always set autoindenting on
"set copyindent    " copy the previous indentation on autoindenting
"set nobackup " Don't create backup files
""let mapleader="," " change the mapleader from \ to ,
"set history=1000         " remember more commands and search history
"set undolevels=1000      " use many muchos levels of undo
let &tags=$MODEL_ROOT.'/tags'
"filetype plugin indent on " indenting intelligence is enabled based on the syntax rules for the file type
"autocmd filetype python set expandtab " set commands for specific filetypes only
"autocmd filetype html,xml set listchars-=tab:>.
"set visualbell           " don't beep
"set noerrorbells         " don't beep


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Search
set hls " highlight search terms
set ic " case-insensitive search
set scs " smart search (override 'ic' when pattern has uppers)
set incsearch " incremental search
set ws!  " don't wrap the search
" Always keep search results at the center of the screen
"nnoremap n nzz
"nnoremap N Nzz
"nnoremap * *zz
"nnoremap # #zz
"nnoremap g* g*zz
"nnoremap g# g#zz


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Display
set nowrap " Don't wrap lines
set showmatch " Show the matching bracket for the last ')'?
"set scrolloff=999 " Keep cursor vertically centered

if has("gui_running")
	"set guifont=-adobe-courier-medium-r-normal--12*
	"set guifont=Adobe\ Courier\ 12
	set guifont=Bitstream\ Vera\ Sans\ Mono\ 12
	set cursorline
	set guioptions-=T " To set the toolbars off
	set lines=40 columns=120 " Set window size
endif

if &t_Co >= 256 || has("gui_running")
	set number " show line numbers
	"colorscheme desert
	colorscheme mustang
endif

if &t_Co > 2 || has("gui_running")
	syntax on " switch syntax highlighting on, when the terminal has colors
	filetype on
	au BufNewFile,BufRead *.sv set filetype=verilog
	au BufNewFile,BufRead *.svh set filetype=verilog
endif


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mappings
noremap <C-Right> :bn<CR>
noremap <C-Left> :bp<CR>
noremap <C-A-e> :NERDTree<CR> " Open NERDTree with CRTL-ALT-e
noremap <Space> :set wrap! wrap?<CR> " Toggle line wrap
noremap <S-Space> :set hlsearch! hlsearch?<CR> " Toggle highlighting on/off, and show current value.
"nmap <silent> <leader>ev :e $MYVIMRC<CR> " Quickly edit the vimrc file
"nmap <silent> <leader>sv :so $MYVIMRC<CR> " Quickly reload the vimrc file


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Macros
"let @e='11"myy1dd10dd:g/CLK_PERIOD/dgg:g!/ ns /dgg"mP'
let @c='icam_env_pkg::'

" Define 'Filter' command to copy lines matching a pattern to a new file
command! -nargs=? Filter let @a='' | execute 'g/<args>/y A' | enew | setlocal bt=nofile | put! a


