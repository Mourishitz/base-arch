return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "V13Axel/neotest-pest",
    },
    config = function()
      require("neotest").setup {
        adapters = {
          require "neotest-pest" {
            ignore_dirs = { "vendor", "node_modules" },
            root_ignore_files = {},
            test_file_suffixes = { "Test.php", "_test.php", "PestTest.php" },
            sail_enabled = true,
            sail_executable = "vendor/bin/sail",
            sail_project_path = "/var/www/html",
            pest_cmd = "vendor/bin/pest",
            parallel = 0,
            compact = false,
            results_path = "storage/app/" .. os.date "%Y-%m-%d-%H-%M-%S",
          },
        },
      }
    end,
  },
  "andweeb/presence.nvim",

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
        sections = {
          { section = "header" },
          { section = "keys", gap = 1, padding = 1 },
          function()
            local in_git = Snacks.git.get_root() ~= nil
            local cmds = {
              {
                title = "Profile",
                cmd = "gh graph --no-legend --no-total --scheme gameboy",
                action = function() vim.ui.open "https://github.com/Mourishitz" end,
                key = "p",
                icon = " ",
                height = 4,
                enabled = true,
              },
              {
                title = "Open Issues",
                cmd = [[gh issue list -L 5 --json number,title,updatedAt --template '{{range .}}{{tablerow (printf "#%v" .number | autocolor "green") .title (timeago .updatedAt)}}{{end}}']],
                key = "i",
                action = function() vim.fn.jobstart("gh issue list --web", { detach = true }) end,
                icon = " ",
                height = 7,
              },
              {
                icon = " ",
                title = "Open PRs",
                cmd = 'gh pr list --author "@me" -L 3 --json number,title,headRefName,updatedAt --template \'{{range .}}{{tablerow (printf "#%v" .number | autocolor "green") .title .headRefName (timeago .updatedAt)}}{{end}}\'',
                key = "P",
                action = function() vim.fn.jobstart("gh pr list --web", { detach = true }) end,
                height = 7,
              },
              {
                icon = " ",
                title = "Git Status",
                cmd = "git --no-pager diff --stat -B -M -C",
                height = 10,
              },
            }
            return vim.tbl_map(
              function(cmd)
                return vim.tbl_extend("force", {
                  pane = 2,
                  section = "terminal",
                  enabled = in_git,
                  padding = 1,
                  ttl = 5 * 60,
                  indent = 3,
                }, cmd)
              end,
              cmds
            )
          end,
          { section = "startup" },
        },
      },
    },
  },
  { "max397574/better-escape.nvim", enabled = false },
  {
    "L3MON4D3/LuaSnip",
    config = function(plugin, opts)
      require "astronvim.plugins.configs.luasnip"(plugin, opts) -- include the default astronvim config that calls the setup call
      -- add more custom luasnip configuration such as filetype extend or custom snippets
      local luasnip = require "luasnip"
      luasnip.filetype_extend("javascript", { "javascriptreact" })
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
