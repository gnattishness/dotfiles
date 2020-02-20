set nocompatible

set pyxversion=3

call plug#begin('~/.vim/plugged')

" To install vim-plug help
Plug 'junegunn/vim-plug'

" Editor Config settings
Plug 'editorconfig/editorconfig-vim'

" Cscope mappings
Plug 'gnattishness/cscope_maps'

" TODO replace with erlang lang server
Plug 'vim-erlang/vim-erlang-runtime'
Plug 'vim-erlang/vim-erlang-compiler'
Plug 'vim-erlang/vim-erlang-omnicomplete'
Plug 'vim-erlang/vim-erlang-tags'
Plug 'vim-erlang/vim-erlang-skeletons'
Plug 'vim-erlang/erlang-motions.vim'

" LaTeX
Plug 'lervag/vimtex'

" Nim
Plug 'zah/nim.vim'

" TOML
Plug 'cespare/vim-toml'

" Mediawiki
Plug 'chikamichi/mediawiki.vim'

" Markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }

" Solidity
Plug 'TovarishFin/vim-solidity'

" Vim language server client
Plug 'autozimu/LanguageClient-neovim', {
            \ 'branch': 'next',
            \ 'do': 'bash install.sh',
            \ }

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  " Needs to have neovim python module installed
  Plug 'roxma/vim-hug-neovim-rpc'
endif

Plug 'Shougo/echodoc.vim'

Plug 'scrooloose/nerdtree'
"Plug 'tpope/vim-fugitive'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Colorschemes
Plug 'tpope/vim-vividchalk'
Plug 'romainl/Apprentice'
Plug 'chriskempson/base16-vim'
Plug 'nanotech/jellybeans.vim'

call plug#end()


syntax on
filetype plugin indent on
set encoding=utf-8
set background=dark
set nowrap
set title
set number
set relativenumber
set ruler
colo vividchalk

if &term =~ '256color'
    " Disable Background Color Erase (BCE) so that color schemes
    " work properly when Vim is used inside tmux and GNU screen.
    " Thanks:
    " https://superuser.com/questions/457911/in-vim-background-color-changes-on-scrolling
    " https://sunaku.github.io/vim-256color-bce.html
    set t_ut=
endif

set cmdheight=2
set bs=2
set ts=8
set et
set sw=4
set sts=4

set showmatch
set hlsearch
set incsearch

" TODO better keystroke
set pastetoggle=<F2>

set mouse=a
set mousehide

"backup
set backup

" fine for multiple files with the same name
set directory=~/.vim/swaps//

" note: if editing multiple files with the same name,
" the backups wil overwrite eachother
set backupdir=~/.vim/backups

set tags+=./tags;,~/.common_tags

" Required for operations modifying multiple buffers like lsp rename.
set hidden

" Always draw sign column. Prevent buffer moving when adding/deleting sign.
set signcolumn=yes

" Default spelling
set spelllang=en_au

let g:tex_flavor = "latex"


" Plugin settings
"""""""""""""""""

let g:airline#extensions#tabline#enabled = 1

let g:deoplete#enable_at_startup = 1

call deoplete#custom#option({
            \ 'yarp': v:true,
            \})

if !exists('g:deoplete#omni#input_patterns')
    let g:deoplete#omni#input_patterns = {}
endif
let g:deoplete#omni#input_patterns.tex = g:vimtex#re#deoplete

let g:LanguageClient_serverCommands = {
    \ 'haskell': ['hie-wrapper'],
    \ 'python': ['pyls'],
    \ 'rust': ['rustup', 'run', 'stable', 'rls'],
    \ 'cpp': ['clangd'],
    \ 'c': ['clangd'],
    \ 'go': ['go-langserver'],
    \ }

" Automatically start LangServers
let g:LanguageClient_autoStart = 1

let g:LanguageClient_loggingLevel = 'INFO'
" LangClient won't run if log directory doesn't exist
call mkdir($XDG_DATA_HOME . "/lsp", "p", 0700)
let g:LanguageClient_loggingFile = expand($XDG_DATA_HOME . '/lsp/LanguageClient.log')
let g:LanguageClient_serverStderr = expand($XDG_DATA_HOME . '/lsp/LanguageServer.log')
" Gofmt on save
" TOOD autofmt for other file types too
autocmd BufWritePre *.go :call LanguageClient#textDocument_formatting_sync()

" to use if having trouble finding project root
"let g:LanguageClient_rootMarkers = ['*.cabal', 'stack.yaml']

hi link ALEError Error
hi Warning term=underline cterm=underline ctermfg=Yellow gui=undercurl guisp=Gold
hi link ALEWarning Warning
hi link ALEInfo SpellCap

" Echodoc settings
let g:echodoc#enable_at_startup = 1
let g:echodoc#type = 'signature'

" Markdown preview

" Mappings
""""""""""

" Allows intuitive moving around wrapped lines, but jumping around via line number
" from https://blog.petrzemek.net/2016/04/06/things-about-vim-i-wish-i-knew-earlier/
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

map <Leader>lm :call LanguageClient_contextMenu()<CR>
map <Leader>lk :call LanguageClient#textDocument_hover()<CR>
map <Leader>ld :call LanguageClient#textDocument_definition()<CR>
map <Leader>lr :call LanguageClient#textDocument_rename()<CR>
map <Leader>lf :call LanguageClient#textDocument_formatting()<CR>
map <Leader>lb :call LanguageClient#textDocument_references()<CR>
map <Leader>la :call LanguageClient#textDocument_codeAction()<CR>
map <Leader>ls :call LanguageClient#textDocument_documentSymbol()<CR>

" LanguageClient commands in a new tab
map <Leader>ltm :tab call LanguageClient_contextMenu()<CR>
map <Leader>ltd :tab call LanguageClient#textDocument_definition()<CR>
map <Leader>ltb :tab call LanguageClient#textDocument_references()<CR>
map <Leader>lts :tab call LanguageClient#textDocument_documentSymbol()<CR>

" Move windows
" TODO fix - this doesn't work - (most?) terminals don't distinguish between capital
" and not
nnoremap <C-H> <C-w>H
nnoremap <C-J> <C-w>J
nnoremap <C-K> <C-w>K
nnoremap <C-L> <C-w>L

" Navigate around windows more easily
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Settings from tutor
"map <silent> <F2> :Flisttoggle<CR>

" fi(n)         i: 0->n
" fj(n)         j: 0->n
" fk(n)         k: 0->n
" fd(x, n)      x: n-1->0
" fo(x, n)      x: 0->n
" fr(x, a, b)   x: a->b
" V             ArrayList
" xxx.pop()     xxx.remove(xxx.size()-1)

" N.B. \( means grouping ( means literal '('

"command R1 %s/fk(\([^,()]\+\(()[^,()]*\)\=\))/fo(k,\1)/ge
"command R2 %s/fj(\([^,()]\+\(()[^,()]*\)\=\))/fo(j,\1)/ge
"command R3 %s/fi(\([^,()]\+\(()[^,()]*\)\=\))/fo(i,\1)/ge
"command R4 %s/fd(\([^,()]\+\(()[^,()]*\)\=\),\([^,()]\+\(()[^,()]*\)\=\))/for(int \1=\3-1; \1>=0; --\1)/ge
"command R5 %s/fo(\([^,()]\+\(()[^,()]*\)\=\),\([^,()]\+\(()[^,()]*\)\=\))/fr(\1,0,\3)/ge
"command R6 %s/fr(\([^,()]\+\(()[^,()]*\)\=\),\([^,()]\+\(()[^,()]*\)\=\),\([^,()]\+\(()[^,()]*\)\=\))/for(int \1=\3; \1<\5; ++\1)/ge
"command R7 %s/\<vvi\>/vector< vi >/ge
"command R8 %s/\<vi\>/vector< Integer >/ge
"command R9 %s/\<vvd\>/vector< vd >/ge
"command R10 %s/\<vd\>/vector< Double >/ge
"command R11 %s/\<vvi\>/vector< ii >/ge
"command R12 %s/\<vector\>/ArrayList/ge
"command R13 %s/\<ll\>/long/ge
"command R14 %s/\<bool\>/boolean/ge
"command R15 %s/\<NULL\>/null/ge
"command R16 %s/\(\w\+\)\.pop_back()/\1.remove(\1.size()-1)/ge
"command R17 %s/\(\w\+\)\.back()/\1.get(\1.size()-1)/ge
"command R18 %s/\(\w\+\)\.pop_front()/\1.remove(0)/ge
"command R19 %s/\(\w\+\)\.front()/\1.get(0)/ge
"command R20 %s/\<top\>/peek/ge
"command R21 %s/\<pop\>/poll/ge
"command R22 %s/\<insert\>/add/ge
"command R23 %s/\<pb\>/add/ge
"command R24 %s/\<count\>/contains/ge
"command R25 %s/sz(\(\w\+\))/\1.size()/ge
"command R26 %s/\<empty\>/isEmpty/ge
"command R27 %s/\<string\>/String/ge
"command R28 %s/\<getInt\>/sc.nextInt/ge
"command R29 %s/\<getDouble\>/sc.nextDouble/ge
"command R30 %s/\<getToken\>/sc.nextToken/ge
"command R31 %s/\<System\.out\.\>//ge
"command R32 %s/\<System\.err\.printf(\>/fprintf(stderr, /ge
"command R33 %s/\<printf(\>/System.out.printf/ge
"command R34 %s/\<fprintf(stderr,\s*/System.err.printf(/ge
"
"
"nmap <F3> :R1<CR>:R2<CR>:R3<CR>:R4<CR>:R5<CR>:R6<CR>:R7<CR>:R8<CR>:R9<CR>:R10<CR>:R11<CR>:R12<CR>:R13<CR>:R14<CR>:R15<CR>:R16<CR>:R17<CR>:R18<CR>:R19<CR>:R20<CR>:R21<CR>:R22<CR>:R23<CR>:R24<CR>:R25<CR>:R26<CR>:R27<CR>:R28<CR>:R29<CR>:R30<CR>:R31<CR>:R32<CR>:R33<CR>:R34<CR>



" perl -ne 'chomp;$i++;s/\$/\\([^,)]\+\\)/g; s/ /\//; print "command R$i %s/$_/ge\n"'
"
" casey:
" perl -ne 'chomp;$i++;s/\$/\\([^,()]\\+\\(()[^,()]*\\)\\=\\)/g; s/ /\//; print "command R$i %s/$_/ge\n"'
"
"fk($) fo(k,\1)
"fj($) fo(j,\1)
"fi($) fo(i,\1)
"fd($,$) for(int \1=\3-1; \1>=0; --\1)
"fo($,$) fr(\1,0,\3)
"fr($,$,$) for(int \1=\3; \1<\5; ++\1)
"\<vvi\> V<vi>
"\<vi\> V<Integer>
"\<vd\> V<Double>
"\<V\> ArrayList
"\(\w\+\).pop() \1.remove(\1.size()-1)
"\(\w\+\).peek() \1.get(\1.size()-1)
"\<push\> add
"
" todo:
" .get()  .[cache[v]]

" Source local, device-specific settings.
let s:localvimrc = expand("~/.vimrc.local")
if filereadable(s:localvimrc)
    execute "source" s:localvimrc
endif

