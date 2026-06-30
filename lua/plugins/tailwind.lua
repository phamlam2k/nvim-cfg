return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        tailwindcss = {
          settings = {
            tailwindCSS = {
              classAttributes = { "class", "className", "clsx", "cva" },
            },
          },
        },
      },
    },
  },
}
