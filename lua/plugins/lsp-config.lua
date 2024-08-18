return {
    {
        "williamboman/mason.nvim",
        lazy = false,
        config = function()
            require("mason").setup({
                ui = {
                    icons = {
                        package_installed = "✓",
                        package_pending = "➜",
                        package_uninstalled = "✗"
                    }
                }
            })
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        lazy = false,
        opts = {
            auto_install = true,
        },
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "lua_ls",
                    "clangd",
                    "basedpyright",
                    "julials",
                    "jdtls",
                    "jsonls",
                    "html",
                    "cssls",
                    "tsserver",
                    "asm_lsp"
                }
            })
        end
    },
    {
        "neovim/nvim-lspconfig",
        lazy = false,
        config = function()
            --local capabilities = require('cmp_nvim_lsp').default_capabilities()

            local lspconfig = require("lspconfig")
            local lsp_capabilities = vim.lsp.protocol.make_client_capabilities()

            -- define autocompletion capabilitites
            local cmp_capabilities = require("cmp_nvim_lsp").default_capabilities(lsp_capabilities)

            lspconfig.clangd.setup({
                capabilities = cmp_capabilities,
                filetypes = { 'c', 'cpp', 'objc', 'objcpp', 'cuda', 'proto' },
                cmd = { "clangd", "--background-index" , "--clang-tidy", "--header-insertion=iwyu", "--suggest-missing-includes", "--cross-file-rename", "--function-arg-placeholders", "fallback-style=llvm", "-std=c++17" },
                options = {
                    clangdFileStatus = true,
                    usePlaceholders = true,
                    completeUnimported = true,
                },
            })
            lspconfig.basedpyright.setup({
                capabilities = cmp_capabilities,
            })
            lspconfig.lua_ls.setup({
                capabilities = cmp_capabilities,
            })
            lspconfig.julials.setup({
                capabilities = cmp_capabilities,
            })
            lspconfig.jdtls.setup({
                capabilities = cmp_capabilities,
            })
            lspconfig.tsserver.setup({
                capabilities = cmp_capabilities,
            })
            lspconfig.jsonls.setup({
                capabilities = cmp_capabilities,
            })
            lspconfig.html.setup({
                capabilities = cmp_capabilities,
            })
            lspconfig.cssls.setup({
                capabilities = cmp_capabilities,
            })
            lspconfig.asm_lsp.setup({
                capabilities = cmp_capabilities,
            })

            vim.keymap.set("n", "K", vim.lsp.buf.hover, { noremap = true, silent = true, desc = "Show Hover" })
            vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, { noremap = true, silent = true, desc = "Go to Definition" })
            vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, { noremap = true, silent = true, desc = "Show References" })
            vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { noremap = true, silent = true, desc = "Code Action" })
        end,
    },
}
