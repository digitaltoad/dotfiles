" Required:
call plug#begin(expand('~/.config/nvim/bundle/'))

Plug 'mileszs/ack.vim'
Plug 'mattn/emmet-vim'
Plug 'othree/html5.vim'
Plug 'Kris2k/matchit'
Plug 'scrooloose/nerdtree'
" Plug 'w0rp/ale'
Plug 'vim-scripts/tComment'
Plug 'godlygeek/tabular'
Plug 'vim-airline/vim-airline'
Plug 'Lokaltog/vim-easymotion'
Plug 'elixir-lang/vim-elixir', { 'for': 'elixir' }
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-git'
Plug 'fatih/vim-go', { 'for': 'golang' }
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'mxw/vim-jsx', { 'for': 'javascript' }
Plug 'groenewege/vim-less'
Plug 'tpope/vim-rails', { 'for': 'ruby' }
Plug 'thoughtbot/vim-rspec', { 'for': 'ruby' }
Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }
Plug 'tpope/vim-surround'
Plug 'christoomey/vim-tmux-navigator'
Plug 'othree/yajs.vim', { 'for': 'javascript' }
Plug 'mhinz/vim-startify'
Plug 'jiangmiao/auto-pairs'
Plug 'xsbeats/vim-blade', { 'for': 'php' }
Plug 'keith/swift.vim', { 'for': 'swift' }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
Plug 'autozimu/LanguageClient-neovim', {
      \ 'branch': 'next',
      \ 'do': 'bash install.sh'
      \ }
Plug 'ervandew/supertab'
Plug 'mitsuse/autocomplete-swift', { 'for': 'swift' }
Plug 'HerringtonDarkholme/yats.vim', { 'for': ['typescript', 'typescript.tsx'] }
Plug 'mhartington/nvim-typescript', {'do': './install.sh', 'for': ['typescript', 'typescript.tsx'] }
Plug 'slashmili/alchemist.vim', { 'for': 'elixir' }
Plug 'rust-lang/rust.vim', { 'for': 'rust' }
Plug 'cespare/vim-toml', { 'for': 'toml' }
Plug 'jparise/vim-graphql', { 'for': 'graphql' }
Plug 'rhysd/vim-crystal', { 'for': 'crystal' }
Plug 'rakr/vim-one'
Plug 'joshdick/onedark.vim'

call plug#end()

" Required:
filetype plugin indent on


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
set termguicolors
syntax on
set nohlsearch
set lazyredraw
syntax sync minlines=256
let g:airline_theme='onedark'
let airline#extensions#default#section_use_groupitems = 0
colorscheme onedark
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

" Filetypes
augroup filetypedetect
  au BufEnter * call ncm2#enable_for_buffer()
  au BufRead,BufNewFile *           setlocal expandtab tabstop=2 shiftwidth=2
  au BufRead,BufNewFile *.html      setlocal expandtab tabstop=2 shiftwidth=2
  au BufRead,BufNewFile *.php       setlocal filetype=php tabstop=4 shiftwidth=4 "noexpandtab
  au BufRead,BufNewFile *.swift     setlocal filetype=swift tabstop=4 shiftwidth=4 "noexpandtab
  au BufRead,BufNewFile *.leaf      setlocal filetype=html tabstop=4 shiftwidth=4 "noexpandtab
  au BufRead,BufNewFile *.blade.php setlocal filetype=blade
  au BufRead,BufNewFile *.json      setlocal filetype=json
  au BufRead,BufNewFile *.tmux.conf setlocal filetype=tmux
  au BufRead,BufNewFile *.twig      setlocal filetype=twig
  au BufRead,BufNewFile *.rabl      setlocal filetype=ruby
  au BufRead,BufNewFile *.js.erb    let b:eruby_subtype='javascript'
  au BufRead,BufNewFile *.js.erb    setlocal filetype=eruby
  au BufRead,BufNewFile *.go        setlocal filetype=go tabstop=4 shiftwidth=4 noexpandtab
  au BufRead,BufNewFile *.rs        setlocal filetype=rust tabstop=4 shiftwidth=4
  au BufRead,BufNewFile .envrc      setlocal filetype=zsh
  au BufRead,BufNewFile Fastfile    setlocal filetype=ruby
  au BufRead,BufNewFile Appfile     setlocal filetype=ruby
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

" Prettify JSON
map <leader>jt  <Esc>:%!python -m json.tool<CR>

" FZF
map <leader>t :Files<CR>
map <leader>b :Buffers<CR>
map <leader>s :Ag

let g:fzf_colors =
\ { 'bg+':     ['bg', 'CursorLine', 'CursorColumn'] }

function! s:fzf_statusline()
  " Override statusline as you like
  highlight fzf1 ctermfg=161 ctermbg=251
  highlight fzf2 ctermfg=23 ctermbg=251
  highlight fzf3 ctermfg=237 ctermbg=251
  setlocal statusline=%#fzf1#\ >\ %#fzf2#fz%#fzf3#f
endfunction

autocmd! User FzfStatusLine call <SID>fzf_statusline()

" ALE
" let g:ale_completion_enabled = 0
" let g:ale_linters = {
"       \  'javascript': ['eslint'],
"       \  'typescript': ['tslint']
"       \}
" let g:ale_linters_explicit = 1

" Fugitive
map <leader>gs :Gstatus<CR>
map <leader>gc :Gcommit<CR>
map <leader>gd :Gdiff<CR>
map <leader>gv :Gitv<CR>

" Airline
let g:airline_powerline_fonts=1

" Tabularize
nmap <Leader>a, :Tabularize /,\zs/l0l1<CR>
nmap <Leader>a=> :Tabularize /=><CR>
nmap <Leader>a: :Tabularize /:\zs/l0l1<CR>
nmap <Leader>ai :Tabularize /from/<CR>

" vim-go
let g:go_auto_type_info = 0

" JSX
let g:jsx_ext_required = 0

" ncm2
set completeopt=noinsert,menuone,noselect
let g:SuperTabDefaultCompletionType = "context"

let g:LanguageClient_serverCommands = {
      \ 'rust': ['rls']
      \ }

" Automatically start language servers.
let g:LanguageClient_autoStart = 1

nnoremap <silent> K :call LanguageClient_textDocument_hover()
nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()

" Startify
autocmd User Startified set buftype=
let g:startify_change_to_dir = 0

if $SIMPLE_TERMINAL
  colorscheme default
  let g:airline_powerline_fonts = 0
endif
