local map = vim.keymap.set
-- Navigation
map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")

-- Buffers
map("n", "<S-h>", ":bp<CR>", { desc = "Switch to previous buffer" })
map("n", "<S-l>", ":bn<CR>", { desc = "Switch to next buffer" })
map('n', '<leader>bd', function()
  local bd = require("mini.bufremove").delete
  if vim.bo.modified then
    local choice = vim.fn.confirm(("Save changes to %q?"):format(vim.fn.bufname()), "&Yes\n&No\n&Cancel")
    if choice == 1 then -- Yes
      vim.cmd.write()
      bd(0, false)
    elseif choice == 2 then -- No
      bd(0, true)
    end
  else
    bd(0, false)
  end
end, { desc = "Delete Buffer" })

-- Force delete current buffer (ignore changes)
vim.keymap.set('n', '<Leader>bD', function()
  require("mini.bufremove").delete(0, true)
end, { desc = "Delete Buffer (Force)" })

-- Format
map("n", "<space>ff", vim.lsp.buf.format, { desc = "Buffer Format" })

-- Snacks
map("n", "<leader>sf", function()
  Snacks.picker.files()
end, { desc = "Search files" })

map("n", "<leader><space>", function()
  Snacks.picker.smart()
end, { desc = "Smart search files" })

map("n", "<leader>sh", function()
  Snacks.picker.help()
end, { desc = "Search help" })

map("n", "<leader>sg", function()
  Snacks.picker.grep_buffers()
end, { desc = "Search grep in buffers" })

map("n", "<leader>sG", function()
  Snacks.picker.grep()
end, { desc = "Search grep" })

map("n", "<leader>sb", function()
  Snacks.picker.buffers()
end, { desc = "Search buffers" })

map("n", "<leader>lg", function()
  Snacks.lazygit()
end, { desc = "Toggle LazyGit" })

-- Trouble
map("n", "<leader>q", "<CMD>Trouble diagnostics toggle<CR>", { desc = 'Toggle trouble diagnostics' })

-- Todo Comments
map("n", "<leader>st", function()
  Snacks.picker.todo_comments()
end, { desc = "Search todo comments" })

map("n", "<leader>sT", function()
  Snacks.picker.todo_comments({ keywords = { "TODO", "FIX", "FIXME" } })
end, { desc = "Search todo comments" })

-- Oil
local bufremove = require("mini.bufremove")
map("n", "<leader>e", function()
  if vim.bo.filetype == "oil" then
    bufremove.delete(0, false)
  else
    require("oil").open()
  end
end, { desc = "Toggle Oil" })

-- LSP
map("n", "<leader>ca", function()
  vim.lsp.buf.code_action()
end, { desc = "Code Action" })

map("n", "<leader>rn", function()
  vim.lsp.buf.rename()
end, { desc = "Rename references" })

map('n', '<leader>th', function()
  vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end, { desc = "Toggle Inlay Hints" })

map('n', "<leader>li", function()
  vim.lsp.buf.implementation()
end, { desc = "LSP Implementation" })

-- Lazygit
map('n','<leader>lg', function ()
  Snacks.lazygit()
end, { desc = 'Toggle Lazygit' })


-- VIM PACK UPDATE
map('n', '<leader>vu', function()
  vim.pack.update()
end, { desc = 'Update installed plugins' })
