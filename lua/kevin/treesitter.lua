local status_ok, treesitter_configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
  return
end

treesitter_configs.setup {
  ensure_installed = {
      "python",
      "c",
      "lua",
      "cpp",
      "bash",
      "javascript",
      "typescript",
      "json",
  },
  sync_install = false,
  ignore_install = {""},
  highlight = {
    enable = true, -- false will disable the whole extension
    disable = { "" }, -- list of language that will be disabled
    additional_vim_regex_highlighting = true,
  },
  indent = { enable = true, disable = { "yaml" } },
}
