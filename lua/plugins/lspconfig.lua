return {
	'neovim/nvim-lspconfig',
	config = function()
		vim.diagnostic.config({
			virtual_text = true,
			signs = true,
			underline = true,
			update_in_insert = false,
			severity_sort = true,
		})
		vim.lsp.config.clangd = {
			cmd = {
				"clangd",
				"--background-index",
				"--clang-tidy",
				"--header-insertion=iwyu",
				"--completion-style=detailed",
				"--function-arg-placeholders=true",
			},
			filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },
			root_markers = {
				'compile_commands.json',
				'compile_flags.txt',
				'.git'
			},
		}

		vim.lsp.enable('clangd')

		vim.api.nvim_create_autocmd({ "TextChanged", "TextChangedI" }, {
			pattern = "*.*",
			callback = function()
				vim.diagnostic.show()
			end,
		})
	end
}
