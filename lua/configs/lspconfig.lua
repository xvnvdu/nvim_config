local on_attach = require("nvchad.configs.lspconfig").on_attach
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require("lspconfig")

local servers = {
	"html",
	"cssls",
	"gopls",
	"pyright",
	"marksman",
	"yamlls",
	"tinymist",
	"sqls",
}

for _, server in ipairs(servers) do
	local opts = {
		on_attach = on_attach,
		capabilities = capabilities,
	}

	if server == "html" then
		opts.filetypes = { "html", "markdown" }
	end

	lspconfig[server].setup(opts)
end

-- read :h vim.lsp.config for changing options of lsp servers
