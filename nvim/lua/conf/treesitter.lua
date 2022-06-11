require'nvim-treesitter.configs'.setup {
  ensure_installed = {
      "c", "vim","cpp", "lua","comment",
  },
  highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
  },
  rainbow = {
      enable = true,
      extended_mode = true,
      max_file_lines = nil,
  },
   matchup = {
    enable = true,              -- mandatory, false will disable the whole extension
  },
}

