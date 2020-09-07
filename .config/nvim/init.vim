" GENERAL CONFIGURATION

let mapleader = " "     " global leader key
let maplocalleader = " " " local leader key
set expandtab		    " enter spaces when tab is pressed
set textwidth=100	    " break lines when line length crosses 120
set tabstop=4		    " use 4 spaces to represent tab
set shiftwidth=4	    " number of spaces to use for auto indent
set autoindent          " copy indent of current line to next line
set softtabstop=4       " to avoid mixing of tabs and spaces when tab is pressed
set undofile            " undo file to persist after closing and reopening file
set undodir=$HOME/.vim/undo
set hlsearch            " highlight searched word
set incsearch           " live highlighting while typing
set laststatus=2        " show status line below always (0 = never)
set ruler               " show line number and column number at the bottom
set showcmd             " show the command being typed at bottom
syntax enable           " syntax highlighting [enable => current color setting; on => overrides color setting]

" Overriding default programs
set grepprg=rg\ --vimgrep\ --smart-case\ --hidden\ --follow " replacing grep program with ripgrep when using ':grep pat'

augroup general
    " Check if autocmds already loaded
    if !exists("autocommands_loaded")
        let autocommands_loaded = 1
        autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab " yaml specific indentation
    endif
augroup END

" PLUGIN MANAGEMENT

call plug#begin()

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " fzf binary required for vim; should be already installed
Plug 'junegunn/fzf.vim' " fzf vim support plugin 

call plug#end()

" PLUGIN CONFIGURATIONS & KEYBINDINGS

" fzf
let g:fzf_preview_window = '' " disable fzf preview window while searching; to enable 'right:60%'
nnoremap <leader>fi  :Files<CR> 
nnoremap <leader>fg  :GFiles?<CR>
nnoremap <leader>fl  :Lines<CR>
nnoremap <leader>fr  :Rg<CR>
nnoremap <leader>fb  :Buffers<CR>
nnoremap <leader>fh  :History<CR>
nnoremap <leader>fs  :History/<CR>
nnoremap <leader>fc  :History:<CR>
nnoremap <leader>fC  :Colors<CR>

