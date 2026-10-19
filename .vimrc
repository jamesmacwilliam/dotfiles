set nocompatible              " be iMproved, required
filetype off                  " required

"line numbers
set nu!

"easily clear swap (install.sh creates ~/tmp)
set swapfile
set dir=~/tmp

" plugins are managed by packer in ~/.config/nvim/init.lua

filetype plugin indent on


"""""""""""""""""""""""""""""""""""""""general
map tp :tabp<kEnter>
map tn :tabn<kEnter>

" indentation
autocmd FileType ruby set shiftwidth=2
autocmd FileType python set shiftwidth=2
autocmd FileType js set shiftwidth=2
autocmd FileType ts set shiftwidth=2
autocmd FileType vue set shiftwidth=2
autocmd FileType pug set shiftwidth=2

" syntax highlighting
autocmd BufRead,BufNewFile *.erb set filetype=eruby.html

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
map blame :Git blame<kEnter>
map diff :Gdiffsplit<kEnter>

""""""""""""""""""""""""""""""""""""""nerd commenter
map cc <leader>cc
map cu <leader>cu

"""""""""""""""""""""""""""""""""""""""nav
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>

"""""""""""""""""""""""""""""""""""""""tmux
"remap \or
let g:VtrUseVtrMaps = 1
nmap <leader>pry :VtrOpenRunner {'cmd': 'bundle\ exec\ rails\ c'}<CR>
nmap <leader>s :VtrSendLinesToRunner<CR>
nmap <leader>o :VtrOpenRunner<CR>
nmap <leader>send :VtrSendLinesToRunner<CR>

"""""""""""""""""""""""""""""""""""""rails

map ev :Eview<CR>
map ec :Econtroller<CR>
map em :Emodel<CR>
map af :A<CR>

"""""""""""""""""""""""""""""""""""""specs

nmap <Leader>f :TestFile<CR>
nmap <Leader>ff :TestNearest<CR>
" run specs in vim-tmux-runner
let g:spec_runner_dispatcher = 'call VtrSendCommand("{command}")'

""""""""""""""""""""""""""""""""""""""" fzf setup
nmap ; :Buffers<CR>
nmap <Leader>t :Tags<CR>
nmap <C-p> :GFiles<CR>
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

"""""""""""""""""""""""""""""""""""""""color
set t_Co=256
syntax on
highlight Normal ctermbg=195
"""""""""light
silent! colorscheme solarized
set background=light
"colorscheme default
"set bg to light cyan1
"https://vim.fandom.com/wiki/Xterm256_color_names_for_console_Vim
"""""""""dark
silent! colorscheme jellybeans
set background=dark
