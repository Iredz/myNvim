require("configs.options")

vim.pack.add({
  --  COLORSCHEMES --
  { src = "https://github.com/catppuccin/nvim" },
  { src = "https://github.com/gbprod/nord.nvim" },
  { src = "https://github.com/rose-pine/neovim" },
  { src = "https://github.com/folke/tokyonight.nvim" },
  { src = "https://github.com/oxfist/night-owl.nvim" },
  { src = "https://github.com/craftzdog/solarized-osaka.nvim" },
  -- LSP --
  { src = "https://github.com/mason-org/mason.nvim" },
  { src = 'https://github.com/williamboman/mason-lspconfig.nvim' },
  { src = "https://github.com/neovim/nvim-lspconfig" },
  { src = "https://github.com/saghen/blink.cmp" },
  { src = "https://github.com/nvim-treesitter/nvim-treesitter" },
  -- EDITOR --
  { src = "https://github.com/stevearc/oil.nvim" },
  { src = "https://github.com/saghen/blink.indent" },
  { src = "https://github.com/j-hui/fidget.nvim" },
  { src = "https://github.com/folke/lazydev.nvim" },
  { src = "https://github.com/nvim-mini/mini.nvim" },
  { src = "https://github.com/lewis6991/gitsigns.nvim" },
  { src = "https://github.com/folke/trouble.nvim" },
  { src = "https://github.com/akinsho/toggleterm.nvim" },
  { src = "https://github.com/esensar/nvim-dev-container" },
  { src = "https://github.com/Bekaboo/dropbar.nvim" },
})

vim.cmd.colorscheme("solarized-osaka")

require("dropbar").setup()
require("devcontainer").setup{}

require("gitsigns").setup({
  signs = {
    add = { text = "+" },
    change = { text = "~" },
    delete = { text = "_" },
    topdelete = { text = "-" },
    changedelete = { text = "+" },
  }
})

require("trouble").setup()
require("toggleterm").setup({
  open_mapping = [[<c-\>]],
  direction = "float"
})

require("fidget").setup({
  notification = {
    override_vim_notify = true, -- Redirect vim.notify() to Fidget
    window = {
      winblend = 0,             -- Background transparency (0-100)
      border = "none",          -- Border style
    },
  },
  progress = {
    display = {
      done_icon = "✓", -- Icon shown when LSP task finishes
    },
  },
})

require("mini.pick").setup()
require("mini.statusline").setup()
require("mini.surround").setup()
require("mini.pairs").setup()
require("mini.icons").setup()
require("mini.bufremove").setup()

local ts_parsers = { "lua", "html", "css", "javascript", "typescript", "python", "go", "rust", "dockerfile", "vim",
  "vimdoc", "json" }
local servers = { "lua_ls", "ts_ls", "html", "cssls", "rust_analyzer", "gopls", "emmet_language_server", "jsonls" }

require("nvim-treesitter").install(ts_parsers)
require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = servers
})
vim.lsp.enable(servers)

require("blink-cmp").setup({
  fuzzy = { implementation = "prefer_rust_with_warning" }
})
require("lazydev").setup()


require("oil").setup({
  default_file_explorer = true,
  view_options = {
    show_hidden = true
  },
  win_options = {
    winblend = 0
  }
})

require("configs.autocmds")
require("configs.keymaps")

vim.ui.select = require('mini.pick').ui_select
vim.api.nvim_set_hl(0, 'MiniPickSelection', { link = 'Visual' })
vim.api.nvim_set_hl(0, 'MiniPickMatchCurrent', { bold = true, foreground = '#f0f2f2' })
