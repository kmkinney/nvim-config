-- Keymaps
local opts = { noremap = true, silent = true } -- keymap options
local keymap = vim.api.nvim_set_keymap -- shorten function name

-- Custom leader key <Space>
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Mappings for normal mode
local normal = {
 -- Leader keys
  ["<leader>r"] = ":source %<CR>", -- reload lua file
  ["<leader>e"] = ":NvimTreeToggle<CR>",
  ["<leader>c"] = "<cmd>bd<CR>",
  ["<leader>j"] = "<cmd>bn<CR>",
  ["<leader>k"] = "<cmd>bp<CR>",
  ["<leader>t"] = "<cmd>tabnext<CR>",
  ["<leader>ok"] = "<cmd>e $HOME/.config/nvim/lua/kevin/keymaps.lua<CR>",
  ["<leader>hc"] = "<cmd>nohlsearch<CR>",
-- Telescope
  ["<leader>ff"] = "<cmd>lua require'telescope.builtin'.find_files()<CR>",
  ["<leader>fg"] = "<cmd>lua require'telescope.builtin'.live_grep()<CR>",  -- depends on ripgrep
  ["<leader>fd"] = "<cmd>lua require'telescope.builtin'.diagnostics()<CR>",
  ["<leader>fb"] = "<cmd>lua require'telescope.builtin'.buffers()<CR>",
  ["<leader>fh"] = "<cmd>lua require'telescope.builtin'.help_tags()<CR>",
  -- ["<leader>oo"] = "<cmd>e $HOME/.config/nvim/lua/kevin/options.lua<CR>",

  -- Normal Mappings
  ["<C-s>"] = ":w<CR>",
  ["∆"] = ":m .+1<CR>", -- For mac
  ["˚"] = ":m .-2<CR>", -- For mac
  ["<A-j>"] = ":m .+1<CR>",
  ["<A-k>"] = ":m .-2<CR>",
  ["<C-j>"] = "<C-w><C-j>",
  ["<C-k>"] = "<C-w><C-k>",
  ["<C-h>"] = "<C-w><C-h>",
  ["<C-l>"] = "<C-w><C-l>",
  ["j"] = "gj",
  ["k"] = "gk",

  -- Terminal commands
  ["<leader>py"] = "<cmd>lua _PYTHON_TERMINAL()<CR>"
}

-- Mappings for insert mode
local insert = {
  ["kj"] = "<ESC>",
  ["<C-s>"] = "<ESC>:w<CR>"
}

-- Mappings for visual line mode
local visual = {
  ["∆"] = ":m .+1<cr>==",
  ["˚"] = ":m .-2<cr>==",
  ["<"] = "<gv",
  [">"] = ">gv",
  ["<leader>kj"] = "<ESC>",
  ["<C-s>"] = "<ESC><cmd>w<CR>"
}

-- Mappings for visual block mode
local visual_block = {
  ["<C-J>"] = ":m '>+1<CR>gv-gv",
  ["<C-K>"] = ":m '<-2<CR>gv-gv",
  ["<C-s>"] = "<ESC><cmd>w<CR>"
}

-- Mappings for terminal mode
local term = {}

-- Mappings for command mode
local command = {
  ["W"] = "w", -- because I do this all the time
  ["Q"] = "q" -- because I do this all the time
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

