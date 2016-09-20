" Required:
call plug#begin(expand('~/.config/nvim/bundle/'))

Plug 'mileszs/ack.vim'
Plug 'mattn/emmet-vim'
Plug 'othree/html5.vim'
Plug 'Kris2k/matchit'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'vim-scripts/tComment'
Plug 'godlygeek/tabular'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'guns/vim-clojure-static'
Plug 'Lokaltog/vim-easymotion'
Plug 'elixir-lang/vim-elixir'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-git'
Plug 'fatih/vim-go'
Plug 'mustache/vim-mustache-handlebars'
Plug 'digitaltoad/vim-jade'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'groenewege/vim-less'
Plug 'tpope/vim-rails'
Plug 'thoughtbot/vim-rspec'
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-surround'
Plug 'christoomey/vim-tmux-navigator'
Plug 'othree/yajs.vim'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'mhinz/vim-startify'
Plug 'jiangmiao/auto-pairs'
Plug 'xsbeats/vim-blade'
Plug 'godlygeek/tabular'
Plug 'keith/swift.vim'
Plug 'tpope/vim-dispatch'
Plug 'ElmCast/elm-vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'ervandew/supertab'
Plug 'w0ng/vim-hybrid'
Plug 'sbdchd/airline-steve'

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
syntax sync minlines=256
let g:airline_theme='steve'
let airline#extensions#default#section_use_groupitems = 0
let g:hybrid_custom_term_colors = 1
let g:hybrid_reduced_contrast = 1
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
  au BufRead,BufNewFile *.elm       set tabstop=4 shiftwidth=4
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
"hi IndentGuidesOdd  guibg='#1d1f21'
"hi IndentGuidesEven guibg='#222427'

" deoplete
let g:deoplete#enable_at_startup = 1

" Startify
autocmd User Startified set buftype=
let g:startify_change_to_dir = 0

if $SIMPLE_TERMINAL
  colorscheme default
  let g:airline_powerline_fonts = 0
endif
