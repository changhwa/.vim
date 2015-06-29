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
Plug 'junegunn/vim-peekaboo'
Plug 'junegunn/vim-pseudocl'
Plug 'junegunn/vim-fnr'
Plug 'junegunn/vim-journal'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'junegunn/fzf',        { 'do': 'yes \| ./install' }
Plug 'gregsexton/gitv', { 'on': 'Gitv' }
Plug 'mbbill/undotree',             { 'on': 'UndotreeToggle'   }
Plug 'plasticboy/vim-markdown'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'JavaScript-Indent'
Plug 'jelera/vim-javascript-syntax'
Plug 'Shutnik/jshint2.vim'
Plug 'scrooloose/syntastic'
Plug 'mickaobrien/vim-stackoverflow'
Plug 'KabbAmine/gulp-vim'
Plug 'suan/vim-instant-markdown'

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
set diffopt=filler,vertical
set autoread
set completeopt=menuone,preview,longest
set backspace=indent,eol,start

set noimd
set imi=1
set ims=-1
set cindent
set smartindent

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

" <F10> | NERD Tree
inoremap <F10> <esc>:NERDTreeToggle<cr>
nnoremap <F10> :NERDTreeToggle<cr>

" <F11> | Tagbar
inoremap <F11> <esc>:TagbarToggle<cr>
nnoremap <F11> :TagbarToggle<cr>
let g:tagbar_sort = 0


" TODO from junegunn
function! s:todo() abort
  let entries = []
  for cmd in ['git grep -n -e TODO -e FIXME -e XXX 2> /dev/null',
            \ 'grep -rn -e TODO -e FIXME -e XXX * 2> /dev/null']
    let lines = split(system(cmd), '\n')
    if v:shell_error != 0 | continue | endif
    for line in lines
      let [fname, lno, text] = matchlist(line, '^\([^:]*\):\([^:]*\):\(.*\)')[1:3]
      call add(entries, { 'filename': fname, 'lnum': lno, 'text': text })
    endfor
    break
  endfor

  if !empty(entries)
    call setqflist(entries)
    copen
  endif
endfunction
command! Todo call s:todo()

" ----------------------------------------------------------------------------
" undotree
" ----------------------------------------------------------------------------
let g:undotree_WindowLayout = 2
nnoremap U :UndotreeToggle<CR>

" ----------------------------------------------------------------------------
" goyo.vim + limelight.vim
" ----------------------------------------------------------------------------
let g:limelight_paragraph_span = 1

function! s:goyo_enter()
  if has('gui_running')
    set fullscreen
    set background=light
    set linespace=7
  elseif exists('$TMUX')
    silent !tmux set status off
  endif
  " hi NonText ctermfg=101
  Limelight
endfunction

function! s:goyo_leave()
  if has('gui_running')
    set nofullscreen
    set background=dark
    set linespace=0
  elseif exists('$TMUX')
    silent !tmux set status on
  endif
  Limelight!
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

nnoremap <Leader>G :Goyo<CR>

" ----------------------------------------------------------------------------
" vim-markdown
" ----------------------------------------------------------------------------
let g:vim_markdown_initial_foldlevel = &foldlevelstart


"--------------------
" Syntastic settings
"--------------------
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*\ %t\ [%l\ %c]

let g:syntastic_html_checkers = [] " Don't check html files
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

