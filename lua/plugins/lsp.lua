return {
	'neovim/nvim-lspconfig',
	-- Ensuring blink.cmp is treated as a dependency so it's available
	dependencies = { 'saghen/blink.cmp' }, 
	config = function()
		-- 1. Configure Diagnostics
		vim.diagnostic.config({
			virtual_text = {
				spacing = 4,
				source = "if_many",
				prefix = "●",
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
				exclude = { "vue" },
			},
		})

		-- 2. Inject blink.cmp capabilities into lspconfig globally
		-- This ensures ANY language server you setup inherits blink's capabilities
		local lspconfig = require('lspconfig')
		local lspconfig_defaults = lspconfig.util.default_config
		
		lspconfig_defaults.capabilities = vim.tbl_deep_extend(
			'force',
			lspconfig_defaults.capabilities,
			require('blink.cmp').get_lsp_capabilities()
		)

		-- 3. Setup your language servers normally below
		-- lspconfig.ts_ls.setup({})
		-- lspconfig.pyright.setup({})
	end
}
