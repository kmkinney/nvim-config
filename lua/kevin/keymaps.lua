-- Example keymaps

local opts = { noremap = true, silent = true } -- keymap options

local keymap = vim.api.nvim_set_keymap -- shorten function name


-- Custom leader key
-- Example with Spacebar as leader
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes for mapping
  -- normal = n
  -- insert = i
  -- visual = v
  -- visual block = x
  -- term mode = t
  -- command mode = c

-- No more escape key
 keymap("i", "kj", "<ESC>", opts) 

-- Fast indent in visual mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Moving blocks of text in visual mode
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
