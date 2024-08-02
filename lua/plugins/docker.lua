-- community pack for docker in ../community.lua
return {
  {
    "crnvl96/lazydocker.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
    },
    opts = {
      popup_window = {
        relative = "editor",
      },
    },
    keys = {
      {
        "<leader>td",
        function() require("lazydocker").toggle() end,
        mode = { "n" },
        desc = " Toggle LazyDocker",
      },
    },
  },
}
