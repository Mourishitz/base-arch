---@type LazySpec
return {

  "andweeb/presence.nvim",
  {
    "ray-x/lsp_signature.nvim",
    event = "BufRead",
    config = function() require("lsp_signature").setup() end,
  },

  {
    "wakatime/vim-wakatime",
    lazy = false,
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      window = {
        position = "right",
      },
      filesystem = {
        filtered_items = {
          visible = true,
          show_hidden_count = true,
          hide_dotfiles = false,
          hide_gitignored = true,
          never_show = {},
        },
      },
    },
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
    "folke/snacks.nvim",
    opts = {
      dashboard = {
        preset = {
          header = table.concat({
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
          }, "\n"),
        },
      },
    },
  },

  {
    "windwp/nvim-autopairs",
    config = function(plugin, opts)
      require "astronvim.plugins.configs.nvim-autopairs"(plugin, opts) -- include the default astronvim config that calls the setup call
      -- add more custom autopairs configuration such as custom rules
      local npairs = require "nvim-autopairs"
      local Rule = require "nvim-autopairs.rule"
      local cond = require "nvim-autopairs.conds"
      npairs.add_rules(
        {
          Rule("$", "$", { "tex", "latex" })
            -- don't add a pair if the next character is %
            :with_pair(cond.not_after_regex "%%")
            -- don't add a pair if  the previous character is xxx
            :with_pair(
              cond.not_before_regex("xxx", 3)
            )
            -- don't move right when repeat character
            :with_move(cond.none())
            -- don't delete if the next character is xx
            :with_del(cond.not_after_regex "xx")
            -- disable adding a newline when you press <cr>
            :with_cr(cond.none()),
        },
        -- disable for .vim files, but it work for another filetypes
        Rule("a", "a", "-vim")
      )
    end,
  },
}
