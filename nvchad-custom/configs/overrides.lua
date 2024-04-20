local M = {}

M.treesitter = {
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
  indent = {
    enable = true,
    -- disable = {
    --   "python"
    -- },
  },
}

M.mason = {
  ensure_installed = {
    -- lua stuff
    "lua-language-server",
    "stylua",

    -- web dev stuff
    "css-lsp",
    "html-lsp",
    "typescript-language-server",
    "deno",
    "prettier",

    -- c/cpp stuff
    "clangd",
    "clang-format",

    "rust-analyzer",

    "gopls",
    "goimports",
  },
}

-- git support in nvimtree
M.nvimtree = {
  git = {
    enable = true,
  },

  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
}

M.conform = {
  formatters_by_ft = {
    lua = { "stylua" },
    go = { "goimports" },
    rust = { "rustfmt" },
    dart = { "dart_format" },
    typescript = { "deno_fmt" },
    vue = { "prettier" },
    -- javascript = { "deno_fmt" },
    json = { "deno_fmt" },
    ["*"] = { "trim_whitespace" },
  },
  format_on_save = function(bufnr)
    -- Disable with a global or buffer-local variable
    if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
      return
    end
    return {
      timeout_ms = 750,
      lsp_fallback = true,
    }
  end,
}

local select_one_or_multi = function(prompt_bufnr)
  local picker = require("telescope.actions.state").get_current_picker(prompt_bufnr)
  local multi = picker:get_multi_selection()
  if not vim.tbl_isempty(multi) then
    require("telescope.actions").close(prompt_bufnr)
    for _, j in pairs(multi) do
      if j.path ~= nil then
        vim.cmd(string.format("%s %s", "edit", j.path))
      end
    end
  else
    require("telescope.actions").select_default(prompt_bufnr)
  end
end

local action_layout = require("telescope.actions.layout")
M.telescope = {
  extensions_list = { "themes", "terms", "fzf", "ui-select", "live_grep_args", "aerial" },
  defaults = {
    path_display = {
      truncate = 3,
    },
    vimgrep_arguments = {
      "rg",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
      "--trim",
    },
    layout_config = {
      horizontal = {
        prompt_position = "top",
        preview_width = 0.45,
        results_width = 0.8,
      },
      preview_cutoff = 90,
    },
    border = true,
    preview = {
      hide_on_startup = true,
    },
    mappings = {
      n = {
        ["<M-p>"] = action_layout.toggle_preview,
      },
      i = {
        ["<M-p>"] = action_layout.toggle_preview,
        ["<CR>"] = select_one_or_multi,
      },
    },
  },
}

return M
