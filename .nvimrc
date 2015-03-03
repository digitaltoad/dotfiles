" Note: Skip initialization for vim-tiny or vim-small.
if !1 | finish | endif

if has('vim_starting')
  if &compatible
    set nocompatible               " Be iMproved
  endif

  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
" Refer to |:NeoBundle-examples|.
" Note: You don't set neobundle setting in .gvimrc!
NeoBundle 'vim-scripts/YankRing.vim'
NeoBundle 'mileszs/ack.vim'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'lukerandall/haskellmode-vim'
NeoBundle 'othree/html5.vim'
NeoBundle 'leshill/vim-json'
NeoBundle 'Kris2k/matchit'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'ervandew/supertab'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'vim-scripts/tComment'
NeoBundle 'godlygeek/tabular'
NeoBundle 'bling/vim-airline'
NeoBundle 'guns/vim-clojure-static'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'elixir-lang/vim-elixir'
NeoBundle 'tpope/vim-endwise'
NeoBundle 'tpope/vim-fireplace'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-git'
NeoBundle 'fatih/vim-go'
NeoBundle 'tpope/vim-haml'
NeoBundle 'mustache/vim-mustache-handlebars'
NeoBundle 'digitaltoad/vim-jade'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'mxw/vim-jsx'
NeoBundle 'groenewege/vim-less'
NeoBundle 'tpope/vim-markdown'
NeoBundle 'tpope/vim-rails'
NeoBundle 'thoughtbot/vim-rspec'
NeoBundle 'vim-ruby/vim-ruby'
NeoBundle 'tpope/vim-surround'
NeoBundle 'christoomey/vim-tmux-navigator'
NeoBundle 'chriskempson/base16-vim'

call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set hidden
set nobackup
set nowritebackup
set history=50 " keep 50 lines of command line history
set ruler " show the cursor position all the time
set showcmd " display incomplete commands
set incsearch " do incremental searching
set directory=~/.vimbackup
set t_Co=256
set nocursorline
set nocursorcolumn
set clipboard+=unnamedplus

syntax sync minlines=256

" Display extra whitespace
set list listchars=tab:»·,trail:·

" Numbers
set number
set numberwidth=5

" Tab completion options
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.class,.svn,*.pyc,tmp/*,storage/*,app/cache/*,node_modules/*

" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set expandtab

" Always display the status line
set laststatus=2

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
  set nohlsearch
endif

" tmux
if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

" Put these in an autocmd group, so that we can delete them easily.
augroup vimrcEx
au!

" Filetypes
augroup filetypedetect
  au BufRead,BufNewFile *           set expandtab tabstop=2 shiftwidth=2
  au BufRead,BufNewFile *.html      set expandtab tabstop=2 shiftwidth=2
  au BufRead,BufNewFile *.php       set filetype=php tabstop=4 shiftwidth=4 noexpandtab
  au BufRead,BufNewFile *.blade.php set filetype=blade
  au BufRead,BufNewFile *.json      set filetype=json
  au BufRead,BufNewFile *.tmux.conf set filetype=tmux
  au BufRead,BufNewFile *.twig      set filetype=twig
  au BufRead,BufNewFile *.hjs       set filetype=handlebars
  au BufRead,BufNewFile *.hjs.erb   let b:eruby_subtype='handlebars'
  au BufRead,BufNewFile *.hjs.erb   set filetype=eruby
  au BufRead,BufNewFile *.hbs.erb   let b:eruby_subtype='handlebars'
  au BufRead,BufNewFile *.hbs.erb   set filetype=eruby
  au BufRead,BufNewFile *.rabl      set filetype=ruby
  au BufRead,BufNewFile *.js.erb    let b:eruby_subtype='javascript'
  au BufRead,BufNewFile *.js.erb    set filetype=eruby
  au BufRead,BufNewFile *.go        set filetype=go tabstop=4 shiftwidth=4 noexpandtab
augroup end

" For all text files set 'textwidth' to 78 characters.
autocmd FileType text setlocal textwidth=78

" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
autocmd BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") |
  \   exe "normal g`\"" |
  \ endif

augroup END

" , is the leader character
let mapleader = ","

" Don't use Ex mode, use Q for formatting
map Q gq

" Clean trailing whitespace
nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\r//e<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>:retab<CR>

" No Help, please
nmap <F1> <Esc>

" CTags
let g:Tlist_Ctags_Cmd="ctags --languages=-JavaScript"
map <Leader>rt :!/usr/local/bin/ctags -R<CR><CR>

" Window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" NERDTree
let NERDTreeIgnore=['\.rbc$', '\~$']
nmap <leader>n :NERDTreeToggle <CR>

" Line position
map H ^
map L $

" CtrlP
let g:ctrlp_map = '<Leader>t'
map <Leader>b :CtrlPBuffer<CR>
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.git|\.hg|\.svn|tmp|\.sass-cache|node_modules)$',
  \ 'file': '\v\.(pyc|DS_Store)$',
  \ }
let g:ctrlp_match_window_reversed = 0

" Prettify JSON
map <leader>jt  <Esc>:%!python -mjson.tool<CR>

" syntastic
let g:syntastic_enable_signs=1
let g:syntastic_quiet_messages = {'level': 'warnings'}
let g:syntastic_auto_loc_list=2
let g:syntastic_mode_map= { 'mode': 'active',
                          \ 'active_filetypes': ['ruby', 'php', 'coffee', 'javascript'],
                          \ 'passive_filetypes': ['html', 'scss'] }

" Fugitive
map <leader>gs :Gstatus<CR>
map <leader>gc :Gcommit<CR>
map <leader>gd :Gdiff<CR>
map <leader>gv :Gitv<CR>

" Yankring
let g:yankring_persist = 1
let g:yankring_manage_numbered_reg = 1

" Airline
let g:airline_powerline_fonts=1
" let g:airline_theme='light'

" Custom color mappings
hi CtrlPMatch ctermfg=None ctermbg=None

" Tabularize
nmap <Leader>a, :Tabularize /,\zs/l0l1<CR>
nmap <Leader>a=> :Tabularize /=><CR>
nmap <Leader>a: :Tabularize /:\zs/l0l1<CR>

" vim-go
let g:go_auto_type_info = 0

" colors
let g:airline_theme='simple'
let base16colorspace=256
colorscheme base16-default

" JSX
let g:jsx_ext_required = 0

" Local config
if filereadable(".vimrc.local")
  source .vimrc.local
endif
