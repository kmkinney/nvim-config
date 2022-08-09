local term_status, toggleterm = pcall(require, "toggleterm")
if not term_status then
  return
end

toggleterm.setup {
  open_mapping = [[<c-\>]],
  direction = "float",
  hide_numbers = true
}

-- Custom terminal commands
local Terminal = require("toggleterm.terminal").Terminal

local python = Terminal:new({cmd = "python3", hidden = true})
function _PYTHON_TERMINAL()
  python:toggle()
end

-- local kattis_init = Terminal:new({cmd = "kattis-init", hidden = false})
-- function _KATTIS_INIT(pname)
-- end
