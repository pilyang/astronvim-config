-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  -- { import = "astrocommunity.pack.lua" },
  -- import/override with your plugins folder
  --

  { import = "astrocommunity.colorscheme.catppuccin" },
  {
    "catppuccin",
    opts = {
      transparent_background = true,
    },
  },

  -- golang pack
  { import = "astrocommunity.pack.go" },

  -- dap virtual text
  { import = "astrocommunity.debugging.nvim-dap-virtual-text" },

  -- Plugins for markdown
  { import = "astrocommunity.pack.markdown" },

  -- setup for noice and notify util
  { import = "astrocommunity.utility.noice-nvim" },
  {
    "folke/noice.nvim",
    opts = {
      cmdline = {
        format = {
          cmdline = {
            icon = ">_",
          },
        },
      },
      presets = {
        bottom_search = false,
        lsp_doc_border = true,
      },
      lsp = {
        signature = {
          enabled = true,
          auto_open = {
            enabled = false,
          },
        },
      },
    },
  },
  {
    "catppuccin/nvim",
    optional = true,
    --@type: CatppuccinOptions
    opts = { integrations = { noice = true } },
  },

  -- setup for FE (html-css, vue)
  { import = "astrocommunity.pack.html-css" },
  { import = "astrocommunity.pack.typescript" },
  { import = "astrocommunity.pack.vue" },

  { import = "astrocommunity.programming-language-support.web-tools-nvim" },
}
