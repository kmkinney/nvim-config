print('Testing autocommands!')

local bufnr = 13
--vim.api.nvim_create_buf({},{})

local lines = {
  "hello",
  "world"
}
vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, lines)

vim.api.nvim_create_autocmd("BufWritePost", {
  group = vim.api.nvim_create_augroup("PythonAugroupTest", {clear = true}),
  pattern = {
    "*.py"
  },
  callback = function()
    print('Autocommand called')
    vim.fn.jobstart({"python3", "script.py"}, {
      stdout_buffered = true,
      on_stdout = function(_, data)
        vim.api.nvim_buf_set_lines(bufnr, -1, -1, false, data)
      end,
      on_stderr = function(_, data)
        vim.api.nvim_buf_set_lines(bufnr, -1, -1, false, data)
      end,
    })
  end,
})
