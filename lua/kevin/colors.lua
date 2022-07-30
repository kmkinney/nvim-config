-- Colorschemes
vim.opt.background = "dark"
vim.g.everforest_background = "hard"
vim.cmd "colorscheme everforest"
local colorscheme = "everforest"
-- safe way to prevent errors
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end
