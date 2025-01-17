local options = {
  defaults = {
    tabwidth = 8,
    expandtab = false,
  },
  languages = {
    {
      filetypes = { "html", "javascript", "typescript", "vue", "css", "scss", "yuck", "typescriptreact", "solidity" },
      config = {
        tabwidth = 4,
      },
    },
    {
      filetypes = { "dart", "lua", "json", "yaml", "toml" },
      config = {
        tabwidth = 2,
        expandtab = true,
      },
    },
  },
}

require("tabset").setup(options)
