set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=/home/linuxbrew/.linuxbrew/opt/fzf
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

set swapfile
set dir=~/tmp

""""""""""""""""""""""" Plugins
Plugin 'VundleVim/Vundle.vim'

set rtp+=/usr/local/bin/fzf
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'mileszs/ack.vim'
Plugin 'nanotech/jellybeans.vim'
Plugin 'tpope/vim-rails'
Plugin 'christoomey/vim-tmux-runner'
Plugin 'gabebw/vim-spec-runner'
Plugin 'scrooloose/nerdcommenter'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
"Plugin 'scrooloose/syntastic'
Plugin 'sheerun/vim-polyglot'
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-endwise'
Plugin 'docunext/closetag.vim'
Plugin 'tpope/vim-sleuth'
Plugin 'w0rp/ale'

Plugin 'puppetlabs/puppet-syntax-vim'
Plugin 'hashivim/vim-terraform'

Plugin 'posva/vim-vue'

""""""""""""""""""""""""""""boiler plate
call vundle#end()
filetype plugin indent on

"""""""""""""""""""""""""""""""""""""""general
nmap <Leader>b :PluginInstall<CR>
map tp :tabp<kEnter>
map tn :tabn<kEnter>

" indentation
autocmd FileType ruby set shiftwidth=2
autocmd FileType js set shiftwidth=2
autocmd FileType vue set shiftwidth=2
autocmd FileType pug set shiftwidth=2

" other
" autoread

set shiftwidth=2

"""""""""""""""""""""""""""""""""""""""syntastic
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0

""need to set up actual syntastic checkers for ruby

"""""""""""""""""""""""""""""""""""""""fugitive (git + other git)
map blame :Gblame<kEnter>
map diff :Gdiff<kEnter>

""""""""""""""""""""""""""""""""""""""nerd commenter
map cc <leader>cc
map cu <leader>cu

"""""""""""""""""""""""""""""""""""""""tmux
nmap <Leader>o :VtrOpenRunner<CR>
nmap <Leader>s :VtrSendLinesToRunner<CR>
nmap <Leader>c :VtrKillRunner<CR>
nmap cl :VtrClearRunner<CR>

"""""""""""""""""""""""""""""""""""""specs

map <Leader>f <Plug>RunCurrentSpecFile
map <Leader>l <Plug>RunFocusedSpec
let g:spec_runner_dispatcher = 'call VtrSendCommand("{command}")'

"""""""""""""""""""""""""""""""""""""""color
set t_Co=256
colorscheme jellybeans
set background=dark
syntax on
""""""""""""""""""""""""""""""""""""""" fzf setup
nmap ; :Buffers<CR>
nmap <Leader>t :Tags<CR>
nmap <C-p> :Files<CR>
command! -bang -nargs=* Ag
  \ call fzf#vim#ag(<q-args>,
  \                 <bang>0 ? fzf#vim#with_preview('up:60%')
  \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
  \                 <bang>0)
"""""""""""""""""""""""""""""""""""""""""file search
let g:ackprg = 'ag --vimgrep'
nmap ack :Ack! "\b<cword>\b" <CR>
nmap <Leader>x :cclose<CR>

"""""""""""""""""""""""""""""""""""""""""ale configs
let g:ale_fixers = {
  \ '*': ['remove_trailing_lines', 'trim_whitespace'],
  \ 'ruby': ['rubocop'],
  \ 'javascript': ['eslint'],
  \ 'vue': ['eslint'],
  \ 'sass': ['sass-lint'],
  \ 'scss': ['scss-lint', 'prettier'],
  \ 'css': ['csslint', 'prettier']
  \ }

let g:ale_linters = {
  \ 'ruby': ['brakeman']
  \ }

map <Leader>af :ALEFix<cr>
