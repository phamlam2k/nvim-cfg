return {
  -- 1. Tắt hoàn toàn ts_ls mặc định của LazyVim để tránh xung đột
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        ts_ls = { enabled = false },
        tsserver = { enabled = false },
      },
    },
  },

  -- 2. Cấu hình typescript-tools để chuyên trị MUI
  {
    "pmizio/typescript-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    opts = {
      settings = {
        tsserver_file_preferences = {
          -- Ép buộc dùng direct import (e.g., @mui/material/Button)
          importModuleSpecifierPreference = "non-relative",
          importModuleSpecifierEnding = "minimal",
          includeCompletionsForModuleExports = true,
          includeCompletionsForImportStatements = true,
        },
        -- Tự động thêm import khi nhấn save hoặc qua code action
        expose_as_code_action = "all",
      },
    },
    config = function(_, opts)
      require("typescript-tools").setup(opts)
      -- Thông báo để bạn biết chắc chắn nó đã chạy
      print("🚀 MUI TypeScript-Tools đã sẵn sàng!")
    end,
  },
}
