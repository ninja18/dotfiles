" General Configuration

set expandtab		" enter spaces when tab is pressed
set textwidth=100	" break lines when line length crosses 120
set tabstop=4		" use 4 spaces to represent tab
set shiftwidth=4	" number of spaces to use for auto indent
set autoindent      " copy indent of current line to next line
set softtabstop=4   " to avoid mixing of tabs and spaces when tab is pressed
set undofile        " undo file to persist after closing and reopening file
set undodir=$HOME/.vim/undo
set hlsearch        " highlight searched word
set incsearch       " live highlighting while typing
set laststatus=2    " show status line below always (0 = never)
set ruler           " show line number and column number at the bottom
set showcmd         " show the command being typed at bottom
syntax enable       " syntax highlighting [enable => current color setting; on => overrides color setting]

augroup general
    " Check if autocmds already loaded
    if !exists("autocommands_loaded")
        let autocommands_loaded = 1
        autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab " yaml specific indentation
    endif
augroup END

