require("config.lazy")
vim.opt.scrolloff = 4 -- Lines of context
vim.opt.relativenumber = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.splitright = true
vim.opt.termguicolors = true
vim.cmd("colorscheme gruvbox")
vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function()
        vim.highlight.on_yank()
    end,
})
require("scripts.run")
require("config.keymaps")
