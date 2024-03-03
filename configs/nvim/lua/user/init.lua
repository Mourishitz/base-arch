return {
  colorscheme = "astrodark",
  plugins = {
    {
      "github/copilot.vim",
      lazy = false,
    },
    {
      "lewis6991/gitsigns.nvim",
      event = "User AstroGitFile",
      config = function ()
        require("gitsigns").setup({
          current_line_blame = true,
        })
      end
    },
    {
      "Dynge/gitmoji.nvim",
      dependencies = {
        "hrsh7th/nvim-cmp",
      },
      opts = { -- the values below are the defaults
        filetypes = { "gitcommit" },
        completion = {
          append_space = false,
          complete_as = "emoji",
        },
      },
      ft = "gitcommit",
    },
    {
      "iamcco/markdown-preview.nvim",
      cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
      ft = { "markdown" },
      build = function() vim.fn["mkdp#util#install"]() end,
    },
    {
      "andweeb/presence.nvim",
      lazy = false,
      config = function()
        require("presence").setup({
          -- General options
          auto_update         = true,                       -- Update activity based on autocmd events (if `false`, map or manually execute `:lua package.loaded.presence:update()`)
          neovim_image_text   = "The One True Text Editor", -- Text displayed when hovered over the Neovim image
          main_image          = "neovim",                   -- Main image display (either "neovim" or "file")
          log_level           = nil,                        -- Log messages at or above this level (one of the following: "debug", "info", "warn", "error")
          debounce_timeout    = 10,                         -- Number of seconds to debounce events (or calls to `:lua package.loaded.presence:update(<filename>, true)`)
          enable_line_number  = false,                      -- Displays the current line number instead of the current project
          blacklist           = {},                         -- A list of strings or Lua patterns that disable Rich Presence if the current file name, path, or workspace matches
          buttons             = true,                       -- Configure Rich Presence button(s), either a boolean to enable/disable, a static table (`{{ label = "<label>", url = "<url>" }, ...}`, or a function(buffer: string, repo_url: string|nil): table)
          file_assets         = {},                         -- Custom file asset definitions keyed by file names and extensions (see default config at `lua/presence/file_assets.lua` for reference)
          show_time           = true,                       -- Show the timer
          -- Rich Presence text options
          editing_text        = "Editing %s",               -- Format string rendered when an editable file is loaded in the buffer (either string or function(filename: string): string)
          file_explorer_text  = "Browsing %s",              -- Format string rendered when browsing a file explorer (either string or function(file_explorer_name: string): string)
          git_commit_text     = "Committing changes",       -- Format string rendered when committing changes in git (either string or function(filename: string): string)
          plugin_manager_text = "Managing plugins",         -- Format string rendered when managing plugins (either string or function(plugin_manager_name: string): string)
          reading_text        = "Reading %s",               -- Format string rendered when a read-only or unmodifiable file is loaded in the buffer (either string or function(filename: string): string)
          workspace_text      = "Working on %s",            -- Format string rendered when in a git repository (either string or function(project_name: string|nil, filename: string): string)
          line_number_text    = "Line %s out of %s",        -- Format string rendered when `enable_line_number` is set to true (either string or function(line_number: number, line_count: number): string)
        })
      end
    },
    {
      "xiyaowong/transparent.nvim",
      lazy = false,
      config = function()
        require("transparent").clear_prefix("Neotree")
        require("transparent").setup({
            groups = { -- table: default groups
              'Normal', 'NormalNC', 'Comment', 'Constant', 'Special', 'Identifier',
              'Statement', 'PreProc', 'Type', 'Underlined', 'Todo', 'String', 'Function',
              'Conditional', 'Repeat', 'Operator', 'Structure', 'LineNr', 'NonText',
              'SignColumn', 'CursorLine', 'CursorLineNr', 'StatusLine', 'StatusLineNC',
              'EndOfBuffer',
            },
            extra_groups = {
              "NeoTree"
            }, 
            exclude_groups = {},
        })
      end,
    },
    {
      "goolord/alpha-nvim",
      cmd = "Alpha",
      opts = function()
        local dashboard = require "alpha.themes.dashboard"
        dashboard.section.header.val = {
          "• ▌ ▄ ·.       ▄• ▄▌▄▄▄  ▪  .▄▄ ·  ▄ .▄▪  ▄▄▄▄▄·▄▄▄▄•",
          "·██ ▐███▪▪     █▪██▌▀▄ █·██ ▐█ ▀. ██▪▐███ •██  ▪▀·.█▌",
          "▐█ ▌▐▌▐█· ▄█▀▄ █▌▐█▌▐▀▀▄ ▐█·▄▀▀▀█▄██▀▐█▐█· ▐█.▪▄█▀▀▀•",
          "██ ██▌▐█▌▐█▌.▐▌▐█▄█▌▐█•█▌▐█▌▐█▄▪▐███▌▐▀▐█▌ ▐█▌·█▌▪▄█▀",
          "▀▀  █▪▀▀▀ ▀█▄▀▪ ▀▀▀ .▀  ▀▀▀▀ ▀▀▀▀ ▀▀▀ ·▀▀▀ ▀▀▀ ·▀▀▀ •",
          "         ▐ ▄ ▄▄▄ .       ▌ ▐·▪  • ▌ ▄ ·.             ",
          "        •█▌▐█▀▄.▀·▪     ▪█·█▌██ ·██ ▐███▪            ",
          "        ▐█▐▐▌▐▀▀▪▄ ▄█▀▄ ▐█▐█•▐█·▐█ ▌▐▌▐█·            ",
          "        ██▐█▌▐█▄▄▌▐█▌.▐▌ ███ ▐█▌██ ██▌▐█▌            ",
          "        ▀▀ █▪ ▀▀▀  ▀█▄▀▪. ▀  ▀▀▀▀▀  █▪▀▀▀            ",
        }
      end,
    },
    {
      "wakatime/vim-wakatime",
      lazy = false,
    },
    {
      "nvim-neo-tree/neo-tree.nvim",
      opts = {
        filesystem = {
          filtered_items = {
            visible = true,
            show_hidden_count = true,
            hide_dotfiles = false,
            hide_gitignored = true,
            never_show = {},
          },
        }
      }
    }
  }
}
