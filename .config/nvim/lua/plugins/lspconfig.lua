local _cmp, cmp = pcall(require, "cmp_nvim_lsp")
local _lspconfig, lspconfig = pcall(require, "lspconfig")
-- local present2, lsp_installer = pcall(require, "nvim-lsp-installer")
-- if not (present1 or present2) then
--    return
-- end

-- local capabilities = vim.lsp.protocol.make_client_capabilities()
--
-- capabilities.textDocument.completion.completionItem = {
--     documentationFormat = { "markdown", "plaintext" },
--     snippetSupport = true,
--     preselectSupport = true,
--     insertReplaceSupport = true,
--     labelDetailsSupport = true,
--     deprecatedSupport = true,
--     commitCharactersSupport = true,
--     tagSupport = { valueSet = { 1 } },
--     resolveSupport = {
--        properties = {
--           "documentation",
--           "detail",
--           "additionalTextEdits",
--        },
--     },
-- }
-- from dharmx/vile
local function capabilities(name)
  local capability = vim.lsp.protocol.make_client_capabilities()
  capability.textDocument.completion.completionItem.snippetSupport = true
  capability.textDocument.completion.completionItem.preselectSupport = true
  capability.textDocument.completion.completionItem.insertReplaceSupport = true
  capability.textDocument.completion.completionItem.labelDetailsSupport = true
  capability.textDocument.completion.completionItem.deprecatedSupport = true
  capability.textDocument.completion.completionItem.commitCharactersSupport = true
  capability.textDocument.semanticHighlighting = true
  capability.textDocument.completion.completionItem.tagSupport = { valueSet = { 1 } }
  capability.textDocument.completion.completionItem.resolveSupport = { properties = { "documentation", "detail", "additionalTextEdits" } }
  capability.textDocument.completion.completionItem.documentationFormat = { "markdown", "plaintext" }

  if name == "clangd" then capability.offsetEncoding = "UTF-8" end
  if _cmp then capability = cmp.default_capabilities() end
  return capability
end

local on_attach = function(client,bufnr)
    -- local function buf_set_keymap(...)
    --     vim.api.nvim_buf_set_keymap(bufnr, ...)
    -- end
    local function buf_set_option(...)
        vim.api.nvim_buf_set_option(bufnr, ...)
    end

    buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

    local opts = { noremap = true, silent = true, buffer = true}

    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    -- vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
    -- vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
    -- vim.keymap.set('n', '<space>wl', function()
    --   print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    -- end, opts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<space>f', function()
      vim.lsp.buf.format { async = true }
    end, opts)
end

-- -- replace the default lsp diagnostic symbols

local function lspSymbol(name, icon)
  local hl = "DiagnosticSign" .. name
  -- vim.fn.sign_define(hl, { text = icon, numhl = hl, texthl = hl })
  vim.fn.sign_define(hl, { text = icon , texthl = hl })
end

lspSymbol("Error", "")
lspSymbol("Info", "")
lspSymbol("Hint", "")
lspSymbol("Warn", "")

vim.diagnostic.config {
   virtual_text = {
      prefix = "",
      spacing = 5,
   },
   -- virtual_text = true,
   signs = true,
   underline = true,
   update_in_insert = false,
   float = {
       focusable = false,
   }
}

-- FIX: lsp.buf.server_ready is to be deprecated. fix this
-- vim.api.nvim_create_autocmd("CursorHold", {
-- 	callback = function()
-- 		if vim.lsp.buf.server_ready() then
-- 			vim.diagnostic.open_float()
-- 		end
-- 	end,
-- })


vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
   border = "single",
})
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
   border = "single",
})

require("lspconfig").lua_ls.setup ({
  on_attach = on_attach,
  capabilities = capabilities(name),
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
  }
  }
})

require("lspconfig").clangd.setup ({
  on_attach = on_attach,
  capabilities = capabilities(name),
})

-- require("lspconfig").csslsp.setup ({
--   on_attach = on_attach,
--   capabilities = capabilities(name),
-- })

require("lspconfig").quick_lint_js.setup ({
  on_attach = on_attach,
  capabilities = capabilities(name),
})

require('lspconfig').dartls.setup({
  on_attach = on_attach,
  capabilities = capabilities(name),
  cmd = { "dart", 'language-server', '--protocol=lsp' },
})


-- suppress error messages from lang servers
vim.notify = function(msg, log_level)
   if msg:match "exit code" then
      return
   end
   if log_level == vim.log.levels.ERROR then
      vim.api.nvim_err_writeln(msg)
   else
      vim.api.nvim_echo({ { msg } }, true, {})
   end
end
