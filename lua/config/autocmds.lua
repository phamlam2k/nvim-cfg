-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")
-- Example autocmd for organizing imports on BufWritePre
-- Dùng stdpath("config") thay vì đường dẫn cứng ~/.config/nvim để portable
-- trên cả macOS/Linux (~/.config/nvim) lẫn Windows (~/AppData/Local/nvim).
vim.api.nvim_create_autocmd("BufNewFile", {
    pattern = "*.cpp",
    command = "0r " .. vim.fn.stdpath("config") .. "/templates/cpp.cpp",
})
