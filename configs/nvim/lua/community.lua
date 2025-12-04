---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.completion.copilot-vim-cmp" },

  { import = "astrocommunity.fuzzy-finder.fzf-lua" },

  { import = "astrocommunity.media.codesnap-nvim" },

  { import = "astrocommunity.utility.live-server-nvim" },
  { import = "astrocommunity.markdown-and-latex.markview-nvim" },

  { import = "astrocommunity.pack.go" },
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.pack.typescript" },
  { import = "astrocommunity.color.transparent-nvim" },
}
