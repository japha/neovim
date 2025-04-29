--local cppman = require"cppman"
-- you need to install cppman and groff packages on OS beforehands
-- Make a keymap to open the word under cursor in CPPman
vim.keymap.set("n", "<leader>cm", function()
  cppman.open_cppman_for(vim.fn.expand("<cword>"))
end)

-- Open search box
vim.keymap.set("n", "<leader>cc", function()
  cppman.input()
end)


