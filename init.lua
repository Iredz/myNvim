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
  {
    src = "https://github.com/saghen/blink.cmp",
    version = vim.version.range("1.*")
  },
  { src = "https://github.com/rafamadriz/friendly-snippets" },
  {
    src = "https://github.com/nvim-treesitter/nvim-treesitter",
    hooks = { post_install = 'TSUpdate' }
  },
  -- EDITOR --
  { src = "https://github.com/stevearc/oil.nvim" },
  { src = "https://github.com/saghen/blink.indent" },
  { src = "https://github.com/j-hui/fidget.nvim" },
  { src = "https://github.com/folke/lazydev.nvim" },
  { src = "https://github.com/nvim-mini/mini.nvim" },
  { src = "https://github.com/lewis6991/gitsigns.nvim" },
  { src = "https://github.com/folke/trouble.nvim" },
  { src = "https://github.com/akinsho/toggleterm.nvim" },
  { src = "https://github.com/Bekaboo/dropbar.nvim" },
  { src = "https://github.com/folke/snacks.nvim" },
  { src = "https://github.com/folke/todo-comments.nvim" },
  { src = "https://github.com/nvim-lua/plenary.nvim" },
  { src = "https://github.com/barrettruth/live-server.nvim" },
})

vim.cmd.colorscheme("night-owl")


require("todo-comments").setup()
require("catppuccin").setup({
  transparent_background = false,
})
require("tokyonight").setup({
  transparent = false
})

require("snacks").setup({
  lazygit = {
    configure = true,
  },
  picker = {
    enabled = true,
    ui_select = true,
    previewers = {
      diff = {
        style = "fancy"
      }
    },
    preset = "ivy",
  }
})

require("dropbar").setup()
require("gitsigns").setup({
  signs = {
    add = { text = "+" },
    change = { text = "~" },
    delete = { text = "_" },
    topdelete = { text = "-" },
    changedelete = { text = "+" },
  }
})

require("trouble").setup({

})
require("toggleterm").setup({
  open_mapping = [[<c-\>]],
  direction = "float"
})

require("fidget").setup({
  notification = {
    override_vim_notify = true,
    window = {
      winblend = 0,
      border = "solid",
    },
  },
  progress = {
    display = {
      done_icon = "✓", -- Icon shown when LSP task finishes
    },
  },
})

-- require("mini.pick").setup()
require("mini.statusline").setup()
require("mini.surround").setup()
require("mini.pairs").setup()
require("mini.icons").setup()
require("mini.bufremove").setup()

local ts_parsers = { "lua", "html", "css", "javascript", "typescript", "python", "go", "rust", "dockerfile", "vim",
  "vimdoc", "json" }
local servers = { "lua_ls", "ts_ls", "html", "cssls", "rust_analyzer", "gopls", "emmet_language_server", "jsonls",
  "dockerls", "tombi" }

require("nvim-treesitter").install(ts_parsers)
require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = servers
})
vim.lsp.enable(servers)

require("blink-cmp").setup({
  fuzzy = { implementation = "prefer_rust_with_warning" },
  sources = {
    providers = {
      snippets = {
        opts = {
          friendly_snippets = true,
          extended_filetypes = {
            markdown = { 'jekyll' },
            sh = { 'shelldoc' },
            php = { 'phpdoc' },
            cpp = { 'unreal' }
          }
        }
      }
    }
  }
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

-- vim.ui.select = require('mini.pick').ui_select
-- vim.api.nvim_set_hl(0, 'MiniPickSelection', { link = 'Visual' })
-- vim.api.nvim_set_hl(0, 'MiniPickMatchCurrent', { bold = true, foreground = '#f0f2f2' })

-- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
-- Clear specific background colors for better transparency
-- vim.cmd("hi SignColumn guibg=NONE ctermbg=NONE")
