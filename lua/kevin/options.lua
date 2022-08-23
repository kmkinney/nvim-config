-- Example options
local options = vim.opt

options.backup = false                          -- creates a backup file
options.clipboard = "unnamedplus"               -- allows neovim to access the system clipboard
options.cmdheight = 2                           -- more space in the neovim command line for displaying messages
options.completeopt = { "menuone", "noselect" } -- mostly just for cmp
options.conceallevel = 0                        -- so that `` is visible in markdown files
options.cursorline = true                       -- highlight the current line
options.expandtab = true                        -- convert tabs to spaces
options.fileencoding = "utf-8"                  -- the encoding written to a file
options.foldmethod = "syntax"
options.guifont = "monospace:h17"               -- the font used in graphical neovim applications
options.hlsearch = true                         -- highlight all matches on previous search pattern
options.ignorecase = true                       -- ignore case in search patterns
options.mouse = "a"                             -- allow the mouse to be used in neovim
options.number = true                           -- set numbered lines
options.numberwidth = 2                         -- set number column width to 2 {default 4}
options.pumheight = 10                          -- pop up menu height
options.relativenumber = false                  -- set relative numbered lines
options.scrolloff = 8                           -- is one of my fav
options.shiftwidth = 2                          -- the number of spaces inserted for each indentation
options.showcmd = true
options.showmode = false                        -- we don't need to see things like -- INSERT -- anymore
options.showtabline = 2                         -- always show tabs
options.sidescrolloff = 8
options.signcolumn = "yes"                      -- always show the sign column, otherwise it would shift the text each time
options.smartcase = true                        -- smart case
options.smartindent = true                      -- make indenting smarter again
options.softtabstop = 2
options.splitbelow = true                       -- force all horizontal splits to go below current window
options.splitright = true                       -- force all vertical splits to go to the right of current window
options.swapfile = false                        -- creates a swapfile
options.tabstop = 2                             -- insert 2 spaces for a tab
options.termguicolors = true                    -- set term gui colors (most terminals support this)
options.timeoutlen = 1000                       -- time to wait for a mapped sequence to complete (in milliseconds)
options.undofile = true                         -- enable persistent undo
options.updatetime = 300                        -- faster completion (4000ms default)
options.wrap = true                            -- display lines as one long line
options.writebackup = false                     -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited

options.shortmess:append "c" -- not sure what this does


vim.cmd "set whichwrap+=<,>,[,],h,l"
vim.cmd [[set iskeyword+=-]] -- makes this-word into one word

vim.g.python_recommended_style = 0 -- ignore the python_recommended_style
