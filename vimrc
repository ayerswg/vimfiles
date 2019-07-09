" Basic settings
autocmd!
set nocompatible
filetype plugin on
filetype plugin indent on

" Search down into subfolders
set path+=**

" Display all matching files when we tab complete
set wildmenu

syntax on
set hlsearch
set expandtab
set tabstop=4
set shiftwidth=4
set noswapfile
set linebreak
set clipboard=unnamed
set cursorline
set number
set backspace=indent,eol,start
set hidden
set tags=tags
set autoindent

" Netrw settings
" " Recursively delete directory in Netrw on second try
let g:netrw_localrmdir='rm -r'
" Remove netrw buffers
autocmd FileType netrw setl bufhidden=wipe
let g:netrw_fastbrowse = 0

" ALE Settings
let g:ale_completion_enabled = 1
set omnifunc=ale#completion#OmniFunc
let g:ale_set_balloons = 1
let g:ale_completion_delay = 500
"" Only allow manual linting
"let g:ale_lint_on_text_changed = 'never'
"let g:ale_lint_on_enter = 0
"let g:ale_lint_on_save = 0

" Modify statusline
set laststatus=2

" Make vimdiff colors something more usable, note that we are using the NR-8
" color scheme. To see how it looks run :highlight <Term>
highlight DiffChange cterm=none ctermfg=7 ctermbg=4
highlight DiffAdd cterm=none ctermfg=7 ctermbg=2
highlight DiffDelete cterm=none ctermfg=7 ctermbg=1
highlight DiffText cterm=bold ctermfg=7 ctermbg=5 

" Function to diff buffer against saved
function! s:DiffWithSaved()
  let filetype=&ft
  diffthis
  vnew | r # | normal! 1Gdd
  diffthis
  exe "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
endfunction
com! DiffSaved call s:DiffWithSaved()

" Make the current buffor the only one
command BufOnly %bd|e#|bd#
