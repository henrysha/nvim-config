local plugins = {

  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup {
        panel = {
          enabled = false,
        },
        suggestion = {
          enabled = false,
        },
      }
    end,
  },

  {
    "hrsh7th/nvim-cmp",
    opts = {
      sources = {
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "buffer" },
        { name = "nvim_lua" },
        { name = "path" },
        { name = "copilot" },
      },
    },
    dependencies = {
      {
        "zbirenbaum/copilot-cmp",
        config = function()
          require("copilot_cmp").setup()
        end,
      },
    },
  },

  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      "windwp/nvim-ts-autotag",
    },
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "typescript",
        "javascript",
        "tsx",
        "html",
        "css",
        "scss",
        "json",
        "yaml",
        "markdown",
      },
    },
    config = {
      autotag = true,
    },
  },

  {
    "windwp/nvim-ts-autotag",
    lazy = false,
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },

  {
    "williamboman/mason.nvim",
  },

  {
    "williamboman/mason-lspconfig.nvim",
    setup = {
      ensure_installed = {
        "lua-language-server",
        "html-lsp",
        "prettier",
        "stylua",
        "eslint-lsp",
        "typescript-language-server",
        "tailwindcss-language-server",
        "graphql",
      },
    },
  },

  {
    "neovim/nvim-lspconfig",

    dependencies = {
      "jose-elias-alvarez/null-ls.nvim",
      config = function()
        require "custom.configs.null-ls"
      end,
    },

    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },

  {
    "kdheepak/lazygit.nvim",
    lazy = false,
    -- optional for floating window border decoration
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },

  {
    "ruifm/gitlinker.nvim",
    lazy = false,

    dependencies = {
      "nvim-lua/plenary.nvim",
    },

    config = function()
      require("gitlinker").setup {
        callbacks = {
          ["oss.navercorp.com"] = require("gitlinker.hosts").get_github_type_url,
        },
      }
    end,
  },

  { "ellisonleao/glow.nvim", config = true, cmd = "Glow" },

  { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },

  {
    "ThePrimeagen/refactoring.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    setup = function()
      require("refactoring").setup()
    end,
  },
}

return plugins
