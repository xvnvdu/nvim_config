require("nvchad.mappings")

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- insert new line below without splitting current one
vim.keymap.set("i", "<S-CR>", function()
	vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>o", true, false, true), "n", true)
end, { desc = "Insert new line (like 'o') in the insert mode" })

-- moving lines
vim.keymap.set("n", "<M-j>", ":m .+1<CR>==", { desc = "Move line down" })
vim.keymap.set("n", "<M-k>", ":m .-2<CR>==", { desc = "Move line up" })
vim.keymap.set("v", "<M-j>", ":m '>+1<CR>gv=gv", { desc = "Move selected lines down" })
vim.keymap.set("v", "<M-k>", ":m '<-2<CR>gv=gv", { desc = "Move selected lines up" })

-- indentation
vim.keymap.set("v", "<Tab>", ">gv", { desc = "Indent right in visual mode" })
vim.keymap.set("v", "<S-Tab>", "<gv", { desc = "Indent left in visual mode" })

-- window resizing
vim.keymap.set("n", "<Left>", "<Cmd>vertical resize -5<CR>")
vim.keymap.set("n", "<Right>", "<Cmd>vertical resize +5<CR>")
vim.keymap.set("n", "<Down>", "<Cmd>resize -5<CR>")
vim.keymap.set("n", "<Up>", "<Cmd>resize +5<CR>")

-- some basics
vim.keymap.set("n", "<leader>q", ":q<CR>")
vim.keymap.set("n", "<leader>e", ":Ex<CR>")

-- rename current buffer
vim.keymap.set("n", "<M-r>", function()
	vim.ui.input({ prompt = "New file name: " }, function(new_name)
		if new_name and new_name ~= "" then
			vim.cmd("file " .. new_name)
			vim.cmd("doautocmd BufRead")
			print("Buffer renamed to " .. new_name)
		end
	end)
end, { desc = "Rename buffer (and reload filetype)" })

vim.api.nvim_create_autocmd("BufNewFile", {
	pattern = "*",
	callback = function()
		vim.opt_local.swapfile = false
	end,
})

-- typst preview doc
vim.keymap.set("n", "<leader>p", "<Cmd>TypstPreview<CR>")

-- enter normal mode in terminal
vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], { noremap = true, silent = true })
