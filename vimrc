set nocompatible

call plug#begin('~/.vim/plugged')

" To install vim-plug help
Plug 'junegunn/vim-plug'

" nice haskell plugin - forked from dag/vim2hs
"Plug 'gnattishness/vim2hs'

"Plug 'godlygeek/tabular'

" Omni completion for haskell
"Plug 'eagletmt/neco-ghc'

" Cscope mappings
Plug 'gnattishness/cscope_maps'

Plug 'vim-erlang/vim-erlang-runtime'
Plug 'vim-erlang/vim-erlang-compiler'
Plug 'vim-erlang/vim-erlang-omnicomplete'
Plug 'vim-erlang/vim-erlang-tags'
Plug 'vim-erlang/vim-erlang-skeletons'
Plug 'vim-erlang/erlang-motions.vim'

Plug 'python-mode/python-mode', { 'branch': 'develop' }

"Plug 'scrooloose/nerdtree'
"Plug 'tpope/vim-fugitive'

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
set ruler
set t_Co=256
colo vividchalk

set bs=2
set ts=8
set et
set sw=4
set sts=4

"autocmd Filetype haskell setlocal sw=2 omnifunc=necoghc#omnifunc

set showmatch
set hlsearch
set incsearch

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

let g:pymode_python = 'python3'


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

