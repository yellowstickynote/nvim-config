return
{
    "L3MON4D3/LuaSnip",
    config = function()
        vim.fn.system("echo fuck my life && cp /mnt/c/Users/Wassim/AppData/Roaming/Code/User/snippets/cpp.json ~/.config/nvim/lua/snippets/cpp.jsonc")
        local ls = require("luasnip")
        vim.keymap.set({"i","s"},"<c-k>", function()
            if ls.expand_or_jumpable() then
                ls.expand_or_jump()
            end
        end,{silent = true})
        -- specify the full path...
        require("luasnip.loaders.from_vscode").lazy_load({paths = "~/.config/nvim/lua/snippets"})
    end,
}
