vim.g.mapleader = ' '
vim.keymap.set('n', '<leader>r', function()
    -- Get file details
    local filetype = vim.bo.filetype
    local filename = vim.fn.expand('%')
    local filename_no_ext = vim.fn.expand('%:r')

    -- Define commands with cleanup logic appended inside the shell string
    local commands = {
        python = 'python3 ' .. filename,
        javascript = 'node ' .. filename,
        typescript = 'ts-node ' .. filename,
        sh = 'bash ' .. filename,
        rust = 'cargo run',
        go = 'go run ' .. filename,
        -- For C, compile -> run -> delete executable (using ; to ensure delete runs even if execution fails)
        c = 'gcc ' .. filename .. ' -o ' .. filename_no_ext .. ' && ./' .. filename_no_ext .. '; rm -f ' .. filename_no_ext,
        -- For C++, same logic: compile -> run -> delete
        cpp = 'g++ -static -DMYPC ' .. filename .. ' -o ' .. filename_no_ext .. ' && ./' .. filename_no_ext .. '; rm -f ' .. filename_no_ext .. ' && cp '.. filename .. ' /mnt/c/Users/Wassim/dev/cp/codeforces',
        -- Note: Java produces .class files, so simple rm of filename_no_ext might not work without modification
        java = 'javac ' .. filename .. ' && java ' .. filename_no_ext,
    }

    local command = commands[filetype]

    if command then
        -- Open terminal and run the full command chain
        vim.cmd('vsplit | terminal ' .. "ulimit -s 262144 && " .. command)
        vim.cmd('startinsert')
    else
        print("No run command configured for: " .. filetype)
    end
    
    -- REMOVED: os.execute('rm ' .. filename_no_ext) 
    -- We removed this line because it runs too early.
end, { desc = 'Save and Run File' })
