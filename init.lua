vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.number = true

-- [[ Install `lazy.nvim` plugin manager ]]
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
	vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
end
vim.opt.rtp:prepend(lazypath)

-- 3. Load Runner (Make sure this file actually exists!)
require('runner') -- Comment this out if it crashes!

-- 4. Load Plugins (This runs last)
require('lazy').setup('plugins')

vim.api.nvim_create_autocmd({ "BufLeave" }, {
	pattern = "*.*",
	callback = function()
		vim.cmd('write')
	end,
})

vim.api.nvim_create_autocmd({ "InsertEnter", "InsertLeave" }, {
	callback = function()
		vim.schedule(function()
			vim.cmd("nohlsearch")
		end)
	end,
})
vim.keymap.set('n', '<Tab>', ':bn<CR>', { noremap = true, silent = true })
