



require("config.lazy")
require("config.settings")


vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
    pattern = "*.mly",
    callback = function()
        -- Disable standard auto-indentation
        vim.opt_local.autoindent = false
        vim.opt_local.smartindent = false
        vim.opt_local.cindent = false
        
        -- Clear the indentation expression (crucial if you have language plugins)
        vim.opt_local.indentexpr = ""
    end,
})
