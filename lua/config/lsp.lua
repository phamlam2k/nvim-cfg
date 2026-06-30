return {
    "neovim/nvim-lspconfig",
    opts = {
        servers = {
            vtsls = {},
            eslint = {},
            clangd = {},
        },
        setup = {
            eslint = function()
                vim.api.nvim_create_autocmd("BufWritePre", {
                    callback = function(event)
                        -- Sử dụng hàm mới để tránh lỗi Deprecated
                        local clients = vim.lsp.get_clients({ bufnr = event.buf, name = "eslint" })
                        if #clients > 0 then
                            vim.cmd("EslintFixAll")
                        end
                    end,
                })
            end,
        },
    },
}
