local options = {
  ensure_installed = {
    "vim",
    "lua",
    "html",
    "css",
    "javascript",
    "typescript",
    "tsx",
    "vue",
    "c",
    "markdown",
    "markdown_inline",
    "hyprlang",
    "rust",
    "go",
    "gomod",
    "gosum",
    "bash",
    "fish",
    "gitcommit",
    "gitignore",
    "json",
    "make",
    "regex",
    "toml",
    "yaml",
  },
}

require("nvim-treesitter").setup(options)