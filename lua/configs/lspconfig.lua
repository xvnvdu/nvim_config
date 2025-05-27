local on_attach = require("nvchad.configs.lspconfig").on_attach
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require("lspconfig")

local servers = { "html", "cssls", "gopls", "pyright" }

for _, server in ipairs(servers) do
    lspconfig[server].setup({
        on_attach = on_attach,
        capabilities = capabilities,
    })
end

-- read :h vim.lsp.config for changing options of lsp servers
