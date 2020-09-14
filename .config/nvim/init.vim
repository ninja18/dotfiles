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
set termguicolors       " for vibrant colors
colorscheme desert      " desert and evening are decent looking 
syntax enable           " syntax highlighting [enable => current color setting; on => overrides color setting]
set mouse=nicr          " mouse support in normal, insert, cmd line mode
set backspace=2         " backspace to do indent,eol,start based working
set cmdheight=2         " make command line height to 2 

augroup general
    " Check if autocmds already loaded
    if !exists("autocommands_loaded")
        let autocommands_loaded = 1
        autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab " yaml specific indentation
    endif
augroup END

" Overriding default programs
let g:python3_host_prog = "$HOME/.pyenv/shims/python"       " python path since using pyenv
set grepprg=rg\ --vimgrep\ --smart-case\ --hidden\ --follow " replacing grep program with ripgrep when using ':grep pat'


" NETRW File Explorer Config

let g:netrw_banner = 0                          " hide the banner 
let g:netrw_altfile = 0                         " When pressed Ctrl-^ goes to browsing buffer(file explorer)
let netrw_compress = "gzip"                     " program used to compress file when pressing 'mz'
let netrw_winsize = 70                          " percentage of newly opened file's window size from netrw
let netrw_keepdir = 0                           " make browsing dir as current dir(useful when moving and copying files to dir)
let netrw_liststyle = 0                         " simple style of listing files (pressing i will change style)
let netrw_list_hide = netrw_gitignore#Hide()    " to hide pattern of files, gitignore can also be used [yet to configure]
let g:netrw_special_syntax = 1                  " highlight some file types 


" PLUGIN MANAGEMENT

call plug#begin()

    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " fzf binary required for vim; should be already installed
    Plug 'junegunn/fzf.vim' " fzf vim support plugin 
    Plug 'christoomey/vim-tmux-navigator' " navigating panes using Ctrl-hjkl between vim and tmux
    Plug 'lervag/vimtex' " latex support for vim
    Plug 'KeitaNakamura/tex-conceal.vim', {'for': 'tex'} " add more support to conceal feature of vim
    Plug 'SirVer/ultisnips' " snippet plugin

call plug#end()

" PLUGIN CONFIGURATIONS & KEYBINDINGS

" fzf
let $FZF_DEFAULT_COMMAND = "rg --files --hidden -g '!.git' -g '!Library' -g '!Music'" " have to override default fzf command in vim as well
let g:fzf_preview_window = ''           " disable fzf preview window while searching; to enable 'right:60%'
nnoremap <leader>fi  :Files<CR> 
nnoremap <leader>fg  :GFiles?<CR>
nnoremap <leader>fl  :Lines<CR>
nnoremap <leader>fr  :Rg<CR>
nnoremap <leader>fb  :Buffers<CR>
nnoremap <leader>fh  :History<CR>
nnoremap <leader>fs  :History/<CR>
nnoremap <leader>fc  :History:<CR>
nnoremap <leader>fC  :Colors<CR>

" vimtex
let g:tex_flavor = 'latex'              " tex type either latex,plain,etc
let g:vimtex_view_method = 'zathura'    " pdf viewer to use when running view cmd
let g:vimtex_quickfix_mode = 0          " to avoid error window unless manually called 

" tex-conceal
set conceallevel=1                      " try to conceal or show the normal text
let g:tex_conceal = 'abdmg'             " convert tex to actual utf-8 characters only super and subscript is left out
" let g:tex_superscripts =  [0-9a-zA-W.,:;+-<>/()=]  " super scripts only allowed by the font [yet to try and refine]
" let g:tex_subscripts = [0-9aehijklmnoprtuvx,+-/().] " sub scripts only allowed by the font [yet to try and refine]
let g:tex_conceal_frac = 1                " to conceal fraction of 1
hi Conceal guibg=none 
hi Conceal cterm=none

" ultisnips
let g:UltiSnipsExpandTrigger = "<tab>"          " expand the snippet on tab
let g:UltiSnipsJumpForwardTrigger = "<tab>"     " jump to next placeholder on tab
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"  " jump back to previous on shift tab 
let g:UltiSnipsEditSplit="horizontal"             " use vertical split for snippet edit 
set rtp+=~/Documents/Physics/current-course     " use snippets from this path also

" Inkscape Configuration 

" to open inkscape with given title in insert mode
inoremap <C-f> <Esc>: silent exec '.!inkscape-figures create "'.getline('.').'" "'.b:vimtex.root.'/figures/"'<CR><CR>:w<CR>
" open popup to search for inkscape files in figures/ folder in normal mode
nnoremap <C-f> : silent exec '!inkscape-figures edit "'.b:vimtex.root.'/figures/" > /dev/null 2>&1 &'<CR><CR>:redraw!<CR>
