set nocompatible

set pyxversion=3
set encoding=utf-8

call plug#begin('~/.vim/plugged')

" To install vim-plug help
Plug 'junegunn/vim-plug'

" General editor plugins
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'justinmk/vim-sneak'
Plug 'godlygeek/tabular'

" Wayland clipboard
Plug 'jasonccox/vim-wayland-clipboard'

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
Plug 'plasticboy/vim-markdown'
" Applies to all filetypes, not just md, and uses map instead of nore
" Not overly maintained, though doesn't really need to be
Plug 'jkramer/vim-checkbox'

Plug 'dhruvasagar/vim-table-mode'

" Solidity
Plug 'TovarishFin/vim-solidity'

" Ansi colored escape characters
Plug 'powerman/vim-plugin-AnsiEsc'
" This doesn't handle all the escape codes TODO troubleshoot
"Plug 'chrisbra/Colorizer'

" Vim language server client
Plug 'autozimu/LanguageClient-neovim', {
            \ 'branch': 'next',
            \ 'do': 'bash install.sh',
            \ }

if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  " Needs to have neovim python module installed
  Plug 'roxma/vim-hug-neovim-rpc'
endif

" Experiment with working in different python versions?
"Plug 'lambdalisue/vim-pyenv'

Plug 'Shougo/echodoc.vim'


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
if &term == 'alacritty'
    " Help vim choose mouse support for alacritty terminal
    " See https://vi.stackexchange.com/a/33013
    set ttymouse=sgr
endif

set cmdheight=2
set bs=2
set ts=8
set et
set sw=4
set sts=4
set conceallevel=2

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


" Start clientserver for terminal vim
" See :h vimtex-clientserver
if empty(v:servername) && exists('*remote_startserver')
  call remote_startserver('VIM')
endif


" Plugin settings
"""""""""""""""""
"let g:colorizer_auto_filetype='out'

let g:vim_markdown_math = 1
let g:vim_markdown_conceal_code_blocks = 0
let g:vim_markdown_follow_anchor = 1
let g:vim_markdown_strikethrough = 1
let g:vim_markdown_new_list_item_indent = 2

let g:airline#extensions#tabline#enabled = 1

let g:deoplete#enable_at_startup = 1

call deoplete#custom#option({
            \ 'yarp': v:true,
            \})

call deoplete#custom#var('omni', 'input_patterns', {
            \ 'tex': g:vimtex#re#deoplete
            \})

let g:LanguageClient_serverCommands = {
    \ 'haskell': ['hie-wrapper'],
    \ 'python': ['pylsp'],
    \ 'rust': ['rustup', 'run', 'stable', 'rls'],
    \ 'cpp': ['clangd'],
    \ 'c': ['clangd'],
    \ 'go': ['gopls'],
    \ }

" Automatically start LangServers
let g:LanguageClient_autoStart = 1

let g:LanguageClient_loggingLevel = 'INFO'
" LangClient won't run if log directory doesn't exist
if ! isdirectory($XDG_DATA_HOME . '/lsp')
    call mkdir($XDG_DATA_HOME . '/lsp', 'p', 0700)
endif
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

" vimtex settings
let g:tex_flavor = 'latex'
let g:vimtex_view_method = 'zathura'
let g:vimtex_quickfix_autoclose_after_keystrokes = 2
" Disable custom warnings based on regexp
    " For fancy stuff this is good to sort out, but very noisy for my normal
    " use-case
let g:vimtex_quickfix_ignore_filters = [
      \ 'Overfull \\hbox',
      \ 'Underfull \\hbox',
      \]
" TODO sumatra if on windows?
" uses latexmk by default, which is what we want
" xdotool with zathura?
" change default mappings from <Leader>l? clashes with lsp mappings

" Mappings
""""""""""
" Generally want the [nore] to avoid recursive mappings
" https://learnvimscriptthehardway.stevelosh.com/chapters/05.html

let maplocalleader = '-'

" Allows intuitive moving around wrapped lines, but jumping around via line number
" from https://blog.petrzemek.net/2016/04/06/things-about-vim-i-wish-i-knew-earlier/
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

" Insert mode: convert current word to uppercase
inoremap <C-u> <esc>viwUea

" NOTE: these clash with the default vimtex mappings if leader==localleader
noremap <Leader>lm :call LanguageClient_contextMenu()<CR>
noremap <Leader>lk :call LanguageClient#textDocument_hover()<CR>
noremap <Leader>ld :call LanguageClient#textDocument_definition()<CR>
noremap <Leader>lr :call LanguageClient#textDocument_rename()<CR>
noremap <Leader>lf :call LanguageClient#textDocument_formatting()<CR>
noremap <Leader>lb :call LanguageClient#textDocument_references()<CR>
noremap <Leader>la :call LanguageClient#textDocument_codeAction()<CR>
noremap <Leader>ls :call LanguageClient#textDocument_documentSymbol()<CR>

" LanguageClient commands in a new tab
noremap <Leader>ltm :tab call LanguageClient_contextMenu()<CR>
noremap <Leader>ltd :tab call LanguageClient#textDocument_definition()<CR>
noremap <Leader>ltb :tab call LanguageClient#textDocument_references()<CR>
noremap <Leader>lts :tab call LanguageClient#textDocument_documentSymbol()<CR>

" Move windows
" TODO fix - this doesn't work - (most?) terminals don't distinguish between capital
" and not
" would be nice to ctrl+shift+direction to move in a single keystroke
"nnoremap <C-H> <C-w>H
"nnoremap <C-J> <C-w>J
"nnoremap <C-K> <C-w>K
"nnoremap <C-L> <C-w>L

" Navigate around windows more easily
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" TODO neaten - so only applies to tex/latex filetypes etc
"'<,'>s/`\([^`]*\)`/\\code{\1}/g
" maybe add as a surround.vim
" can also handle normal mode change current
" convert markdown style inline code `something`, to latex \code{something}
" TODO remove it setting hlsearch - maybe via function-search-undo
vnoremap <Leader>cc :s/`\([^`]*\)`/\\code{\1}/g<CR>

" Copy/yank reference to current file path (relative path) and line number of
" cursor
" Example when the file name is "src/version.c", current dir "/home/mool/vim",
" cursor at line 423:
" sets the unnamed register to src/version.c:423

" Returns empty string, for use in mappings
def CopyCurrentPathWithLine(registerName: string = '"'): string
    # maybe use v:register instead for clipboard?
    var val: string
    var lineNos = sort([line('.'), line('v')])
    # which one is the smaller number, depends on the direction of the
    # selection. When selecting downwards, the cursor (.) is the larger
    # linenumber. And when selecting upwards, ('v') is.
    # See `:help line()`
    if lineNos[1] != lineNos[0]
        # we're in visual mode with more than 1 line selected
        val = expand('%:~:.') .. ':' .. lineNos[0] .. '-' .. lineNos[1]
    else
        val = expand('%:~:.') .. ':' .. lineNos[0]
    endif
    echon "Copied \"" val "\" to register '" registerName "'"
    setreg(registerName, val)
    return ""
enddef

vnoremap <expr> <Leader>r CopyCurrentPathWithLine('"')
nnoremap <expr> <Leader>r CopyCurrentPathWithLine('"')

" Shortchuts for clipboard mappings, recursive to work with wayland mappings
" https://github.com/jasonccox/vim-wayland-clipboard#non-recursive-mappings
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>P "+P
vmap <Leader>p "+p

nmap <Leader>y "+y
nmap <Leader>Y "+Y
vmap <Leader>y "+y
vmap <Leader>Y "+Y

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
let s:localvimrc = expand('~/.vimrc.local')
if filereadable(s:localvimrc)
    execute 'source' s:localvimrc
endif

