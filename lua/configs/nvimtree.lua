local function my_on_attach(bufnr)
	local api = require("nvim-tree.api")

	local function copy_cd_command()
		local root = api.tree.get_nodes()
		if root and root.absolute_path then
			local cd_cmd = "cd " .. root.absolute_path .. " && clear"
			vim.fn.setreg("+", cd_cmd)
			print(" 📋 Copied: " .. cd_cmd)
		else
			print(" ❌ Failed to get nvim-tree root path")
		end
	end

	local function opts(desc)
		return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
	end

	api.config.mappings.default_on_attach(bufnr)

	vim.keymap.set("n", "o", api.tree.change_root_to_node, opts("CD_in"))
	vim.keymap.set("n", "u", api.tree.change_root_to_parent, opts("CD_up"))

	vim.keymap.set("n", "<leader>cp", copy_cd_command, opts("Copy 'cd <dir>' to clipboard"))
end

require("nvim-tree").setup({
	on_attach = my_on_attach,
	renderer = { root_folder_label = false },
	git = { enable = true },
})
