" GENERAL CONFIGURATION

let mapleader = " "     " global leader key
let maplocalleader = " " " local leader key
set expandtab		    " enter spaces when tab is pressed
" set textwidth=100	    " break lines when line length crosses 120
set tabstop=4		    " use 4 spaces to represent tab
set shiftwidth=4	    " number of spaces to use for auto indent
set autoindent          " copy indent of current line to next line
set softtabstop=4       " to avoid mixing of tabs and spaces when tab is pressed
set undofile            " undo file to persist after closing and reopening file
set undodir=$XDG_CACHE_HOME/nvim/undo
set hlsearch            " highlight searched word
set incsearch           " live highlighting while typing
set laststatus=2        " show status line below always (0 = never)
set ruler               " show line number and column number at the bottom
set showcmd             " show the command being typed at bottom
set termguicolors       " for vibrant colors
syntax enable           " syntax highlighting [enable => current color setting; on => overrides color setting]
set mouse=nicr          " mouse support in normal, insert, cmd line mode
set backspace=2         " backspace to do indent,eol,start based working
set cmdheight=2         " make command line height to 2 
set number relativenumber " set hybrid line number
set foldmethod=expr     " using nvim tree-sitter feature for folding
set foldexpr=nvim_treesitter#foldexpr() " using nvim tree-sitter feature for foldin

" spell check and correct 
setlocal spell
set spelllang=en_gb

filetype plugin indent on " enable filetype detection and plugins and indent based on filetype

" My Auto commands

" Filetype based indentation
augroup fileTypeIndent
        autocmd!
        autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab " yaml specific indentation
augroup END

" hybrid number toggle 
augroup numberToggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

" Reloads vimrc after saving but keep cursor position
if !exists('*ReloadVimrc')
   fun! ReloadVimrc()
       let save_cursor = getcurpos()
       source $MYVIMRC
       call setpos('.', save_cursor)
   endfun
endif
autocmd! BufWritePost $MYVIMRC call ReloadVimrc()

" autocmd BufWinLeave *.* mkview
" autocmd BufWinEnter *.* silent loadview

" Overriding default programs
let g:python3_host_prog = "$HOME/.pyenv/shims/python"       " python path since using pyenv
set grepprg=rg\ --vimgrep\ --smart-case\ --hidden\ --follow " replacing grep program with ripgrep when using ':grep pat'

" General Keybindings

" keybindings to activate very magic mode 1. vm mode in normal search 2. vm mode in visual search 
" 3. global cmd search and replace or any actions 4. vm mode in search and replace 5. search and
" replace the word under cursor 6. open init.vim faster
nnoremap / /\v
vnoremap / /\v
nnoremap :g/ :g/\v
nnoremap :g// :g//
cnoremap %s/ %smagic/
cnoremap s/ smagic/
nnoremap <leader>s :%smagic/\<<C-r><C-w>\>/
nnoremap <Leader>v :tabe $MYVIMRC<cr>

" NETRW File Explorer Config

let g:netrw_banner = 0                          " hide the banner 
let g:netrw_altfile = 0                         " When pressed Ctrl-^ goes to browsing buffer(file explorer)
let netrw_compress = "gzip"                     " program used to compress file when pressing 'mz'
let netrw_winsize = 70                          " percentage of newly opened file's window size from netrw
let netrw_keepdir = 0                           " make browsing dir as current dir(useful when moving and copying files to dir)
let netrw_liststyle = 3                         " simple style of listing files (pressing i will change style)
let netrw_list_hide = ""    " to hide pattern of files, gitignore can also be used [yet to configure]
let g:netrw_special_syntax = 1                  " highlight some file types 


" PLUGIN MANAGEMENT

call plug#begin()

    Plug 'KeitaNakamura/tex-conceal.vim', {'for': 'tex'} " add more support to conceal feature of vim
    Plug 'Olical/conjure', {'tag': 'v4.5.0'} " repl and completion support for clojure and other lisp based languages
    Plug 'SirVer/ultisnips' " snippet plugin
    Plug 'christoomey/vim-tmux-navigator' " navigating panes using Ctrl-hjkl between vim and tmux
    Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' } " go development
    Plug 'guns/vim-sexp' " edit s-expressions using vim grammer
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " fzf binary required for vim; should be already installed
    Plug 'junegunn/fzf.vim' " fzf vim support plugin 
    Plug 'lervag/vimtex' " latex support for vim
    Plug 'lifepillar/vim-gruvbox8' " current colorscheme very vibrant
    Plug 'mbbill/undotree' " undotree to track branches of history
    Plug 'neovim/nvim-lspconfig' " set of configs for all common languages, to be used with nvim's builtin lsp client
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} " new way to highlight, indent and fold code, auto update
    Plug 'p00f/nvim-ts-rainbow' " default rainbow plugin not working after installing treesitter
    Plug 'tpope/vim-repeat' " remaps . command to repeat even what plugins do (only applies if plugins make use of it
    Plug 'tpope/vim-sexp-mappings-for-regular-people' " vim-sexp mappings without meta key
    Plug 'tpope/vim-surround' " surround everything with vim grammer ds cs yss

call plug#end()

" PLUGIN CONFIGURATIONS & KEYBINDINGS

" colorscheme
colorscheme gruvbox8 " quite vibrant but couldn't find a better one (non-colorschemes work only after calling the plug cmd. So putting it here 

" fzf
let $FZF_DEFAULT_COMMAND = "rg --files --hidden -g '!.git' -g '!Library' -g '!Music'" " have to override default fzf command in vim as well
let g:fzf_preview_window = ''           " disable fzf preview window while searching; to enable 'right:60%'
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6, 'border': 'rounded'} } " pop up size
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

" Rainbow config
let g:rainbow_active = 1 " to toggle rainbow plugin [might need to avoid some colors see junegunn's plugin]

" Clojure-static config [builtin-plugin]
let g:clojure_syntax_keywords = {
    \ 'clojureMacro': ["defproject", "defcustom"],
    \ 'clojureFunc': ["string/join", "string/replace"]
    \ }
let g:clojure_align_multiline_strings = 1 " align multiline strings
let g:clojure_align_subforms = 1 " align subforms

" Vim-go config
let g:go_highlight_types = 1
let g:go_highlight_functions = 1

" Neovim LSP config
:lua << EOF
require'lspconfig'.jdtls.setup{}
require'lspconfig'.gopls.setup{}
require'lspconfig'.pyls.setup{}
EOF
" cmd = {"gopls","-remote","localhost:7050"};
nnoremap <silent> gd    <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> <c-]> <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>

autocmd Filetype java,python,go setlocal omnifunc=v:lua.vim.lsp.omnifunc

" Nvim tree-sitter config
:lua <<EOF
require'nvim-treesitter.configs'.setup {
  highlight = { enable = true },
  incremental_selection = { enable = true },
  textobjects = { enable = true },
  rainbow = {
      enable = true,
      max_file_lines = 1000,
  }
}
EOF

" Undo tree Config
let g:undotree_SetFocusWhenToggle = 1
let g:undotree_ShortIndicators = 1
let g:undotree_WindowLayout = 2
nnoremap <Leader>ut :UndotreeToggle<CR>

" My lua functions
:lua << EOF
local api = vim.api
function foldTill(match)
    out = api.nvim_exec("g/Weekly/#",true)
    print("Do you want to fold this: " .. out)
end
EOF
