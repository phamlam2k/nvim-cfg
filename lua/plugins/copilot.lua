return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter", -- Chỉ khởi động khi bạn bắt đầu gõ code
    config = function()
      require("copilot").setup({
        suggestion = {
          enabled = true,
          auto_trigger = true, -- Tự động hiện gợi ý khi bạn gõ
          keymap = {
            accept = "<M-l>",  -- Nhấn Alt + L để chấp nhận gợi ý (M là Alt/Option)
            next = "<M-]>",    -- Alt + ] để xem gợi ý tiếp theo
            prev = "<M-[>",    -- Alt + [ để quay lại gợi ý trước
            dismiss = "<C-]>", -- Ctrl + ] để ẩn gợi ý
          },
        },
        panel = { enabled = false }, -- Tắt bảng điều khiển bên hông nếu không dùng
      })
      -- Thông báo để bạn biết Copilot đã chạy
      print("🤖 GitHub Copilot đã sẵn sàng!")
    end,
  },
}
