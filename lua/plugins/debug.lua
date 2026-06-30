return {
    -- Cấu hình DAP cho C/C++ dùng codelldb (đã cài qua Mason).
    -- Rust KHÔNG cần ở đây: rustaceanvim tự phát hiện codelldb và tạo cấu hình debug
    -- (dùng phím "rd" -> RustLsp debuggables).
    {
        "mfussenegger/nvim-dap",
        optional = true,
        opts = function()
            local dap = require("dap")

            -- Adapter codelldb (server mode)
            if not dap.adapters.codelldb then
                dap.adapters.codelldb = {
                    type = "server",
                    port = "${port}",
                    executable = {
                        command = vim.fn.exepath("codelldb"),
                        args = { "--port", "${port}" },
                    },
                }
            end

            -- Cấu hình launch cho C và C++
            for _, lang in ipairs({ "c", "cpp" }) do
                dap.configurations[lang] = {
                    {
                        name = "Launch file (codelldb)",
                        type = "codelldb",
                        request = "launch",
                        program = function()
                            -- Hỏi đường dẫn file thực thi (mặc định: tên file hiện tại bỏ đuôi)
                            local default = vim.fn.expand("%:p:r")
                            return vim.fn.input("Path to executable: ", default, "file")
                        end,
                        cwd = "${workspaceFolder}",
                        stopOnEntry = false,
                        args = {},
                    },
                }
            end
        end,
    },
}
