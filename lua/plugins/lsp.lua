return{
	'https://github.com/neovim/nvim-lspconfig',
	vim.diagnostic.config({
		virtual_text = {
			spacing = 4,
			source = "if_many",
			prefix = "●",
			-- this will set set the prefix to a function that returns the diagnostics icon based on the severity
			-- prefix = "icons",
		},
		severity_sort = true,
		signs = {
			active = true,
			text = {
				[vim.diagnostic.severity.ERROR] = "",
				[vim.diagnostic.severity.WARN]  = "",
				[vim.diagnostic.severity.HINT]  = "󰟃",
				[vim.diagnostic.severity.INFO]  = "",
			},
		},
		inlay_hints = {
			enabled = true,
			exclude = { "vue" }, -- filetypes for which you don't want to enable inlay hints
		},
	}),
}
