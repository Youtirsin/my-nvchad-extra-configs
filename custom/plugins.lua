  -- session manager
  {
    "Shatur/neovim-session-manager",
    lazy = false,
    config = function()
      require("session_manager").setup {
        autoload_mode = require("session_manager.config").AutoloadMode.CurrentDir,
      }
    end,
  },

  -- symbols outline
  {
    "simrat39/symbols-outline.nvim",
    lazy = false,
    config = function()
      require("symbols-outline").setup {
        auto_close = true,
      }
    end,
  },

  -- hop
  {
    "phaazon/hop.nvim",
    lazy = false,
    config = function()
      local status_ok, hop = pcall(require, "hop")
      if not status_ok then
        return
      end

      hop.setup {}
      local directions = require("hop.hint").HintDirection
      vim.keymap.set("", "f", function()
        hop.hint_char1 { direction = directions.AFTER_CURSOR, current_line_only = true }
      end, { remap = true })

      vim.keymap.set("", "F", function()
        hop.hint_char1 { direction = directions.BEFORE_CURSOR, current_line_only = true }
      end, { remap = true })

      vim.keymap.set("", "t", function()
        hop.hint_char1 { direction = directions.AFTER_CURSOR, current_line_only = true, hint_offset = -1 }
      end, { remap = true })

      vim.keymap.set("", "T", function()
        hop.hint_char1 { direction = directions.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 }
      end, { remap = true })
    end,
  },
