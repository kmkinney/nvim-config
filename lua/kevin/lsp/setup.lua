-- Settings for LSP using LSP config
local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
  return
end

-- Add reference higlighting
local function lsp_add_highlights(client)
  if client.server_capabilities.document_highlight then
    vim.api.nvim_exec(
      [[
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]],
      false
    )
  end
end

local function lsp_set_keymaps(bufn)
  local keymap = vim.keymap.set
  local opt = { silent = true, buffer = bufn }
  keymap("n", "K", vim.lsp.buf.hover, opt)
  keymap("n", "gd", vim.lsp.buf.definition, opt)
  keymap("n", "gt", vim.lsp.buf.type_definition, opt)
  keymap("n", "gi", vim.lsp.buf.implementation, opt)
  keymap("n", "<leader>d", vim.diagnostic.open_float, opt)
  vim.cmd[[ command! Format execute 'lua vim.lsp.buf.formatting()']]
end

local function on_attach(client, bufn)
  lsp_set_keymaps(bufn)
  lsp_add_highlights(client)
end

local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_ok then
  return
end

local capabilities = cmp_nvim_lsp.update_capabilities(vim.lsp.protocol.make_client_capabilities())


local handlers = {
  ["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
      virtual_text = true
    }
  )
}

local lua_settings = require("kevin.lsp.settings.sumneko_lua")
lspconfig.sumneko_lua.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  settings = lua_settings,
  handlers = handlers
})

lspconfig.pyright.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  handlers = handlers
})

lspconfig.tsserver.setup{
  on_attach = on_attach,
  capabilities = capabilities,
  handlers = handlers
}

lspconfig.html.setup{
  on_attach = on_attach,
  capabilities = capabilities,
  handlers = handlers
}

lspconfig.cssls.setup{
  on_attach = on_attach,
  capabilities = capabilities,
  handlers = handlers
}
