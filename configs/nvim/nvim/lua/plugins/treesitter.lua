---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  commit = "c579d186bec0a4af9d0741b235cfa0627ffd9f15",
  opts = function(_, opts)
    -- add more things to the ensure_installed table protecting against community packs modifying it
    opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, {
      "lua",
      "vim",
      -- add more arguments for adding more treesitter parsers
    })
  end,
}
