-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  "AstroNvim/astrocommunity",

  -- Language Support
  { import = "astrocommunity.pack.go" },
  { import = "astrocommunity.pack.lua" },

  -- Editor setup and Misc
  { import = "astrocommunity.test.neotest" },
  { import = "astrocommunity.media.vim-wakatime" },
  { import = "astrocommunity.media.codesnap-nvim" },
  { import = "astrocommunity.git.git-blame-nvim" },
  { import = "astrocommunity.motion.nvim-spider" },
  { import = "astrocommunity.scrolling.neoscroll-nvim" },
  { import = "astrocommunity.note-taking.obsidian-nvim" },
  { import = "astrocommunity.markdown-and-latex.vimtex" },
  { import = "astrocommunity.completion.copilot-lua-cmp" },
  { import = "astrocommunity.fuzzy-finder.telescope-zoxide" },
  { import = "astrocommunity.utility.telescope-live-grep-args-nvim" },
  { import = "astrocommunity.markdown-and-latex.markdown-preview-nvim" },

  -- Themes and colorschemes
  -- { import = "astrocommunity.colorscheme.catppuccin" },
  { import = "astrocommunity.colorscheme.kanagawa-nvim" },
}
