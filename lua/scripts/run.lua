return{
    "run",
    run = function ()
        vim.cmd("write")
        if vim.bo.filetype ~= "cpp" then
            print("This is not a C++ file.")
            return false
        end
        local filepath = vim.api.nvim_buf_get_name(0)
        local dir = vim.fs.dirname(filepath)
        local filename = vim.fs.basename(filepath)
        local filename_no_ext = vim.fn.fnamemodify(filename, ":r")
        local flags = "-Wall -Wextra -Wshadow -Wno-unused -D_GLIBCXX_ASSERTIONS -DDEBUG -ggdb3 -fmax-errors=2 -DMYPC -std=c++23 " --make sure it ends with a space
        local exe = string.format("%s/%s",dir,filename_no_ext)
        local compile = string.format("g++ %s %s/%s -o %s",flags,dir,filename,exe)
        vim.cmd("vsplit | term " .. "ulimit -s 524288 && echo compiling.. && " .. compile .. " && ".. "echo running && " .. exe .. " && rm " .. exe)
		return true
    end
}
