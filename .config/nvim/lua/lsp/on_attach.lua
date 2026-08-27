local ok, blink = pcall(require, "blink.cmp")
local capabilities = ok and blink.get_lsp_capabilities()
	or vim.lsp.protocol.make_client_capabilities()

local function on_attach(client, bufnr)
	local map = function(keys, func, desc)
		vim.keymap.set("n", keys, func, { buffer = bufnr, desc = "LSP: " .. desc })
	end

	map("gd", vim.lsp.buf.definition, "Goto definition")
	map("gr", function()
		require("telescope.builtin").lsp_references()
	end, "Goto references")
	map("gI", vim.lsp.buf.implementation, "Goto implementation")
	map("<leader>D", vim.lsp.buf.type_definition, "Type definition")
	map("<leader>ds", function()
		require("telescope.builtin").lsp_document_symbols()
	end, "Document symbols")
	map("<leader>ws", function()
		require("telescope.builtin").lsp_dynamic_workspace_symbols()
	end, "Workspace symbols")
	map("<leader>rn", vim.lsp.buf.rename, "Rename")
	map("<leader>ca", vim.lsp.buf.code_action, "Code action")
	map("K", vim.lsp.buf.hover, "Hover")
	map("<C-;>", vim.lsp.buf.signature_help, "Signature help")
	map("gD", vim.lsp.buf.declaration, "Goto declaration")
	map("<leader>wa", vim.lsp.buf.add_workspace_folder, "Add workspace folder")
	map("<leader>wr", vim.lsp.buf.remove_workspace_folder, "Remove workspace folder")
	map("<leader>wl", function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, "List workspace folders")
end

return {
	on_attach = on_attach,
	capabilities = capabilities,
}
