filetype off
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
filetype plugin indent on
set nocompatible
set modelines=0
let mapleader = ","
let maplocalleader = "-"
runtime plugin/matchit.vim
set scrolloff=3
set listchars=tab:>-,trail:·,eol:$,nbsp:¬
nmap <silent> <leader>s :set nolist!<CR>
set shortmess=atI

" Correct shell
set shell=bash\ -l

" Colorscheme
set t_Co=256
syntax enable
set background=dark
let g:solarized_termcolors=256
let g:solarized_termtrans=0
colorscheme solarized

" Rainbow parens

let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]

let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0

au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" Tabs and spaces
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab


set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
set termencoding=utf-8
set backspace=indent,eol,start
"set relativenumber
set number
set history=1000		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching
if has("autocmd")
  augroup vimrcEx
  au!
  autocmd! FileType text setlocal textwidth=78
  autocmd! BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif
  augroup END
else
  set autoindent
endif
set backup
function! InitBackupDir()
	let separator = "."
	let parent = $HOME .'/' . separator . 'vim/'
	let backup = parent . 'backup/'
	let tmp    = parent . 'tmp/'
	if exists("*mkdir")
		if !isdirectory(parent)
			call mkdir(parent)
		endif
		if !isdirectory(backup)
			call mkdir(backup)
		endif
		if !isdirectory(tmp)
			call mkdir(tmp)
		endif
	endif
	let missing_dir = 0
	if isdirectory(tmp)
		execute 'set backupdir=' . escape(backup, " ") . "/,."
	else
		let missing_dir = 1
	endif
	if isdirectory(backup)
		execute 'set directory=' . escape(tmp, " ") . "/,."
	else
		let missing_dir = 1
	endif
	if missing_dir
		echo "Warning: Unable to create backup directories: "
		. backup ." and " . tmp
		echo "Try: mkdir -p " . backup
		echo "and: mkdir -p " . tmp
		set backupdir=.
		set directory=.
	endif
endfunction
call InitBackupDir()
if has("autocmd")
  au! BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal g'\"" | endif
endif
au BufRead,BufNewFile *.tex set textwidth=78
set hidden
au! BufWinLeave *? silent! mkview
au! BufWinEnter *? silent! loadview
set viewoptions=folds,cursor
nnoremap ' `
nnoremap ` '
nnoremap t <C-]>
set undodir=~/.vim/undodir
set undofile
set undolevels=1000 "maximum number of changes that can be undone
set undoreload=1000 "maximum number lines to save for undo on a buffer reload
let @d="0f]lli[[A]],,d,,cx4l"
autocmd! BufNewFile,BufRead *.json set ft=javascript
autocmd! BufNewFile,BufRead Makefile set noet
let @a='yyp:s/./=/g, '

" Remove trailing whitespace
function! RemoveTrailingWS()
    let l:winview = winsaveview()
    silent! %s/\s\+$//e
    call winrestview(l:winview)
endfunction

au BufWritePre <buffer> call RemoveTrailingWS()

" Color column 80
hi ColorColumn ctermbg=52 guibg=darkred
set cc=80

" Instructions for noweb
au BufRead,BufNewFile *.nw set textwidth=78
au BufRead,BufNewFile *.nw set filetype=noweb
let noweb_backend = "tex"
let noweb_language = "python"
let noweb_fold_code = 1

" Miscellaneous
set hlsearch
nnoremap <leader><space> :noh<bar>set nospell<CR>
nnoremap <leader>z :set spell<cr>
nnoremap <tab> %
vnoremap <tab> %
hi CursorLine   cterm=NONE ctermbg=235
hi CursorColumn cterm=NONE ctermbg=235
au WinLeave * set nocursorline nocursorcolumn
au WinEnter * set cursorline
set cursorline
nnoremap <Leader>c :set cursorcolumn!<CR>

" Masochistic learning
"nnoremap <up> <nop>
"nnoremap <down> <nop>
"nnoremap <left> <nop>
"nnoremap <right> <nop>
"inoremap <up> <nop>
"inoremap <down> <nop>
"inoremap <left> <nop>
"inoremap <right> <nop>
nnoremap j gj
nnoremap k gk
inoremap jj <ESC>
"inoremap kk <ESC>
" Easy windows navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Settings for ScreenShell
let g:ScreenImpl = 'Tmux'

map ,t :w<CR>:Require<CR>:Eval (run-all-tests)<CR>

" Settings for VimClojure
let vimfiles=$HOME . "/.vim"
let sep=":"
let classpath = join(
    \[".",
   \ "src", "src/main/clojure", "src/main/resources",
   \ "test", "src/test/clojure", "src/test/resources",
   \ "classes", "target/classes",
   \ "lib/*", "lib/dev/*",
   \ "bin",
   \ vimfiles."/bundle/clojure/devel/lib/*"
   \],
   \ sep)
let vimclojureRoot = vimfiles."/bundle/clojure"
let vimclojure#HighlightBuiltins=1
let vimclojure#HighlightContrib=1
let vimclojure#DynamicHighlighting=1
let vimclojure#ParenRainbow=1
let vimclojure#WantNailgun = 1
let vimclojure#NailgunClient = vimclojureRoot."/bin/ng"
let vimclojure#SplitPos = "bottom"
let vimclojure#SplitSize = 6
let vimclojure#FuzzyIndent = 1

"nmap <silent> <Leader>sc :execute "ScreenShell lein nailgun<CR>"
" Start a generic Clojure repl (uses screen.vim)
"nmap <silent> <Leader>sC :execute "ScreenShell java -cp \"" . classpath . "\" clojure.main" <cr>

" YankRing
let g:yankring_history_file = '.yankring_history'
nnoremap <silent> <F11> :YRShow<CR>
nmap <silent> <Leader>p gp:YRPop<CR>

" Tabular
if exists(":Tabularize")
    nmap <Leader>a= :Tabularize /=<CR>
    vmap <Leader>a= :Tabularize /=<CR>
    nmap <Leader>a: :Tabularize /:\zs<CR>
    vmap <Leader>a: :Tabularize /:\zs<CR>
    nmap <Leader>a<space> :Tabularize / \zs<CR>
    vmap <Leader>a<space> :Tabularize / \zs<CR>
endif

set formatoptions-=t

if has("autocmd")
    autocmd! bufwritepost .vimrc source $MYVIMRC
endif
nmap <leader>v :tabedit $MYVIMRC<CR>

" Bubble lines
vmap <C-k> [egv
vmap <C-j> ]egv

" Working with tabs
nmap <Leader>l :tabnext<CR>
nmap <Leader>h :tabprev<CR>

" If running in GUI mode
"set go=m

" Diff current file with last saved version
command! DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
 \ | wincmd p | diffthis

" Change default split position
set splitbelow
set splitright
au BufRead * call matchadd('ErrorMsg', ' ')

" Configure SuperTab for nice autocomplete

let g:SuperTabDefaultCompletionType = "<c-x><c-o>"
"let g:SuperTabClosePreviewOnPopupClose = 1
