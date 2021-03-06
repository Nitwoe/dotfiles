set nocompatible              " be iMproved, required
filetype off                  " required
 
" set the runtime path to include Vundle and initialize
set rtp+=$HOME/.local/lib/python2.7/site-packages/powerline/bindings/vim/
set t_Co=256
 
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')
 
" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-bundler'
Plugin 'tpope/vim-haml'
Plugin 'gorodinskiy/vim-coloresque'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-obsession'
Plugin 'altercation/vim-colors-solarized'
Plugin 'nanotech/jellybeans.vim'
Plugin 'vim-scripts/tComment'
Plugin 'vim-ruby/vim-ruby'
" Plugin 'ecomba/vim-ruby-refactoring'
Plugin 'slim-template/vim-slim'
Plugin 'Shougo/unite.vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'ervandew/supertab'
Plugin 'scrooloose/syntastic'
Plugin 'vim-indent-guides'
Plugin 'kchmck/vim-coffee-script'
Plugin 'Shougo/vimproc.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'scrooloose/nerdtree'
Plugin 'AndrewRadev/inline_edit.vim'
Plugin 'chrisbra/csv.vim'
Plugin 'regedarek/ZoomWin'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tpope/vim-unimpaired'
Plugin 'mattn/gist-vim'
Plugin 'mattn/webapi-vim'
Plugin 'tpope/vim-fireplace'
Plugin 'guns/vim-clojure-static'
Plugin 'tpope/vim-classpath'
Plugin 'tpope/vim-leiningen'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'vim-scripts/Specky' 
Plugin 'digitaltoad/vim-jade'
Plugin 'plasticboy/vim-markdown'
Plugin 'msanders/snipmate.vim'
Plugin 'craigemery/vim-autotag'
Plugin 'leafgarland/typescript-vim'
Plugin 'noprompt/vim-yardoc'
Plugin 'janko-m/vim-test'
Plugin 'amperser/proselint', {'rtp': 'plugins/vim/syntastic_proselint'}
Plugin 'beloglazov/vim-online-thesaurus'
Plugin 'tpope/vim-abolish'
Plugin 'tpope/vim-repeat'
 
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList          - list configured plugins
" :PluginInstall(!)    - install (update) plugins
" :PluginSearch(!) foo - search (or refresh cache first) for foo
" :PluginClean(!)      - confirm (or auto-approve) removal of unused plugins
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
" Common settings
syntax enable
set backspace=2
filetype indent on
set autoindent
set number
set relativenumber
set nobackup
set tabstop=2
set shiftwidth=2
set expandtab
set nowrap
set hlsearch
set incsearch
set ignorecase
set smartcase
set gdefault
set notimeout
set timeout
set ttimeoutlen=10
set cursorline

set lazyredraw

" Remap leader to ,
let mapleader = " "
" Remap tabs keys
" tab map doesn't work in most terminals - should work fine in gvim
nnoremap <C-S-tab> :tabprevious<CR>
nnoremap <C-tab>   :tabnext<CR>
nnoremap <C-t>     :tabnew<CR>
" Unite vim remap
call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])
call unite#custom#source('file,file/new,buffer,file_rec,line', 'matchers', 'matcher_fuzzy')
" nnoremap <C-k> :<C-u>Unite -buffer-name=search -start-insert line<cr>
 
" CtrlP extensions
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlPLastMode'
let g:ctrlp_extensions = ['buffertag', 'tag', 'line', 'dir']
 
" Indentation
set ts=2 sw=2 et
let g:indent_guides_start_level=2
let g:indent_guides_guide_size=1
autocmd VimEnter * IndentGuidesEnable
 
" Shift + CTRL + arrows mods
if &term =~ '^screen'
    " tmux will send xterm-style keys when its xterm-keys option is on
    execute "set <xUp>=\e[1;*A"
    execute "set <xDown>=\e[1;*B"
    execute "set <xRight>=\e[1;*C"
    execute "set <xLeft>=\e[1;*D"
endif
 
set ttymouse=xterm2

" Plugins
 
call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])
call unite#custom#source('file_rec/async','sorters','sorter_rank')

" Syntastic conf
let g:syntastic_javascript_checkers = ['jsl']
let g:syntastic_markdown_checkers = ['proselint']
let g:syntastic_sass_check_partials = 0
let g:syntastic_sass_checkers=['']

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatusLineFlag()}
set statusline+=%*

let g:syntastic_enable_signs = 1
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = '~'
let g:gitgutter_sign_removed = '✗'
let g:syntastic_error_symbol = "✗"
 
set laststatus=2
set noshowmode
set wildmenu
set wildmode=list:longest,list:full
set wildignore=.git,*.swp,*/tmp/*
set mouse=a
let g:solarized_termtrans=1
augroup FastEscape
  autocmd!
  au InsertEnter * set timeoutlen=0
  au InsertLeave * set timeoutlen=1000
augroup END

" Move lines with C-Arrow 
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
inoremap <C-j> <Esc>:m .+1<CR>==gi
inoremap <C-k> <Esc>:m .-2<CR>==gi
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

nnoremap <left> <nop>
nnoremap <right> <nop>
nnoremap <up> <nop>
nnoremap <down> <nop>

syntax enable
set background=dark
colorscheme solarized
let g:solarized_termcolors=256
" airline customization
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
" vim-flay customization
let g:flay_on_open=1
let g:flay_on_save=1
let g:flay_piet_text="!!"

let g:jsx_ext_required = 0

augroup markdown
  au BufNewFile,BufReadPost *.md set filetype=markdown
  let g:markdown_fenced_languages = ['coffee', 'css', 'erb=eruby', 'javascript', 'js=javascript', 'json=javascript', 'ruby', 'rb=ruby', 'sass', 'xml', 'html', 'haml', 'cs']
  au BufReadPost *.md setlocal spell spelllang=en
  au BufReadPost *.md set wrap
  let g:online_thesaurus_keys = 0
  nnoremap <leader>ck :OnlineThesaurusCurrentWord<CR>
augroup END

augroup typescript
  autocmd QuickFixCmdPost [^l]* nested cwindow
  autocmd QuickFixCmdPost    l* nested lwindow
augroup END

augroup ruby
  autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
  autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
  autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
  autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
  autocmd FileType ruby,eruby nnoremap <leader>tf :TestFile<cr>
  autocmd FileType ruby,eruby nnoremap <leader>wtf oputs "#" * 90<c-m>puts caller<c-m>puts "#" * 90<esc>
augroup END
