return {
  "rcarriga/nvim-notify",
  opts = {
    timeout = 2000,
    top_down = false,
  },
  -- opts = function(plugin, opts)
  --   local notify = require "notify"
  --
  --   -- Set default timeout
  --   notify.setup {
  --     timeout = 5000, -- Default timeout in milliseconds
  --   }
  --
  --   -- Override timeout for INFO level notifications
  --   local original_notify = notify.notify
  --   notify.notify = function(msg, level, notify_opts)
  --     if level == "info" then
  --       notify_opts = notify_opts or {}
  --       notify_opts.timeout = 10000 -- Custom timeout for INFO level in milliseconds
  --     end
  --     original_notify(msg, level, notify_opts)
  --   end
  --
  --   -- Apply the notify function
  --   vim.notify = notify.notify
  -- end,
}
