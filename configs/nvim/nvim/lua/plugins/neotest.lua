local prefix = "<Leader>T"
return {
  {
    "nvim-neotest/neotest",
    lazy = true,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-neotest/nvim-nio",
      {
        "V13Axel/neotest-pest",
        commit = "86737ada67505a6fad98453f732ea3de04ce98aa",
      },
      {
        "AstroNvim/astrocore",
        opts = {
          mappings = {
            n = {
              [prefix] = { desc = "󰗇 Tests" },
              [prefix .. "a"] = { function() require("neotest").run.run "tests" end, desc = "Run all tests" },
              [prefix .. "t"] = { function() require("neotest").run.run() end, desc = "Run test" },
              [prefix .. "d"] = { function() require("neotest").run.run { strategy = "dap" } end, desc = "Debug test" },
              [prefix .. "f"] = {
                function() require("neotest").run.run(vim.fn.expand "%") end,
                desc = "Run all tests in file",
              },
              [prefix .. "p"] = {
                function() require("neotest").run.run(vim.fn.getcwd()) end,
                desc = "Run all tests in project",
              },
              [prefix .. "S"] = { function() require("neotest").summary.toggle() end, desc = "Test Summary" },
              [prefix .. "o"] = { function() require("neotest").output.open() end, desc = "Output hover" },
              [prefix .. "O"] = { function() require("neotest").output_panel.toggle() end, desc = "Output window" },
              ["]T"] = { function() require("neotest").jump.next() end, desc = "Next test" },
              ["[T"] = { function() require("neotest").jump.prev() end, desc = "previous test" },
            },
          },
        },
      },
      {
        "folke/neodev.nvim",
        opts = function(_, opts)
          opts.library = opts.library or {}
          if opts.library.plugins ~= true then
            opts.library.plugins = require("astrocore").list_insert_unique(opts.library.plugins, { "neotest" })
          end
          opts.library.types = true
        end,
      },
    },
    config = function(_, opts)
      vim.diagnostic.config({
        virtual_text = {
          format = function(diagnostic)
            local message = diagnostic.message:gsub("\n", " "):gsub("\t", " "):gsub("%s+", " "):gsub("^%s+", "")
            return message
          end,
        },
      }, vim.api.nvim_create_namespace "neotest")

      opts.log_level = vim.log.levels.DEBUG
      opts.adapters = {
        require "neotest-pest" {
          pest_cmd = function() return "./vendor/bin/pest" end,
          sail_enabled = function() return false end,
        },
      }
      require("neotest").setup(opts)
    end,
  },
  {
    "catppuccin/nvim",
    optional = true,
    ---@type CatppuccinOptions
    opts = { integrations = { neotest = true } },
  },
}
