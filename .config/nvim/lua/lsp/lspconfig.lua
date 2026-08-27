require("lspconfig")

local lsp_ui = require("lsp.on_attach")

vim.lsp.config("*", {
	capabilities = lsp_ui.capabilities,
	on_attach = lsp_ui.on_attach,
})

vim.lsp.config("basedpyright", {
	settings = {
		basedpyright = {
			analysis = {
				typeCheckingMode = "standard",
				useLibraryCodeForTypes = true,
				autoImportCompletions = true,
				autoSearchPaths = true,
			},
		},
	},
})

vim.lsp.config("lua_ls", {
	settings = {
		Lua = {
			runtime = { version = "LuaJIT" },
			diagnostics = { globals = { "vim", "hs" } },
			telemetry = { enable = false },
		},
	},
})

vim.lsp.config("clangd", {
	cmd = { "clangd", "--background-index", "--clang-tidy" },
})

vim.lsp.enable({
	"basedpyright",
	"bashls",
	"ts_ls",
	"tailwindcss",
	"cssls",
	"clangd",
	"lua_ls",
	"neocmake",
	"texlab",
	"yamlls",
})
