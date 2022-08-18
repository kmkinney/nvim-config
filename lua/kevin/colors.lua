-- Colorschemes
vim.opt.background = "dark"
vim.g.everforest_background = "soft"
local colorscheme = "everforest"
local default = "slate"
-- safe way to prevent errors
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  vim.cmd("colorscheme " .. default)
  return
end
