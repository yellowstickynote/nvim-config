-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = LazyVim.safe_keymap_set
map({ "n" }, "<Tab>", ":w<bar>bn<CR>", { desc = "switch tab", silent = true })
map({ "n" }, "<leader>a", ":%y+<CR>", { desc = "yank buffer", silent = true })

--running c++ files
local run = require("scripts/run").run
vim.keymap.set('n', '<leader>r',
    function()
        run()
        vim.api.nvim_feedkeys('A','n',false)
    end, { desc = 'Save and run file' })
vim.keymap.set('n', '<leader>pr',
    function()
        run()
    end, { desc = 'Save and run file in persistent terminal' })

local notests = require("scripts/testcases").notests
vim.keymap.set('n','<leader>t',
    function ()
        notests()
    end
    ,{silent = true}
)

