return {
  -- vim hop
  {
    "smoka7/hop.nvim",
    version = "*",
    event = "User AstroFile",
    opts = {},
    keys = {
      {
        "s",
        function() require("hop").hint_char2 {} end,
        mode = { "n" },
        desc = "Hop hint char2",
      },
      {
        "<S-s>",
        function() require("hop").hint_lines {} end,
        mode = { "n" },
        desc = "Hop hint lines",
      },
      {
        "gs",
        function() require("hop").hint_char2 { multi_windows = true } end,
        mode = { "n" },
        desc = "Hop hint char2 MW",
      },
      {
        "g<S-s>",
        function() require("hop").hint_lines { multi_windows = true } end,
        mode = { "n" },
        desc = "Hop hint lines MW",
      },
      {
        "<leader>s",
        function() require("hop").hint_char2 { extend_visual = true } end,
        mode = { "v" },
        desc = "Hop hint char2",
      },
      {
        "<leader><S-s>",
        function() require("hop").hint_lines { extend_visual = true } end,
        mode = { "v" },
        desc = "Hop hint lines",
      },
    },
  },
  {
    "catppuccin/nvim",
    optional = true,
    --@type: CatppuccinOptions
    opts = { integrations = { hop = true } },
  },
}
