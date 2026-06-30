return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        tailwindcss = {},
        html = {},
        cssls = {},
        jsonls = {},
        clangd = {
          keys = {
            { "<leader>ch", "<cmd>ClangdSwitchSourceHeader<cr>", desc = "Switch Source/Header (C++)" },
          },
          -- KHÔNG đặt root_dir tùy chỉnh ở đây: Neovim 0.11 (vim.lsp.config) truyền
          -- (bufnr, on_dir) chứ không phải (fname). Hàm cũ kiểu function(fname) sẽ throw
          -- "vim/fs.lua: expected string, got number" và clangd sẽ không attach.
          -- root_markers mặc định đã bao gồm compile_commands.json / compile_flags.txt / .git.
          root_markers = {
            ".clangd",
            ".clang-tidy",
            ".clang-format",
            "compile_commands.json",
            "compile_flags.txt",
            ".git",
          },
          capabilities = {
            offsetEncoding = { "utf-16" }, -- Fix lỗi encoding thường gặp trên C++
          },
          cmd = {
            "clangd",
            "--background-index",
            "--clang-tidy",
            "--header-insertion=never", -- Không tự động thêm include linh tinh
            "--completion-style=detailed",
            "--function-arg-placeholders",
            "--fallback-style=llvm",
          },
        },
      },
    },
  },
}
