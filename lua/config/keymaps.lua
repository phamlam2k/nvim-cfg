-- lua/keymaps.lua
vim.keymap.set("n", "<leader>r", function()
    local file = vim.fn.expand("%")
    local exe = vim.fn.expand("%:r")

    vim.cmd("w")

    vim.cmd("split | terminal g++ -std=c++20 -O2 " .. file .. " -o " .. exe .. " && ./" .. exe)
end)
