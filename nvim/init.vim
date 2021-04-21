call plug#begin('~/.config/nvim/bundle')

if !exists('g:vscode')
  Plug 'mattn/emmet-vim'
  Plug 'othree/html5.vim'
  Plug 'Kris2k/matchit'
  Plug 'scrooloose/nerdtree'
  Plug 'vim-airline/vim-airline'
  Plug 'elixir-lang/vim-elixir', { 'for': 'elixir' }
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-git'
  Plug 'fatih/vim-go', { 'for': 'golang' }
  Plug 'othree/yajs.vim', { 'for': 'javascript' }
  Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
  Plug 'mxw/vim-jsx', { 'for': 'javascript' }
  Plug 'groenewege/vim-less'
  Plug 'tpope/vim-rails', { 'for': 'ruby' }
  Plug 'thoughtbot/vim-rspec', { 'for': 'ruby' }
  Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }
  Plug 'jiangmiao/auto-pairs'
  Plug 'christoomey/vim-tmux-navigator'
  Plug 'mhinz/vim-startify'
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
  Plug 'tomaskallup/vim-styled-components', { 'branch': 'main' }
  Plug 'slashmili/alchemist.vim', { 'for': 'elixir' }
  Plug 'rust-lang/rust.vim', { 'for': 'rust' }
  Plug 'cespare/vim-toml', { 'for': 'toml' }
  Plug 'jparise/vim-graphql', { 'for': ['graphql', 'typescript', 'typescript.tsx', 'javascript', 'javascript.jxs'] }
  Plug 'rhysd/vim-crystal', { 'for': 'crystal' }
  Plug 'rakr/vim-one'
  Plug 'joshdick/onedark.vim'
  Plug 'jez/vim-better-sml', { 'for': 'sml' }
  Plug 'vim-scripts/tComment'
  Plug 'mileszs/ack.vim'
endif

Plug 'asvetliakov/vim-easymotion'
Plug 'godlygeek/tabular'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-surround'

call plug#end()

" , is the leader character
let mapleader = ","

" Line position
map H ^
map L $

" Prettify JSON
map <leader>jt  <Esc>:%!python -m json.tool<CR>

" Tabularize
nmap <Leader>a, :Tabularize /,\zs/l0l1<CR>
nmap <Leader>a=> :Tabularize /=><CR>
nmap <Leader>a: :Tabularize /:\zs/l0l1<CR>
nmap <Leader>ai :Tabularize /from/<CR>

" set clipboard+=unnamedplus

if exists('g:vscode')
  filetype indent off

  map <Leader> <Plug>(easymotion-prefix)
  nmap <leader><leader> :call VSCodeNotify("workbench.action.quickOpen")<CR>
  xmap gc  <Plug>VSCodeCommentary
  nmap gc  <Plug>VSCodeCommentary
  omap gc  <Plug>VSCodeCommentary
  nmap gcc <Plug>VSCodeCommentaryLine
  nmap <leader>cf :call VSCodeNotify("workbench.action.formatDocument")<CR>
  nmap <leader>cd :call VSCodeNotify("editor.action.revealDefinition")<CR>
  nmap <leader>cr :call VSCodeNotify("workbench.action.goToReferences")<CR>
  nmap <leader>ga :call VSCodeNotify("git.stageSelectedRanges")<CR>
  nmap <leader>gA :call VSCodeNotify("git.stage")<CR>
  nmap <leader>gm :call VSCodeNotify("git.commitStaged")<CR>
  nmap <leader>gp :call VSCodeNotify("git.pushTo")<CR>
  nmap <leader>ghi :call VSCodeNotify("issue.createIssue")<CR>
  nmap <leader><Tab>. :call VSCodeNotify("vscodeWorkspaceSwitcher.openWorkspace")<CR>
  nmap <leader><Tab>s :call VSCodeNotify("vscodeWorkspaceSwitcher.saveWorkspace")<CR>

  nmap <leader>]d :call VSCodeNotify("editor.action.dirtydiff.next")<CR>
  nmap <leader>[d :call VSCodeNotify("editor.action.dirtydiff.previous")<CR>
  nmap <leader>]c :call VSCodeNotify("workbench.action.compareEditor.nextChange")<CR>
  nmap <leader>[c :call VSCodeNotify("workbench.action.compareEditor.previousChange")<CR>
  nmap <leader>]e :call VSCodeNotify("editor.action.marker.next")<CR>
  nmap <leader>[e :call VSCodeNotify("editor.action.marker.previous")<CR>

  nmap <leader>fm :call VSCodeNotify("fileutils.moveFile")<CR>
  nmap <leader>fn :call VSCodeNotify("extension.simpleNewFile")<CR>

  xnoremap <leader>ew :call VSCodeNotify("editor.emmet.action.wrapWithAbbreviation")<CR>
  xnoremap <leader>ei :call VSCodeNotify("editor.emmet.action.wrapIndividualLinesWithAbbreviation")<CR>

  nnoremap <silent> o <Cmd>call VSCodeNotify('editor.action.insertLineAfter')<CR>i
  nnoremap <silent> O <Cmd>call VSCodeNotify('editor.action.insertLineBefore')<CR>i

  highlight QuickScopePrimary guifg='#afff5f' gui=underline ctermfg=155 cterm=underline
  highlight QuickScopeSecondary guifg='#5fffff' gui=underline ctermfg=81 cterm=underline
else
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

  " colors
  set termguicolors
  syntax on
  set nohlsearch
  set ttyfast
  set lazyredraw
  syntax sync minlines=256
  " set background=dark

  " Display extra whitespace
  set list listchars=tab:»·,trail:·

  " Numbers
  set number
  set numberwidth=5

  " Softtabs, 2 spaces
  set tabstop=2
  set shiftwidth=2
  set expandtab

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
    au BufRead,BufNewFile *.ts        setlocal filetype=typescript tabstop=4 shiftwidth=4 expandtab
    au BufRead,BufNewFile *.tsx       setlocal filetype=typescript.tsx tabstop=4 shiftwidth=4 expandtab
    au BufRead,BufNewFile .envrc      setlocal filetype=zsh
    au BufRead,BufNewFile Fastfile    setlocal filetype=ruby
    au BufRead,BufNewFile Appfile     setlocal filetype=ruby
  augroup end

  let g:airline_theme='onedark'
  let airline#extensions#default#section_use_groupitems = 0
  colorscheme onedark

  " NERDTree
  let NERDTreeIgnore=['\.rbc$', '\~$']
  nmap <leader>n :NERDTreeToggle <CR>

  " FZF
  map <leader>t :Files<CR>
  map <leader>b :Buffers<CR>
  map <leader>s :Ag

  " Clean trailing whitespace
  nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\r//e<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>:retab<CR>

  " Window navigation
  nnoremap <C-h> <C-w>h
  nnoremap <C-j> <C-w>j
  nnoremap <C-k> <C-w>k
  nnoremap <C-l> <C-w>l

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

  " vim-go
  let g:go_auto_type_info = 0

  " JSX
  let g:jsx_ext_required = 0

  " ncm2
  set completeopt=noinsert,menuone,noselect
  let g:SuperTabDefaultCompletionType = "context"

  let g:LanguageClient_serverCommands = {
        \ 'rust': ['rustup', 'run', 'stable', 'rls'],
        \ 'crystal': ['scry'],
        \ 'python': ['pyls']
        \ }

  " Automatically start language servers.
  let g:LanguageClient_autoStart = 1

  nnoremap <silent> K :call LanguageClient_textDocument_hover()
  nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()

  map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
      \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
      \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

  " +---------------------------------------------+
  " |  Color Name  |         RGB        |   Hex   |
  " |--------------+--------------------+---------|
  " | Black        | rgb(40, 44, 52)    | #282c34 |
  " |--------------+--------------------+---------|
  " | White        | rgb(171, 178, 191) | #abb2bf |
  " |--------------+--------------------+---------|
  " | Light Red    | rgb(224, 108, 117) | #e06c75 |
  " |--------------+--------------------+---------|
  " | Dark Red     | rgb(190, 80, 70)   | #be5046 |
  " |--------------+--------------------+---------|
  " | Green        | rgb(152, 195, 121) | #98c379 |
  " |--------------+--------------------+---------|
  " | Light Yellow | rgb(229, 192, 123) | #e5c07b |
  " |--------------+--------------------+---------|
  " | Dark Yellow  | rgb(209, 154, 102) | #d19a66 |
  " |--------------+--------------------+---------|
  " | Blue         | rgb(97, 175, 239)  | #61afef |
  " |--------------+--------------------+---------|
  " | Magenta      | rgb(198, 120, 221) | #c678dd |
  " |--------------+--------------------+---------|
  " | Cyan         | rgb(86, 182, 194)  | #56b6c2 |
  " |--------------+--------------------+---------|
  " | Gutter Grey  | rgb(76, 82, 99)    | #4b5263 |
  " |--------------+--------------------+---------|
  " | Comment Grey | rgb(92, 99, 112)   | #5c6370 |
  " +---------------------------------------------+

  " let s:red = "#e06c75"
  " let s:dark_red = "#be5046"
  " let s:green = "#98c379"
  " let s:yellow = "#e5c07b"
  " let s:dark_yellow = "#d19a66"
  " let s:blue = "#61afef"
  " let s:purple = "#c678dd"
  " let s:cyan = "#56b6c2"
  " let s:white = "#abb2bf"
  " let s:black = "#282c34"
  " let s:comment_grey = "#5c6370"
  " let s:gutter_fg_grey = "#4b5263"

  let s:colors = onedark#GetColors()

  let s:red = s:colors.red
  let s:dark_red = s:colors.dark_red
  let s:green = s:colors.green
  let s:yellow = s:colors.yellow
  let s:dark_yellow = s:colors.dark_yellow
  let s:blue = s:colors.blue
  let s:purple = s:colors.purple
  let s:cyan = s:colors.cyan
  let s:white = s:colors.white
  let s:black = s:colors.black
  let s:visual_black = s:colors.visual_black " Black out selected text in 16-color visual mode
  let s:comment_grey = s:colors.comment_grey
  let s:gutter_fg_grey = s:colors.gutter_fg_grey
  let s:cursor_grey = s:colors.cursor_grey
  let s:visual_grey = s:colors.visual_grey
  let s:menu_grey = s:colors.menu_grey
  let s:special_grey = s:colors.special_grey
  let s:vertsplit = s:colors.vertsplit

  let s:group_colors = {} " Cache of default highlight group settings, for later reference via `onedark#extend_highlight`
  function! s:h(group, style, ...)
      let a:highlight = a:style
      let s:group_colors[a:group] = a:highlight " Cache default highlight group settings
      execute "highlight" a:group
        \ "guifg="   (has_key(a:highlight, "fg")    ? a:highlight.fg.gui   : "NONE")
        \ "guibg="   (has_key(a:highlight, "bg")    ? a:highlight.bg.gui   : "NONE")
        \ "guisp="   (has_key(a:highlight, "sp")    ? a:highlight.sp.gui   : "NONE")
        \ "gui="     (has_key(a:highlight, "gui")   ? a:highlight.gui      : "NONE")
  endfunction

  " call s:h("javascriptVariable", { "fg": s:purple })
  " call s:h("javascriptIdentifierName", { "fg": s:red })
  " call s:h("javascriptProp", { "fg": s:red })
  " call s:h("javascriptObjectLabel", { "fg": s:red })
  " call s:h("javascriptBrackets", { "fg": s:white })
  " call s:h("javascriptFuncArg", { "fg": s:red })
  " call s:h("typescriptImport", { "fg": s:purple })
  " call s:h("typescriptIdentifierName", { "fg": s:red })
  " call s:h("typescriptVariable", { "fg": s:purple })
  " call s:h("typescriptVariableDeclaration", { "fg": s:red })
  " call s:h("typescriptObjectLabel", { "fg": s:red })
  " call s:h("typescriptFuncCall", { "fg": s:blue })
  " call s:h("typescriptFuncKeyword", { "fg": s:purple })
  " call s:h("typescriptFuncComma", { "fg": s:white })
  " " call s:h("typescriptFuncCallArg", { "fg": s:red })
  " call s:h("typescriptGlobal", { "fg": s:red })
  " call s:h("typescriptCall", { "fg": s:red })
  " call s:h("typescriptConditionalParen", { "fg": s:red })
  " call s:h("typescriptBinaryOp", { "fg": s:cyan })
  " " call s:h("typescriptBlock", { "fg": s:red })
  " " call s:h("typescriptTernary", { "fg": s:red })
  " call s:h("typescriptTernaryOp", { "fg": s:purple })
  " call s:h("typescriptProp", { "fg": s:red })
  " call s:h("typescriptComputedPropertyName", { "fg": s:yellow })
  " call s:h("typescriptArrowFunc", { "fg": s:purple })
  " call s:h("typescriptPredefinedType", { "fg": s:yellow })
  " call s:h("typescriptClassKeyword", { "fg": s:purple })
  " call s:h("typescriptClassName", { "fg": s:yellow })
  " call s:h("typescriptClassExtends", { "fg": s:purple })
  " call s:h("typescriptClassHeritage", { "fg": s:green })
  " call s:h("typescriptClassStatic", { "fg": s:purple })
  " call s:h("typescriptInterfaceName", { "fg": s:yellow })
  " call s:h("typescriptInterfaceHeritage", { "fg": s:green })
  " call s:h("typescriptMember", { "fg": s:red })
  " call s:h("typescriptExport", { "fg": s:purple })
  " call s:h("typescriptAssign", { "fg": s:cyan })
  " call s:h("typescriptDefaultParam", { "fg": s:cyan })
  " call s:h("typescriptOperator", { "fg": s:purple })
  " call s:h("typescriptGlobalMethod", { "fg": s:blue })
  " call s:h("typescriptHeadersMethod", { "fg": s:blue })
  " call s:h("typescriptRequestMethod", { "fg": s:blue })
  " call s:h("typescriptRequestProp", { "fg": s:white })
  " call s:h("typescriptResponseMethod", { "fg": s:blue })
  " call s:h("typescriptResponseProp", { "fg": s:blue })
  " call s:h("typescriptXHRMethod", { "fg": s:blue })
  " call s:h("typescriptConstant", { "fg": s:yellow })
  "
  " call s:h("tsxTagName", { "fg": s:yellow })
  " call s:h("tsxIntrinsicTagName", { "fg": s:yellow })
  " call s:h("tsxTagName", { "fg": s:yellow })
  " call s:h("tsxEscJs", { "fg": s:red })
  " call s:h("tsxAttrib", { "fg": s:dark_yellow })
  " call s:h("tsxCloseString", { "fg": s:yellow })
  "
  " call s:h("rustKeyword", { "fg": s:purple })
  " call s:h("rustStructure", { "fg": s:purple })
  " call s:h("rustIdentifier", { "fg": s:yellow })

  let g:yats_host_keyword = 0

  " SML
  augroup vimbettersml
    au!

    " ----- Keybindings -----

    au FileType sml nnoremap <silent> <buffer> <leader>t :SMLTypeQuery<CR>
    au FileType sml nnoremap <silent> <buffer> gd :SMLJumpToDef<CR>

    " open the REPL terminal buffer
    au FileType sml nnoremap <silent> <buffer> <leader>is :SMLReplStart<CR>
    " close the REPL (mnemonic: k -> kill)
    au FileType sml nnoremap <silent> <buffer> <leader>ik :SMLReplStop<CR>
    " build the project (using CM if possible)
    au FileType sml nnoremap <silent> <buffer> <leader>ib :SMLReplBuild<CR>
    " for opening a structure, not a file
    au FileType sml nnoremap <silent> <buffer> <leader>io :SMLReplOpen<CR>
    " use the current file into the REPL (even if using CM)
    au FileType sml nnoremap <silent> <buffer> <leader>iu :SMLReplUse<CR>
    " clear the REPL screen
    au FileType sml nnoremap <silent> <buffer> <leader>ic :SMLReplClear<CR>
    " set the print depth to 100
    au FileType sml nnoremap <silent> <buffer> <leader>ip :SMLReplPrintDepth<CR>

    " ----- Other settings -----

    " Uncomment to try out conceal characters
    "au FileType sml setlocal conceallevel=2

    " Uncomment to try out same-width conceal characters
    "let g:sml_greek_tyvar_show_tick = 1
  augroup END

  " Startify
  autocmd User Startified set buftype=
  let g:startify_change_to_dir = 0

  if $SIMPLE_TERMINAL
    colorscheme default
    let g:airline_powerline_fonts = 0
  endif
endif

