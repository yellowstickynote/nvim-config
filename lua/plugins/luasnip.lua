return{
	{
		"https://github.com/L3MON4D3/LuaSnip",
		setup = function()
			require("luasnip.loaders.from_vscode").load({ paths = "~/.config/nvim/lua/snippets" })
		end,
	},
}

