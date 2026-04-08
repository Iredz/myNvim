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
--
-- Force delete current buffer (ignore changes)
vim.keymap.set('n', '<Leader>bD', function()
  require("mini.bufremove").delete(0, true)
end, { desc = "Delete Buffer (Force)" })

-- Format
map("n", "<space>bf", vim.lsp.buf.format, { desc = "Buffer Format" })

-- Pick
map("n", "<leader>ff", "<CMD>Pick files<CR>", { desc = "Find files" })
map("n", "<leader>fh", "<CMD>Pick help<CR>", { desc = "Find help" })
map("n", "<leader>fg", "<CMD>Pick grep<CR>", { desc = "Find word by grep" })
map("n", "<leader><space>", "<CMD>Pick buffers<CR>", { desc = "Find files" })

-- Trouble
map("n", "<leader>q", "<CMD>Trouble diagnostics toggle<CR>")

-- Oil
local bufremove = require("mini.bufremove")
map("n", "<leader>e", function()
  if vim.bo.filetype == "oil" then
    bufremove.delete(0, false)
  else
    require("oil").open()
  end
end, { desc = "Toggle Oil" })
