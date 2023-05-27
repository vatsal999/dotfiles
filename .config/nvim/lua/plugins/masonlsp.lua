require("mason").setup()
require("mason-lspconfig").setup{
    ensure_installed = { "lua_ls", "clangd"},
    automatic_installation = true,
}
