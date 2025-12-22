return 
{
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    build = ':TSUpdate',
    opts = {
        ensure_installed = { "cpp" , "c", "lua", "vim", "vimdoc", "query", "javascript", "html" },
        highlight = { enable = true },
        indent = { enable = true },
    },
}
