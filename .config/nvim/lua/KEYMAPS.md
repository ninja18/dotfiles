# Keymaps & Shortcuts

Leader key is `<Space>`. `<C-` = Ctrl, `<S-` = Shift, `<M-` = Option/Alt.

## Navigation & File Finding (Telescope + Oil)

| Keymap | Action |
| --- | --- |
| `<leader><space>` | Find existing buffers (dropdown) |
| `<leader>ff` | Find files (dropdown) |
| `<leader>fw` | Grep word under cursor in buffer |
| `<leader>fg` | Grep word under cursor in directory |
| `<leader>fe` | Live grep (regex, whole project) |
| `<leader>/` | Fuzzy search in current buffer |
| `<leader>fd` | Search diagnostics via telescope |
| `<leader>f?` | List all telescope pickers |
| `-` | Open oil (parent directory as file browser, float) |

## Git (gitsigns + fugitive)

| Keymap | Action |
| --- | --- |
| `]c` / `[c` | Next / previous hunk |
| `<leader>hs` | Stage hunk |
| `<leader>hr` | Reset hunk |
| `<leader>hS` | Stage whole buffer |
| `<leader>hR` | Reset whole buffer |
| `<leader>hp` | Preview hunk |
| `<leader>hi` | Preview hunk inline |
| `<leader>hb` | Blame line |
| `<leader>hd` / `<leader>hD` | Diff against HEAD / `~` |
| `<leader>hq` / `<leader>hQ` | Hunks to quickfix / all hunks to quickfix |
| `<leader>tb` | Toggle line blame |
| `<leader>td` | Toggle deleted lines |
| `<leader>tw` | Toggle word diff |
| `ih` | Select hunk (text object, `o`/`x` modes) |
| `<leader>gs` | Git status (telescope) |
| `:G` | Git status (fugitive) |

## Diagnostics

| Keymap | Action |
| --- | --- |
| `[d` / `]d` | Previous / next diagnostic |
| `<leader>e` | Open diagnostic in float |
| `<leader>q` | Diagnostics to location list |
| `<leader>xx` | Toggle trouble diagnostics list |
| `<leader>xw` | Toggle trouble (current buffer only) |

## LSP

| Keymap | Action |
| --- | --- |
| `gd` | Go to definition |
| `gr` | References (telescope) |
| `gI` | Go to implementation |
| `gD` | Go to declaration |
| `<leader>D` | Go to type definition |
| `<leader>ds` | Document symbols |
| `<leader>ws` | Workspace symbols |
| `<leader>rn` | Rename |
| `<leader>ca` | Code actions |
| `K` | Hover documentation |
| `<C-;>` | Signature help |
| `<leader>wa` / `<leader>wr` | Add / remove workspace folder |
| `<leader>wl` | List workspace folders |

## Completion (blink.cmp)

| Keymap | Action |
| --- | --- |
| `<C-Space>` | Open completion |
| `<C-n>` / `<C-p>` | Next / previous item |
| `<CR>` | Accept selection |
| `<Tab>` / `<S-Tab>` | Next / previous item + jump through snippets |
| `<C-d>` / `<C-f>` | Scroll documentation down / up |
| `<C-e>` | Hide menu |

Snippets come from LuaSnip (custom tex snippets in `~/.config/nvim/LuaSnip/`). `<leader>U` reloads them.

## Treesitter Text Objects (`o`/`x` modes)

| Keymap | Object |
| --- | --- |
| `af` / `if` | Function (outer / inner) |
| `ac` / `ic` | Class (outer / inner) |

## Formatting & Linting

| Keymap | Action |
| --- | --- |
| `<leader>;` | Format buffer (conform + LSP fallback) |

Format-on-save is automatic (conform, 500ms timeout). Linters run automatically on save/read/insert-leave:

| Language | Linter |
| --- | --- |
| Python | ruff |
| JavaScript / TypeScript | eslint_d |
| Shell / Bash | shellcheck |
| LaTeX | chktex |
| YAML | yamllint |

Formatters (conform): stylua (lua), ruff (python), prettierd (js/ts/json/html/css/md/yaml), shfmt (shell), latexindent (tex), cmake_format (cmake).

## Filetype Specifics

- **LaTeX**: vimtex (compile/view via `:VimtexCompile`), texlab LSP, Skim sync. Insert-mode `<C-f>` creates an inkscape-figures SVG from the current line. Conceal enabled (`g:tex_conceal`).
- **Markdown**: render-markdown.nvim (live rendering), prettierd formatting.
- **Bash**: bashls LSP, shellcheck lint, shfmt format.
- **Python**: basedpyright LSP (type-checking), ruff lint + format.
- **C/C++**: clangd (`--background-index --clang-tidy`).
- **Rust**: rustaceanvim (rust-analyzer) — `:RustLsp` commands for run/codeAction/etc.
- **CMake**: neocmakelsp LSP; `:CMakeBuild` / `<leader>cb` build.

## Folke Plugins

- **noice.nvim** — replaces cmdline/messages/popup with a fancy UI (no keymaps bound).
- **flash.nvim** — `s` jump to any char quickly, `S` treesitter-aware jump.
- **trouble.nvim** — `<leader>xx` / `<leader>xw` (see Diagnostics).
- **lazydev.nvim** — better Lua LSP for editing this config (automatic).
- **render-markdown.nvim** — markdown preview (automatic, md files only).

## Misc

| Keymap | Action |
| --- | --- |
| `<leader>nh` | Clear search highlight |
| `n` / `N` | Center screen on search jump |
| `gcc` | Toggle comment line (Comment.nvim) |
| `gc` | Comment visual selection (Comment.nvim) |
| `sa` / `sd` / `sr` | vim-sandwich: surround add / delete / replace (e.g. `saiw"`) |
| `[m` / `]m` | Previous / next method (vim built-in) |
| `<leader>cgr` / `<leader>cgd` | CMake generate Release / Debug |
| `<leader>cb` | CMake build |
| `:Rest run` | Run request under cursor in `.http` file |
| `<C-h>/<C-j>/<C-k>/<C-l>` | Window / pane navigation (herdr + tmux-navigator integration) |
