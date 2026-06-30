return {
    -- THE Rust plugin cho Neovim (thay thế rust-tools.nvim cũ)
    {
        "mrcjkb/rustaceanvim",
        version = "^5",
        lazy = false,
        ft = { "rust" },
        config = function()
            vim.g.rustaceanvim = {
                tools = {
                    hover_actions = { auto_focus = true },
                    inlay_hints = { auto = true },
                },
                server = {
                    on_attach = function(_, bufnr)
                        local map = function(k, v, desc)
                            vim.keymap.set("n", k, v,
                                { buffer = bufnr, desc = "Rust: " .. desc })
                        end
                        -- LSP cơ bản
                        map("K", vim.lsp.buf.hover, "Hover docs")
                        map("gd", vim.lsp.buf.definition, "Go to definition")
                        map("gr", vim.lsp.buf.references, "References")
                        map("rn", vim.lsp.buf.rename, "Rename symbol")

                        -- Rust-specific (dùng nhiều nhất)
                        map("ra", function()
                            vim.cmd.RustLsp("codeAction")
                        end, "Code action")
                        map("rr", function()
                            vim.cmd.RustLsp("runnables")
                        end, "Runnables ▶")
                        map("rt", function()
                            vim.cmd.RustLsp("testables")
                        end, "Testables")
                        map("re", function()
                            vim.cmd.RustLsp("expandMacro")
                        end, "Expand macro")
                        map("rc", function()
                            vim.cmd.RustLsp("openCargo")
                        end, "Open Cargo.toml")
                        map("rd", function()
                            vim.cmd.RustLsp("debuggables")
                        end, "Debug")

                        -- Auto-format khi save
                        vim.api.nvim_create_autocmd("BufWritePre", {
                            buffer = bufnr,
                            callback = function()
                                vim.lsp.buf.format({ async = false })
                            end,
                        })
                    end,
                    settings = {
                        ["rust-analyzer"] = {
                            cargo = { allFeatures = true },
                            -- rust-analyzer mới: checkOnSave là boolean, command/extraArgs nằm trong `check`
                            checkOnSave = true,
                            check = {
                                command = "clippy", -- clippy thay vì check
                                extraArgs = { "--no-deps" },
                            },
                            procMacro = { enable = true },
                            inlayHints = {
                                parameterHints = { enable = true },
                                typeHints = { enable = true },
                                chainingHints = { enable = true },
                            },
                        },
                    },
                },
            }
        end,
    },

    -- Hỗ trợ Cargo.toml: xem version, update crates
    {
        "saecki/crates.nvim",
        event = { "BufRead Cargo.toml" },
        opts = { completion = { cmp = { enabled = true } } },
    },

    -- QUAN TRỌNG: Mason có cài sẵn package "rust-analyzer" và mason-lspconfig mặc định
    -- tự bật (automatic_enable) MỌI server đã cài -> sẽ chạy rust_analyzer SONG SONG với
    -- instance mà rustaceanvim tự quản lý => 2 process rust-analyzer cùng index 1 project.
    -- Loại rust_analyzer khỏi automatic_enable để chỉ rustaceanvim quản lý nó.
    {
        "mason-org/mason-lspconfig.nvim",
        opts = {
            automatic_enable = {
                exclude = { "rust_analyzer" },
            },
        },
    },

    -- Belt-and-suspenders: cũng tắt rust_analyzer ở phía lspconfig của LazyVim.
    {
        "neovim/nvim-lspconfig",
        opts = {
            servers = {
                rust_analyzer = { enabled = false },
            },
        },
    },
}
