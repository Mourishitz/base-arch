---@type LazySpec
return {
  "andweeb/presence.nvim",
  {
    "ray-x/lsp_signature.nvim",
    event = "BufRead",
    config = function() require("lsp_signature").setup() end,
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
      },
    },
  },
  {
    "goolord/alpha-nvim",
    opts = function(_, opts)
      opts.section.header.val = {
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
      return opts
    end,
  },
  {
    "xiyaowong/transparent.nvim",
    lazy = false,
    config = function()
      require("transparent").clear_prefix "Neotree"
      require("transparent").setup {
        groups = { -- table: default groups
          "Normal",
          "NormalNC",
          "Comment",
          "Constant",
          "Special",
          "Identifier",
          "Statement",
          "PreProc",
          "Type",
          "Underlined",
          "Todo",
          "String",
          "Function",
          "Conditional",
          "Repeat",
          "Operator",
          "Structure",
          "LineNr",
          "NonText",
          "SignColumn",
          "CursorLine",
          "CursorLineNr",
          "StatusLine",
          "StatusLineNC",
          "EndOfBuffer",
        },
        extra_groups = {
          "NeoTree",
        },
        exclude_groups = {},
      }
    end,
  },
  {
    "L3MON4D3/LuaSnip",
    config = function(plugin, opts)
      require "astronvim.plugins.configs.luasnip"(plugin, opts) -- include the default astronvim config that calls the setup call
      local luasnip = require "luasnip"
      luasnip.filetype_extend("javascript", { "javascriptreact" })
    end,
  },

  {
    "windwp/nvim-autopairs",
    config = function(plugin, opts)
      require "astronvim.plugins.configs.nvim-autopairs"(plugin, opts) -- include the default astronvim config that calls the setup call
      local npairs = require "nvim-autopairs"
      local Rule = require "nvim-autopairs.rule"
      local cond = require "nvim-autopairs.conds"
      npairs.add_rules({
        Rule("$", "$", { "tex", "latex" })
          :with_pair(cond.not_after_regex "%%")
          :with_pair(cond.not_before_regex("xxx", 3))
          :with_move(cond.none())
          :with_del(cond.not_after_regex "xx")
          :with_cr(cond.none()),
      }, Rule("a", "a", "-vim"))
    end,
  },
}
