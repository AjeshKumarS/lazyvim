return {
    {
        "williamboman/mason.nvim",
        opts = {
            registries = {
                "github:nvim-java/mason-registry",
                "github:mason-org/mason-registry",
            },
        },
        config = function(_, opts)
            require("mason").setup(opts)
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        opts = {
            handlers = {
                ["jdtls"] = function()
                    require("java").setup()
                end,
            },
            ensure_installed = { "lua_ls", "golangci_lint_ls", "gopls" },
        },
        config = function(_, opts)
            require("mason-lspconfig").setup(opts)
        end,
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            local capabilities = require("cmp_nvim_lsp").default_capabilities()
            local lspconfig = require("lspconfig")
            lspconfig.lua_ls.setup({
                capabilities = capabilities,
            })
            lspconfig.golangci_lint_ls.setup({
                capabilities = capabilities,
            })
            lspconfig.gopls.setup({
                capabilities = capabilities,
            })
            lspconfig.tsserver.setup({
                capabilities = capabilities,
            })
            lspconfig.eslint.setup({
                capabilities = capabilities,
            })
            lspconfig.ansiblels.setup({
                capabilities = capabilities,
            })
            lspconfig.jdtls.setup({
                capabilities = capabilities,
            })

            vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
            vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
        end,
    },

    {
        "nvim-treesitter/nvim-treesitter",
        opts = function(_, opts)
            -- add tsx and treesitter
            vim.list_extend(opts.ensure_installed, {
                "bash",
                "go",
                "html",
                "javascript",
                "json",
                "lua",
                "markdown",
                "markdown_inline",
                "python",
                "query",
                "regex",
                "tsx",
                "typescript",
                "vim",
                "yaml",
            })
        end,
    },

    -- add any tools you want to have installed below
    {
        "williamboman/mason.nvim",
        opts = {
            ensure_installed = {
                "stylua",
                "shellcheck",
                "shfmt",
                "flake8",
            },
        },
    },
}
