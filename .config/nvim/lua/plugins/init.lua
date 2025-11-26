return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  -- test new blink
  -- { import = "nvchad.blink.lazyspec" },

  {
  	"nvim-treesitter/nvim-treesitter",
  	opts = {
      ensure_installed = { "vim", "lua", "markdown", "c", "cpp", "c_sharp",
        "java", "python", "html", "css", "typescript", "javascript",
        "json", "xml", "go", "rust", "ruby", "bash", "sql"
      },
    },
  },

  {
    "RRethy/vim-illuminate",
    event = "BufReadPost",
    config = function()
      require("illuminate").configure({
        delay = 100,
        filetypes_denylist = {
          "NvimTree",
          "packer",
          "dashboard",
          "help",
        },
      })
    end,
  },
}
