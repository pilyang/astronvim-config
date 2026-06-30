-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- Customize Treesitter
--
-- AstroNvim v6: nvim-treesitter moved to its `main` branch, so parsers are
-- declared via AstroCore's `treesitter` module instead of the plugin `opts`.
-- List values from multiple specs are concatenated by lazy.nvim, so a plain
-- list table is enough (no need for `list_insert_unique`).

---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    treesitter = {
      ensure_installed = {
        "lua",
        "vim",
        -- add more arguments for adding more treesitter parsers
      },
    },
  },
}
