call plug#begin('~/.vim/plugged')

Plug 'junegunn/seoul256.vim'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug '~/.vim/my-plugged'
Plug 'pangloss/vim-javascript'
Plug 'groenewege/vim-less'
Plug 'Shougo/neocomplcache.vim'
Plug 'mustache/vim-mustache-handlebars'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'majutsushi/tagbar'
Plug 'tpope/vim-fugitive'
Plug 'kchmck/vim-coffee-script'

call plug#end()


colo seoul256
set background=dark
filetype plugin indent on
set nu
set ts=2
set regexpengine=1
set noswapfile
set history=999
set nobackup
set showcmd
set encoding=utf-8
set fileencoding=utf-8
set wic

syntax on
set showmatch 
set ruler 
set hlsearch
set ignorecase 
set shiftwidth=2
set softtabstop=2
set autoindent
set paste



" neocomplcache
let g:acp_enableAtStartup = 0
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_min_syntax_length = 2
let g:neocomplcache_enable_camel_case_completion = 1
if !exists('g:neocomplcache_wildcard_characters')
  let g:neocomplcache_wildcard_characters = {}
endif
let g:neocomplcache_wildcard_characters._ = '-'
let g:neocomplcache_enable_underbar_completion = 1
" neocomplcache와 함께 <TAB>키로 자동완성하기 위해 필수
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()

" omni completion.
set omnifunc=syntaxcomplete#Complete
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" vim-mustache-handlebars
let g:mustache_abbreviations = 1

" javascript-library-syntax
autocmd BufReadPre *.js let b:javascript_lib_use_jquery = 1
autocmd BufReadPre *.js let b:javascript_lib_use_underscore = 1
autocmd BufReadPre *.js let b:javascript_lib_use_backbone = 1
autocmd BufReadPre *.js let b:javascript_lib_use_handlebars = 1

" taglist
let g:tagbar_ctags_bin = '/usr/local/bin/ctags'
nmap <F8> :TagbarToggle<CR>

