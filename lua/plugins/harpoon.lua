function extract_filenames(items)
	local out = {}
	for i, v in ipairs(items) do
		out[i] = v.value
	end
	return out
end

return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	keys = {
		{
			"<Space>a",
			function()
				require("harpoon"):list():add()
			end,
			noremap = true, silent = true, desc = "Harpoon: add mark",
		},
		{
			"<Space>e",
			function()
				require("harpoon").ui:toggle_quick_menu(require("harpoon"):list())
			end,
			noremap = true, silent = true, desc = "Harpoon: view marks",
		},
		{
			"<C-h>",
			function()
				require("harpoon"):list():select(1)
			end,
			noremap = true, silent = true, desc = "Harpoon: nav file 1",
		},
		{
			"<C-t>",
			function()
				require("harpoon"):list():select(2)
			end,
			noremap = true, silent = true, desc = "Harpoon: nav file 2",
		},
		{
			"<C-n>",
			function()
				require("harpoon"):list():select(3)
			end,
			noremap = true, silent = true, desc = "Harpoon: nav file 3",
		},
		{
			"<C-s>",
			function()
				require("harpoon"):list():select(4)
			end,
			noremap = true, silent = true, desc = "Harpoon: nav file 4",
		},
	},
	config = function()
		local harpoon = require('harpoon')
		harpoon:setup()

		if not vim.g.tabline_tree_offset then
			vim.g.tabline_tree_offset = 0
		end

		function tabline()
			local s = ""
			local fill_amount = vim.g.tabline_tree_offset

			if vim.g.tabline_separator then
				fill_amount = fill_amount - 1
				if fill_amount < 0 then
					fill_amount = 0
				end
			end

			for i = 0, fill_amount do
				s = s .. " "
			end

			if vim.g.tabline_separator then
				s = s .. vim.g.tabline_separator
			end
			local marked_files = extract_filenames(harpoon:list().items)
			local cwd = vim.fn.getcwd()
			local current_file = vim.api.nvim_buf_get_name(0):gsub("^" .. cwd .. "/", "")

			for i, f in ipairs(marked_files) do
				if f == current_file then
					f = string.upper(f)
				end
				s = s .. " " .. i .. " " .. f .. " " .. vim.g.tabline_separator
			end

			return s
		end
		vim.go.tabline = '%!v:lua.tabline()'
	end
}
