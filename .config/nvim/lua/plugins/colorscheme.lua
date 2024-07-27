return {
  -- add solarized
  { "maxmx03/solarized.nvim" },

  -- Configure LazyVim to load solarized
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "solarized",
    },
  },
}
