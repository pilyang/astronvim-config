-- Setup for Ruby language
--
-- TODO:
-- 1. setup for test tool
-- 2. make sure to if the dap is working well
-- 3. setup lsp for rails -> done by using ruby-lsp -> continuous check required

return {
  {
    "AstroNvim/astrolsp",
    optional = true,
    ---@type AstroLSPOpts
    opts = {
      ---@diagnostic disable-next-line: missing-fields
      config = {
        ruby_lsp = {
          filetype = { "ruby", "eruby" },
          settings = {
            ruby = {
              -- disable default formatter and linter from rubocop which is default for ruby-lsp
              format = {
                enable = false,
              },
              lint = {
                enable = false,
              },
            },
          },
        },
      },
    },
  },

  -- add treesitter for ruby
  {
    "nvim-treesitter/nvim-treesitter",
    optional = true,
    opts = function(_, opts)
      if opts.ensure_installed ~= "all" then
        opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, { "ruby" })
      end
    end,
  },

  -- add lsp, linter and formatter for ruby
  {
    "jay-babu/mason-null-ls.nvim",
    optional = true,
    opts = function(_, opts)
      opts.ensure_installed = require("astrocore").list_insert_unique(
        opts.ensure_installed,
        -- -- use solargraph
        -- { "solargraph", "standardrb", "erb-formatter", "erb-lint" }
        -- use ruby-lsp
        -- ruby-lsp automatically include ruby lsp rails from v0.3.0 (https://github.com/Shopify/ruby-lsp-rails?tab=readme-ov-file)
        -- ruby-lsp use rubocop for linting and formatting, but can use standardrb as addon
        { "ruby_lsp", "rubocop", "erb-formatter", "erb-lint" }
      )
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    optional = true,
    opts = function(_, opts)
      opts.ensure_installed = require("astrocore").list_insert_unique(
        opts.ensure_installed,
        -- { "solargraph", "standardrb" }
        { "ruby_lsp", "rubocop" }
      )
    end,
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    optional = true,
    opts = function(_, opts)
      opts.ensure_installed = require("astrocore").list_insert_unique(
        opts.ensure_installed,
        -- { "solargraph", "standardrb", "erb-formatter", "erb-lint" }
        { "ruby_lsp", "rubocop", "erb-formatter", "erb-lint" }
      )
    end,
  },
  -- formatter setup
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters_by_ft = {
        ruby = { "rubocop" },
        eruby = { "erb_format" },
      },
    },
  },

  -- add debugger for ruby
  {
    "mfussenegger/nvim-dap",
    optional = true,
    dependencies = { "suketa/nvim-dap-ruby", config = true },
  },

  -- ruby on rails setup
  -- ror.nvim
  {
    -- add mapping hints
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
      mappings = {
        n = {
          ["<leader>r"] = { name = " Ruby" },
        },
        v = {
          ["<leader>r"] = { name = " Ruby" },
        },
      },
    },
  },
  {
    "weizheheng/ror.nvim",
    ft = "ruby",
    keys = {
      {
        "<leader>rr",
        function() require("ror.commands").list_commands {} end,
        mode = { "n", "v" },
        desc = "󰫏 RoR commands",
      },
    },
  },
  -- vim-rails
  {
    "tpope/vim-rails",
    event = "VeryLazy",
  },
}
