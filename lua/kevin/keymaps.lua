-- Keymaps
local opts = { noremap = true, silent = true } -- keymap options
local keymap = vim.api.nvim_set_keymap -- shorten function name

-- Custom leader key <Space>
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Mappings for normal mode
local normal = {
 ["<leader>r"] = ":source %<CR>",
 ["<leader>t"] = ":NvimTreeToggle<CR>",
 ["<leader>e"] = ":NvimTreeFocus<CR>",
 ["<leader>ff"] = "<cmd>lua require'telescope.builtin'.find_files()<CR>",
 ["<leader>fg"] = "<cmd>lua require'telescope.builtin'.live_grep()<CR>",  -- depends on ripgrep
 ["<C-s>"] = ":w<CR>",
 ["∆"] = ":m .+1<CR>", -- For mac
 ["˚"] = ":m .-2<CR>", -- For mac
 ["<A-j>"] = ":m .+1<CR>",
 ["<A-k>"] = ":m .-2<CR>",
 ["<C-j>"] = "<C-w><C-j>",
 ["<C-k>"] = "<C-w><C-k>",
 ["<C-h>"] = "<C-w><C-h>",
 ["<C-l>"] = "<C-w><C-l>",
}

-- Mappings for insert mode
local insert = {
  ["kj"] = "<ESC>",
  ["<C-s>"] = "<ESC>:w<CR>"
}

-- Mappings for visual line mode
local visual = {
  ["∆"] = ":m .+1<CR>==",
  ["˚"] = ":m .-2<CR>==",
  ["<"] = "<gv",
  [">"] = ">gv",
  ["<leader>kj"] = "<ESC>"
}

-- Mappings for visual block mode
local visual_block = {
  ["J"] = ":m '>+1<CR>gv-gv",
  ["K"] = ":m '<-2<CR>gv-gv"
}

-- Mappings for terminal mode
local term = {}

-- Mappings for command mode
local command = {
  ["W"] = "w" -- because I do this all the time
}

local modes = {
  n = normal,
  i = insert,
  v = visual,
  x = visual_block,
  t = term,
  c = command
}

for mode, mappings in pairs(modes) do
  for lhs, rhs in pairs(mappings) do
    keymap(mode, lhs, rhs, opts)
  end
end

