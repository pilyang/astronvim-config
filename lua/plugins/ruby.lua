-- Setup for Ruby language
-- NOTE: base from communicty.pack.ruby
-- Seperate from community to append addtional plugins and settings for ruby in one file
--
-- TODO:
-- 1. setup for test tool
-- 2. make sure to if the dap is working well
-- 3. add ror.nvim (ruby on rails plugin for nvim)

return {

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
      opts.ensure_installed =
        require("astrocore").list_insert_unique(opts.ensure_installed, { "solargraph", "standardrb" })
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    optional = true,
    opts = function(_, opts)
      opts.ensure_installed =
        require("astrocore").list_insert_unique(opts.ensure_installed, { "solargraph", "standardrb" })
    end,
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    optional = true,
    opts = function(_, opts)
      opts.ensure_installed =
        require("astrocore").list_insert_unique(opts.ensure_installed, { "solargraph", "standardrb" })
    end,
  },
  -- formatter setup
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters_by_ft = {
        ruby = { "standardrb" },
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
  {
    -- add mapping hints
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
      mappings = {
        n = {
          ["<leader>r"] = { name = " Ruby" },
          ["<leader>rr"] = { name = "󰫏 RoR commands" },
        },
        v = {
          ["<leader>r"] = { name = " Ruby" },
          ["<leader>rr"] = { name = "󰫏 RoR commands" },
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
        desc = "RoR commands",
      },
    },
  },
}
