-- Move between splits
vim.keymap.set("n", "<a-Left>", function()
  require("tmux").move_left()
end)
vim.keymap.set("n", "<a-Down>", function()
  require("tmux").move_bottom()
end)
vim.keymap.set("n", "<a-Up>", function()
  require("tmux").move_top()
end)
vim.keymap.set("n", "<a-Right>", function()
  require("tmux").move_right()
end)

-- Swap splits
vim.keymap.set("n", "<a-c-Left>", function()
  require("tmux").swap_left()
end)
vim.keymap.set("n", "<a-c-Down>", function()
  require("tmux").swap_bottom()
end)
vim.keymap.set("n", "<a-c-Up>", function()
  require("tmux").swap_top()
end)
vim.keymap.set("n", "<a-c-Right>", function()
  require("tmux").swap_right()
end)

-- Create splits
vim.keymap.set("n", "<c-Left>", ":leftabove vsplit<cr>")
vim.keymap.set("n", "<c-Down>", ":rightbelow split<cr>")
vim.keymap.set("n", "<c-Up>", ":leftabove split<cr>")
vim.keymap.set("n", "<c-Right>", ":rightbelow vsplit<cr>")

-- Resize splits
vim.keymap.set("n", "<A-S-Left>", function()
  require("tmux").resize_left(4)
end)
vim.keymap.set("n", "<A-S-Down>", function()
  require("tmux").resize_bottom(4)
end)
vim.keymap.set("n", "<A-S-Up>", function()
  require("tmux").resize_top(4)
end)
vim.keymap.set("n", "<A-S-Right>", function()
  require("tmux").resize_right(4)
end)

-- Move between tabs
vim.keymap.set("n", "<a-[>", ":tabp<cr>")
vim.keymap.set("n", "<a-]>", ":tabn<cr>")

-- Re-order tabs
vim.keymap.set("n", "<a-{>", ":-tabmove<cr>")
vim.keymap.set("n", "<a-}>", ":+tabmove<cr>")
