return
    {
        "testcases",
        notests = function ()
            local line = vim.fn.search("cin >> t","n");
            if(line ~= 0) then
                vim.api.nvim_buf_set_lines(0, line-1, line, false, {})
            end
            vim.notify("❎ cin>>t removed")
        end
    }
