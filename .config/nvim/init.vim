" GENERAL CONFIGURATION

let mapleader=" "
let maplocalleader=" "
set encoding=utf-8
set background=dark
set shell=zsh
set hidden
setlocal spell
set spelllang=en_gb
set expandtab
set smarttab
set tabstop=4
set shiftwidth=4	    " number of spaces to use for auto indent
set autoindent          " copy indent of current line to next line
set softtabstop=4       " to avoid mixing of tabs and spaces when tab is pressed
set undofile
set undodir=$XDG_CACHE_HOME/nvim/undo
set hlsearch
set incsearch
set inccommand=split
set ignorecase
set laststatus=2        " show status line below always (0 = never)
set ruler               " show line number and column number at the bottom
set showcmd
set cmdheight=2
set number relativenumber " set hybrid line number
set termguicolors
syntax enable
set mouse=nicr          " mouse support in normal, insert, cmd line mode
set backspace=2         " backspace to do indent,eol,start based working
" set textwidth=120	    " break lines when line length crosses 120
set foldexpr=nvim_treesitter#foldexpr()
set foldmethod=expr     " using nvim tree-sitter feature for folding
let g:tex_flavor='latex'

filetype plugin indent on

" My Auto commands

" File type based indentation
augroup fileTypeIndent
        autocmd!
        autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab " yaml specific indentation
        autocmd BufNewFile,BufRead Jenkinsfile setf groovy
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

nnoremap / /\v
vnoremap / /\v
nnoremap :g/ :g/\v
nnoremap :g// :g//
cnoremap %s/ %smagic/
cnoremap s/ smagic/
nnoremap <leader>s :%smagic/\<<C-r><C-w>\>/
nnoremap <leader>v :tabe $MYVIMRC<cr>
nnoremap <leader>nh :nohl<cr>
nmap <S-Tab> :tabprev<Return>
nmap <Tab> :tabnext<Return>
nnoremap Y y$
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z
inoremap . .<c-g>u
inoremap , ,<c-g>u
inoremap <cr> <cr><c-g>u
vnoremap J :m '>+1<cr>gv=gv
vnoremap K :m '<-2<cr>gv=gv
nnoremap <leader>y "+y
vnoremap <leader>y "+y
nnoremap <leader>Y gg"+yG
nnoremap <Leader>+ :vertical resize +10<CR>
nnoremap <Leader>- :vertical resize -10<CR>
nnoremap <Leader>rp :resize 100<CR>

" NETRW File Explorer Config

let g:netrw_banner = 0                          " hide the banner 
let g:netrw_altfile = 0                         " When pressed Ctrl-^ goes to browsing buffer(file explorer)
let netrw_compress = "gzip"                     " program used to compress file when pressing 'mz'
let netrw_winsize = 70                          " percentage of newly opened file's window size from netrw
let netrw_keepdir = 0                           " make browsing dir as current dir(useful when moving and copying files to dir)
let netrw_liststyle = 3                         " simple style of listing files (pressing i will change style)
let netrw_list_hide = ""                        " to hide pattern of files, gitignore can also be used [yet to configure]
let g:netrw_special_syntax = 1                  " highlight some file types 


" PLUGIN MANAGEMENT

call plug#begin()

    Plug 'KeitaNakamura/tex-conceal.vim', {'for': 'tex'} " add more support to conceal feature of vim
    Plug 'Olical/conjure', {'tag': 'v4.5.0'} " repl and completion support for clojure and other lisp based languages
    Plug 'SirVer/ultisnips' " snippet plugin
    Plug 'christoomey/vim-tmux-navigator' " navigating panes using Ctrl-hjkl between vim and tmux
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
    Plug 'kyazdani42/nvim-tree.lua'
    Plug 'kyazdani42/nvim-web-devicons'
    Plug 'hrsh7th/nvim-cmp' " completion plugin
    Plug 'hrsh7th/cmp-buffer' " sources for nvim-cmp plugin
    Plug 'PaterJason/cmp-conjure'
    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'hrsh7th/cmp-path'
    Plug 'hrsh7th/cmp-nvim-lua'
    Plug 'kdheepak/cmp-latex-symbols'
    Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
    Plug 'vimwiki/vimwiki'
    Plug 'tpope/vim-dispatch' " Setup key mappings
    Plug 'radenling/vim-dispatch-neovim'
    Plug 'clojure-vim/vim-jack-in' " setup key mappings
    Plug 'tpope/vim-fugitive'

call plug#end()

" PLUGIN CONFIGURATIONS & KEYBINDINGS

" colorscheme
colorscheme gruvbox8 " quite vibrant but couldn't find a better one (non-colorschemes work only after calling the plug cmd. So putting it here 

" fzf
let $FZF_DEFAULT_COMMAND = "rg --files --hidden -g '!.git' -g '!Library' -g '!Music'" " have to override default fzf command in vim as well
let g:fzf_preview_window = ''           " disable fzf preview window while searching; to enable 'right:60%'
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6, 'border': 'rounded'} } " pop up size
nnoremap <leader>fi  :Files<cr> 
nnoremap <leader>fg  :GFiles?<cr>
nnoremap <leader>fl  :Lines<cr>
nnoremap <leader>fr  :Rg<cr>
nnoremap <leader>fb  :Buffers<cr>
nnoremap <leader>fh  :History<cr>
nnoremap <leader>fs  :History/<cr>
nnoremap <leader>fc  :History:<cr>
nnoremap <leader>fC  :Colors<cr>

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
inoremap <C-f> <Esc>: silent exec '.!inkscape-figures create "'.getline('.').'" "'.b:vimtex.root.'/figures/"'<cr><cr>:w<cr>
" open popup to search for inkscape files in figures/ folder in normal mode
nnoremap <C-f> : silent exec '!inkscape-figures edit "'.b:vimtex.root.'/figures/" > /dev/null 2>&1 &'<cr><cr>:redraw!<cr>

" Rainbow config
let g:rainbow_active = 1 " to toggle rainbow plugin [might need to avoid some colors see junegunn's plugin]

" Clojure-static config [builtin-plugin]
let g:clojure_syntax_keywords = {
    \ 'clojureMacro': ["defproject", "defcustom"],
    \ 'clojureFunc': ["string/join", "string/replace"]
    \ }
let g:clojure_align_multiline_strings = 1 " align multiline strings
let g:clojure_align_subforms = 1 " align subforms

" Neovim LSP config
:lua << EOF
local util = require 'lspconfig.util'
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

require'lspconfig'.jdtls.setup{ capabilities = capabilities,}
require'lspconfig'.pyright.setup{ capabilities = capabilities,}
require'lspconfig'.clojure_lsp.setup{ capabilities = capabilities,}
require'lspconfig'.ccls.setup{ 
cmd = { 'ccls'},
capabilities = capabilities,
root_dir = util.root_pattern('compile_commands.json', 'cmake'),
init_options = {
    cache = {
        directory = ".ccls-cache";
        };
    }
}
EOF
" cmd = {"gopls","-remote","localhost:7050"};
nnoremap <silent> gD    <cmd>lua vim.lsp.buf.declaration()<cr>
nnoremap <silent> gd    <cmd>lua vim.lsp.buf.definition()<cr>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<cr>
nnoremap <silent> gi    <cmd>lua vim.lsp.buf.implementation()<cr>
nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<cr>
nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<cr>
nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<cr>
nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<cr>
nnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<cr>
nnoremap <silent> <leader>dn    <cmd>lua vim.lsp.diagnostic.goto_next()<cr>
nnoremap <silent> <leader>dp    <cmd>lua vim.lsp.buf.diagnostic.goto_prev()<cr>

autocmd Filetype java,python,go,clojure,cpp setlocal omnifunc=v:lua.vim.lsp.omnifunc

" Nvim tree-sitter config
:lua <<EOF
require'nvim-treesitter.configs'.setup {
  highlight = { enable = true },
  incremental_selection = { enable = true },
  textobjects = { enable = true },
  rainbow = {
      enable = true,
      max_file_lines = 1000,
  },
  indent = {
    enable = { "clojure", "cpp" }
  },
  ensure_installed = { "clojure", "python" } 
}
EOF

" Undo tree Config
let g:undotree_SetFocusWhenToggle = 1
let g:undotree_ShortIndicators = 1
let g:undotree_WindowLayout = 2
nnoremap <Leader>ut :UndotreeToggle<cr>

"nvim-web-devicons config
:lua << EOF
require'nvim-web-devicons'.setup { default=true;}
EOF

" nvim-tree config
let g:nvim_tree_quit_on_open = 1 "0 by default, closes the tree when you open a file
let g:nvim_tree_indent_markers = 1 "0 by default, this option shows indent markers when folders are open
let g:nvim_tree_git_hl = 1 "0 by default, will enable file highlight for git attributes (can be used without the icons).
let g:nvim_tree_highlight_opened_files = 1 "0 by default, will enable folder and file icon highlight for opened files/directories.
let g:nvim_tree_root_folder_modifier = ':~' "This is the default. See :help filename-modifiers for more options
let g:nvim_tree_add_trailing = 1 "0 by default, append a trailing slash to folder names
let g:nvim_tree_group_empty = 1 " 0 by default, compact folders that only contain a single folder into one node in the file tree
let g:nvim_tree_disable_window_picker = 1 "0 by default, will disable the window picker.
let g:nvim_tree_icon_padding = ' ' "one space by default, used for rendering the space between the icon and the filename. Use with caution, it could break rendering if you set an empty string depending on your font.
let g:nvim_tree_symlink_arrow = ' >> ' " defaults to ' ➛ '. used as a separator between symlinks' source and target.
let g:nvim_tree_respect_buf_cwd = 1 "0 by default, will change cwd of nvim-tree to that of new buffer's when opening nvim-tree.
let g:nvim_tree_window_picker_exclude = {
    \   'filetype': [
    \     'packer',
    \     'qf'
    \   ],
    \   'buftype': [
    \     'terminal'
    \   ]
    \ }
" Dictionary of buffer option names mapped to a list of option values that
" indicates to the window picker that the buffer's window should not be
" selectable.
let g:nvim_tree_special_files = { 'README.md': 1, 'Makefile': 1, 'MAKEFILE': 1, 'Jenkinsfile': 1 }
let g:nvim_tree_show_icons = {
    \ 'git': 1,
    \ 'folders': 0,
    \ 'files': 1,
    \ 'folder_arrows': 0,
    \ }
"If 0, do not show the icons for one of 'git' 'folder' and 'files'
let g:nvim_tree_icons = {
    \ 'default': '',
    \ 'symlink': '',
    \ 'git': {
    \   'unstaged': "✗",
    \   'staged': "✓",
    \   'unmerged': "",
    \   'renamed': "➜",
    \   'untracked': "★",
    \   'deleted': "",
    \   'ignored': "◌"
    \   },
    \ 'folder': {
    \   'arrow_open': "",
    \   'arrow_closed': "",
    \   'default': "",
    \   'open': "",
    \   'empty': "",
    \   'empty_open': "",
    \   'symlink': "",
    \   'symlink_open': "",
    \   },
    \   'lsp': {
    \     'hint': "",
    \     'info': "",
    \     'warning': "",
    \     'error': "",
    \   }
    \ }

nnoremap <leader>t :NvimTreeToggle<CR>
nnoremap <leader>r :NvimTreeRefresh<CR>
nnoremap <leader>n :NvimTreeFindFile<CR>

highlight NvimTreeFolderIcon guibg=blue

:lua << EOF
require'nvim-tree'.setup {
  disable_netrw       = true,
  hijack_netrw        = true,
  open_on_setup       = false,
  ignore_ft_on_setup  = { 'startify', 'dashboard' },
  auto_close          = true,
  open_on_tab         = true,
  hijack_cursor       = false,
  update_cwd          = false,
  update_to_buf_dir   = {
    enable = true,
    auto_open = true,
  },
  diagnostics = {
    enable = true,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    }
  },
  update_focused_file = {
    enable      = false,
    update_cwd  = false,
    ignore_list = { '.git', 'node_modules', '.cache' }
  },
  system_open = {
    cmd  = nil,
    args = {}
  },
  filters = {
    dotfiles = true,
    custom = { '.git', 'node_modules', '.cache' }
  },
  git = {
    enable = true,
    ignore = true,
    timeout = 500,
  },
  view = {
    width = 60,
    height = 30,
    hide_root_folder = false,
    side = 'right',
    auto_resize = false,
    mappings = {
      custom_only = false,
      list = {}
    },
    number = false,
    relativenumber = false,
    signcolumn = "yes"
  },
  trash = {
    cmd = "trash",
    require_confirm = true
  }
}
EOF

"nvim-cmp config
luafile $XDG_CONFIG_HOME/nvim/lua/nvim-cmp-config.lua
luafile $XDG_CONFIG_HOME/nvim/lua/lsp/lua-ls.lua
luafile $XDG_CONFIG_HOME/nvim/lua/navigation.lua
luafile $XDG_CONFIG_HOME/nvim/lua/keymap.lua

"vimwiki config
let g:vimwiki_list = [{'path': '~/wiki/', 'syntax': 'markdown', 'ext': '.md'}]

" Statusline setup

set statusline=%#PmenuSel#%{FugitiveStatusline()}%#Title#\ [%n]\ %f%m%r%h%w%q%=%#StatusLine#%y\[%{&ff}\]\ \ \ line:%l/%L\ \ \ col:%c\ \ \ %p%%\ \ \ 
