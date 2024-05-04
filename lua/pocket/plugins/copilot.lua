return {
  { "github/copilot.vim" },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "canary",
    dependencies = {
      { "zbirenbaum/copilot.lua" }, -- or github/copilot.vim
      { "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
    },
    opts = {
      debug = true, -- Enable debugging
      -- See Configuration section for rest
      selection = function(source)
        return select.visual(source) or select.line(source)
      end,
      window = {
        -- layout = 'float'
      }
    },
    -- See Commands section for default commands if you want to lazy load on them
  },
}
