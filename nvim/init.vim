if has('vim_starting')
  " Required:
  set runtimepath+=~/.config/nvim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.config/nvim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
" Refer to |:NeoBundle-examples|.
" Note: You don't set neobundle setting in .gvimrc!
NeoBundle 'mileszs/ack.vim'
NeoBundle 'ctrlpvim/ctrlp.vim'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'othree/html5.vim'
NeoBundle 'Kris2k/matchit'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'vim-scripts/tComment'
NeoBundle 'godlygeek/tabular'
NeoBundle 'vim-airline/vim-airline'
NeoBundle 'vim-airline/vim-airline-themes'
NeoBundle 'guns/vim-clojure-static'
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'elixir-lang/vim-elixir'
NeoBundle 'tpope/vim-endwise'
NeoBundle 'tpope/vim-fireplace'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-git'
NeoBundle 'fatih/vim-go'
NeoBundle 'mustache/vim-mustache-handlebars'
NeoBundle 'digitaltoad/vim-jade'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'mxw/vim-jsx'
NeoBundle 'groenewege/vim-less'
NeoBundle 'tpope/vim-rails'
NeoBundle 'thoughtbot/vim-rspec'
NeoBundle 'vim-ruby/vim-ruby'
NeoBundle 'tpope/vim-surround'
NeoBundle 'christoomey/vim-tmux-navigator'
NeoBundle 'w0ng/vim-hybrid'
NeoBundle 'othree/yajs.vim'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'wakatime/vim-wakatime'
NeoBundle 'mhinz/vim-startify'
NeoBundle 'jiangmiao/auto-pairs'
NeoBundle 'xsbeats/vim-blade'
NeoBundle 'godlygeek/tabular'
NeoBundle 'keith/swift.vim'
NeoBundle 'tpope/vim-dispatch'
NeoBundle 'Valloric/YouCompleteMe', {
     \ 'build'      : {
        \ 'mac'     : './install.py',
        \ 'unix'    : './install.py',
        \ 'windows' : 'install.py',
        \ 'cygwin'  : './install.py'
        \ }
     \ }

let g:neobundle#install_process_timeout = 1500

call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set hidden
set noswapfile
set backupdir-=.
set backupdir^=~/tmp,/tmp
set history=50 " keep 50 lines of command line history
set ruler " show the cursor position all the time
set showcmd " display incomplete commands
set incsearch " do incremental searching
set nocursorline
set nocursorcolumn
set clipboard+=unnamedplus

" colors
syntax on
set nohlsearch
syntax sync minlines=256
let g:airline_theme='hybridline'
let airline#extensions#default#section_use_groupitems = 0
colorscheme hybrid
set background=dark

" Display extra whitespace
set list listchars=tab:»·,trail:·

" Numbers
set number
set numberwidth=5

" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set expandtab

" Put these in an autocmd group, so that we can delete them easily.
augroup vimrcEx
au!

" Filetypes
augroup filetypedetect
  au BufRead,BufNewFile *           set expandtab tabstop=2 shiftwidth=2
  au BufRead,BufNewFile *.html      set expandtab tabstop=2 shiftwidth=2
  au BufRead,BufNewFile *.php       set filetype=php tabstop=4 shiftwidth=4 "noexpandtab
  au BufRead,BufNewFile *.swift     set filetype=swift tabstop=4 shiftwidth=4 "noexpandtab
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

" Clean trailing whitespace
nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\r//e<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>:retab<CR>

" Window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Line position
map H ^
map L $

" General binds
map <C-s> <esc>:w<CR>
imap <C-s> <esc>:w<CR>

" NERDTree
let NERDTreeIgnore=['\.rbc$', '\~$']
nmap <leader>n :NERDTreeToggle <CR>

" CtrlP
let g:ctrlp_map = '<Leader>t'
map <Leader>b :CtrlPBuffer<CR>
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.git|\.hg|\.svn|tmp|\.sass-cache|node_modules|vendor|_build|deps)$',
  \ 'file': '\v\.(pyc|DS_Store)$',
  \ }
let g:ctrlp_match_window_reversed = 0
let g:ctrlp_show_hidden = 1

" Prettify JSON
map <leader>jt  <Esc>:%!python -mjson.tool<CR>

" syntastic
let g:syntastic_enable_signs=1
let g:syntastic_quiet_messages = {'level': 'warnings'}
let g:syntastic_auto_loc_list=2
let g:syntastic_mode_map= { 'mode': 'active',
                          \ 'active_filetypes': ['ruby', 'php', 'coffee', 'javascript'],
                          \ 'passive_filetypes': ['html', 'scss'] }
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_eslint_exec = 'eslint_d'

" Fugitive
map <leader>gs :Gstatus<CR>
map <leader>gc :Gcommit<CR>
map <leader>gd :Gdiff<CR>
map <leader>gv :Gitv<CR>

" Airline
let g:airline_powerline_fonts=1

" Custom color mappings
hi CtrlPMatch ctermfg=None ctermbg=None

" Tabularize
nmap <Leader>a, :Tabularize /,\zs/l0l1<CR>
nmap <Leader>a=> :Tabularize /=><CR>
nmap <Leader>a: :Tabularize /:\zs/l0l1<CR>
nmap <Leader>ai :Tabularize /from/<CR>

" vim-go
let g:go_auto_type_info = 0

" JSX
let g:jsx_ext_required = 0

" Indent Guides
let g:indent_guides_auto_colors = 0
let g:indent_guides_enable_on_vim_startup = 1
hi IndentGuidesOdd  guibg='#1d1f21'
hi IndentGuidesEven guibg='#222427'

" Startify
autocmd User Startified set buftype=
let g:startify_change_to_dir = 0

if $SIMPLE_TERMINAL
  colorscheme default
  let g:airline_powerline_fonts = 0
endif
