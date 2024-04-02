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
          mapping = "<leader><leader>cc",
        },
        CommitStaged = {
          mapping = "<leader><leader>cs",
        },
      },
    },

    keys = {
      -- Quick chat with Copilot
      -- mapping for <leader><leader>q
      quickChat("n", "buffer"),
      quickChat("v", "visual"),

      -- Show help actions with telescope
      {
        "<leader><leader>ph",
        function()
          local actions = require "CopilotChat.actions"
          require("CopilotChat.integrations.telescope").pick(actions.help_actions())
        end,
        desc = "CopilotChat - Help actions",
      },
      -- Show prompts actions with telescope
      {
        "<leader><leader>pp",
        function()
          local actions = require "CopilotChat.actions"
          require("CopilotChat.integrations.telescope").pick(actions.prompt_actions())
        end,
        desc = "CopilotChat - Prompt actions",
      },
    },
  },
}
