""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General
"set nocompatible " Use Vim settings, rather then Vi settings (much better!).
"set cpo-=u " undo is vi compatible
set backspace=indent,eol,start " allow backspacing over everything in insert mode
set tabstop=4     " a tab is four spaces
set shiftwidth=4  " number of spaces to use for autoindenting
set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'
"set smarttab      " insert tabs on the start of a line according to shiftwidth, not tabstop
set autoindent    " always set autoindenting on
set copyindent    " copy the previous indentation on autoindenting
set expandtab
"set nobackup " Don't create backup files
"let mapleader="," " change the mapleader from \ to ,
"set history=1000         " remember more commands and search history
"set undolevels=1000      " use many muchos levels of undo
"let &tags=$MODEL_ROOT.'/tags'
"filetype plugin indent on " indenting intelligence is enabled based on the syntax rules for the file type
"autocmd filetype python set expandtab " set commands for specific filetypes only
"autocmd filetype html,xml set listchars-=tab:>.
"set visualbell           " don't beep
"set noerrorbells         " don't beep

" Sometimes it is helpful if your working directory is always the same as the file you are editing. To achieve this, put the following in your vimrc:
" set autochdir
" That's it! Unfortunately, when this option is set some plugins may not work correctly if they make assumptions about the current directory. Sometimes, as an alternative to setting autochdir, the following command gives better results:
autocmd BufEnter * silent! lcd %:p:h


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Search
set hls " highlight search terms
set ic " case-insensitive search
set scs " smart search (override 'ic' when pattern has uppers)
"set incsearch " incremental search
set ws!  " don't wrap the search
" Always keep search results at the center of the screen
"nnoremap n nzz
"nnoremap N Nzz
"nnoremap * *zz
"nnoremap # #zz
"nnoremap g* g*zz
"nnoremap g# g#zz

" Always keep search results at the top of the screen
"nnoremap n nzt
"nnoremap N Nzt
"nnoremap * *zt
"nnoremap # #zt
"nnoremap g* g*zt
"nnoremap g# g#zt

set lines=70 columns=200

" Prevent jumping to next match when * is pressed
"noremap * msHmt`s*`tzt`s


" This mapping uses <cword> to get the word under the cursor, and searches for it in the current directory and all subdirectories, opening the quickfix window when done:
command! Mg :execute "vimgrep /" . expand("<cword>") . "/ **" | copen

command! -nargs=? Mgs :execute 'vimgrep <args> **' | copen
command! -nargs=? Mgsc :execute 'vimgrep <args>\C **' | copen

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Display
set nowrap " Don't wrap lines
set showmatch " Show the matching bracket for the last ')'?
"set scrolloff=999 " Keep cursor vertically centered
"set background=dark
let base16colorspace=256
"nnoremap <Leader><Leader>9 :set guifont=Bitstream\ Vera\ Sans\ Mono\ 4<CR>
"nnoremap <Leader><Leader>8 :set guifont=Bitstream\ Vera\ Sans\ Mono\ 12<CR>


if has("gui_running")
	"set guifont=-adobe-courier-medium-r-normal--12*
	"set guifont=Adobe\ Courier\ 12
	"set guifont=Bitstream\ Vera\ Sans\ Mono\ 12
	"set guifont=Px437\ IBM\ PS/2thin2\ 15
	"set guifont=Consolas:h10:cANSI
	set guifont=Ubuntu_Mono:h10:cANSI:qDRAFT
	set guioptions-=T " To set the toolbars off
	"set lines=40 columns=80 " Set window size
	set number " show line numbers
endif

if &t_Co >= 256 || has("gui_running")
	"colorscheme desert
	"colorscheme mustang
    "colorscheme solarized
    "colorscheme base16-flat
    colorscheme base16-monokai
    "colorscheme base16-google-dark
    "colorscheme base16-bright
    "colorscheme base16-isotope
    "colorscheme slate
endif

if &t_Co > 2 || has("gui_running")
	syntax on " switch syntax highlighting on, when the terminal has colors
	filetype on
	au BufNewFile,BufRead *.sv set filetype=verilog
	au BufNewFile,BufRead *.svh set filetype=verilog
	au BufNewFile,BufRead *.vs set filetype=verilog
	au BufNewFile,BufRead *.espf set filetype=perl
	au BufNewFile,BufRead *.spf set filetype=perl
endif

set cursorline
"highlight clear cursorline
"highlight clear cursorcolumn
highlight CursorLineNR term=bold gui=bold guifg=yellow
""hi CursorLine gui=underline cterm=underline
""hi CursorLine   cterm=NONE ctermbg=darkred ctermfg=white guibg=green guifg=white
""hi CursorColumn cterm=NONE ctermbg=darkred ctermfg=white guibg=green guifg=white
""nnoremap <Leader>c :set cursorline cursorcolumn<CR>
"nnoremap <Leader>c :hi cursorline guibg=#1F8C2C<CR>:hi cursorcolumn guibg=#1F8C2C<CR>
"nnoremap <Leader>d :hi clear cursorline<CR>:hi clear cursorcolumn<CR>
""nnoremap <Leader>d :hi clear cursorline<CR>:hi clear cursorcolumn<CR>:hi CursorLineNR guifg=yellow<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mappings
noremap <C-Right> :bn<CR>
noremap <C-j> :bn<CR>
noremap <C-Left> :bp<CR>
noremap <C-k> :bp<CR>
noremap <A-j> :cn<CR>
noremap <A-k> :cp<CR>
noremap <C-A-e> :NERDTree %<CR> " Open NERDTree with CRTL-ALT-e
noremap <Space> :set wrap! wrap?<CR> " Toggle line wrap
noremap <S-Space> :set hlsearch! hlsearch?<CR> " Toggle highlighting on/off, and show current value.
"nmap <silent> <leader>ev :e $MYVIMRC<CR> " Quickly edit the vimrc file
"nmap <silent> <leader>sv :so $MYVIMRC<CR> " Quickly reload the vimrc file
noremap <C-i> :set diffopt=filler,context:0 "Remove context from vimdiff
vnoremap ;rv c<C-O>:set revins<CR><C-R>"<Esc>:set norevins<CR> " reverse selected text (need to select first)
nnoremap ,cd :lcd %:p:h<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Macros
"let @e='11"myy1dd10dd:g/CLK_PERIOD/dgg:g!/ ns /dgg"mP'
let @a='Ipass itpp "€@7";j'


" Define 'Filter' command to copy lines matching a pattern to a new file
command! -nargs=? Filter let @a='' | execute 'g/<args>/y A' | enew | setlocal bt=nowrite | put! a
command! -nargs=? Filteri let @a='' | execute 'v/<args>/y A' | enew | setlocal bt=nowrite | put! a
command! -nargs=? Gbuf let @a='' | execute 'bufdo g/<args>/y A' | enew | setlocal bt=nowrite | put! a

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Folding
"set foldmethod=syntax
"set foldlevelstart=1
"let perl_fold=1
"let sh_fold_enabled=1
"let perl_extended_vars=1
"let perl_sync_dist=250


" Diff
set diffopt=context:0


" Fix weird characters in NerdTree
let g:NERDTreeDirArrows=0



"set verbosefile=/nfs/sc/disks/mdo_cnx_006/user/mabatall/vimlog
"set verbose=15


" When enabled, Vim will change into the folder of the file of the buffer. This is pretty handy because :e then works relative to the file. So for example if you are in foo/bar.py and want to edit foo/baz.py you only have to do :e baz.py.
"set autochdir


set isfname-==

set iskeyword+=-


" Ignore swp files in Explorer view
let g:netrw_list_hide= '.*\.swp$'

set noswapfile
