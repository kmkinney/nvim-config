-- LSP Installer init
local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
  return
end

lsp_installer.setup({})

require("kevin.lsp.setup")

