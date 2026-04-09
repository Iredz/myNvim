-- Automatically clear search highlights after exiting search
vim.api.nvim_create_autocmd("CmdlineLeave", {
  group = vim.api.nvim_create_augroup("clear_search_highlight", { clear = true }),
  callback = function()
    local cmd = vim.fn.getcmdtype()
    if cmd == "/" or cmd == "?" then
      vim.opt.hlsearch = false
    end
  end,
})

-- Re-enable highlighting when you start a new search
vim.api.nvim_create_autocmd("CmdlineEnter", {
  group = "clear_search_highlight",
  callback = function()
    local cmd = vim.fn.getcmdtype()
    if cmd == "/" or cmd == "?" then
      vim.opt.hlsearch = true
    end
  end,
})

-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when searching (yanking) text",
  group = vim.api.nvim_create_augroup("highlight_yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank({
      higroup = "IncSearch",
      timeout = 150,
    })
  end,
})

-- Help Window splits to the right
vim.api.nvim_create_autocmd("FileType", {
  pattern = "help",
  command = "wincmd L"
})
