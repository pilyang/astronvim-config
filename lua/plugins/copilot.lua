-- copilot quickChat fuction
local function quickChat(mode, selection)
  return {
    "<leader><leader>q",
    mode = { mode },
    function()
      local input = vim.fn.input "Quick Chat: "
      if input ~= "" then
        require("CopilotChat").ask(input, { selection = require("CopilotChat.select")[selection] })
      end
    end,
    desc = "CopilotChat - Quick chat",
  }
end

return {
  -- mapping hints for astrocore
  {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
      mappings = {
        n = {
          ["<leader><leader>"] = { name = " AI Support" },
          ["<leader><leader>g"] = { name = "git commit messages" },
          ["<leader><leader>f"] = { name = "fix" },
          ["<leader><leader>p"] = { name = "telescope integration" },
        },
        v = {
          ["<leader><leader>"] = { name = " AI Support" },
          ["<leader><leader>g"] = { name = "git commit messages" },
          ["<leader><leader>f"] = { name = "fix" },
          ["<leader><leader>p"] = { name = "telescope integration" },
        },
      },
    },
  },

  -- copilot setup
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "User AstroFile",
    opts = {
      suggestion = {
        auto_trigger = true,
        debounce = 200,
      },
    },
  },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "canary",
    event = "User AstroFile",
    dependencies = {
      { "zbirenbaum/copilot.lua" },
      { "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
    },
    opts = {
      debug = true, -- Enable debugging
      question_header = "**User Question **",

      -- custom selection (visual or buffer) (default is visaul or line)
      selection = function(source)
        return require("CopilotChat.select").visual(source) or require("CopilotChat.select").buffer(source)
      end,

      -- default prompts
      prompts = {
        Explain = {
          mapping = "<leader><leader>e",
        },
        Tests = {
          mapping = "<leader><leader>t",
        },
        Fix = {
          mapping = "<leader><leader>fn",
        },
        Optimize = {
          mapping = "<leader><leader>o",
        },
        Docs = {
          mapping = "<leader><leader>d",
        },
        FixDiagnostic = {
          mapping = "<leader><leader>fd",
        },
        Commit = {
          mapping = "<leader><leader>gc",
        },
        CommitStaged = {
          mapping = "<leader><leader>gs",
        },
      },
    },

    keys = {
      -- toggleChat
      {
        "<leader><leader>c",
        function() require("CopilotChat").toggle() end,
        desc = "CopilotChat - Toggle chat",
      },

      -- Quick chat with Copilot
      -- mapping for <leader><leader>q
      quickChat("n", "buffer"),
      quickChat("v", "visual"),
    },
  },
}
