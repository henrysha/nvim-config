local plugins = {

  {
    "hrsh7th/nvim-cmp",
    opts = {
      sources = {
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "buffer" },
        { name = "nvim_lua" },
        { name = "path" },
        { name = "cmp_tabnine" },
      },
    },

    dependencies = {
      {
        "tzachar/cmp-tabnine",
        build = "./install.sh",
        config = function()
          local tabnine = require "cmp_tabnine.config"
          tabnine:setup {
            max_lines = 1000,
            max_num_results = 20,
            sort = true,
            run_on_every_keystroke = true,
            snippet_placeholder = "..",
            ignored_file_types = {
              -- default is not to ignore
              -- uncomment to ignore in lua:
              -- lua = true
            },
            show_prediction_strength = false,
          } -- put your options here
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
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "lua-language-server",
        "html-lsp",
        "prettier",
        "stylua",
        "eslint_d",
        "typescript-language-server",
      },
    },
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
}

return plugins
