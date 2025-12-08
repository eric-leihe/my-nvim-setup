-- plugins/lsp.lua
return {
    {
        "neovim/nvim-lspconfig",
        -- Optional: Add dependencies if you're using other related plugins like mason.nvim
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
        },
        config = function()
            -- LSP configuration will go here
            -- require("lspconfig").lua_ls.setup {} -- Older way (deprecated in v0.11+)
            -- Setup keymaps on LspAttach
            vim.api.nvim_create_autocmd('LspAttach', {
                group = vim.api.nvim_create_augroup('UserLspConfig', {}),
                callback = function(ev)
                    -- Buffer local keymaps
                    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { buffer = ev.buf, desc = 'Go to declaration' })
                    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { buffer = ev.buf, desc = 'Go to definition' })
                    vim.keymap.set('n', '<leader>K', vim.lsp.buf.hover, { buffer = ev.buf, desc = 'Hover information' })
                    -- ... add other keymaps (references, rename, code action, etc.)
                end,
            })
            -- Use vim.lsp.enable or vim.lsp.config for v0.11+
            -- See step 2 for details
            require("mason").setup({
                ensure_installed = {
                    "lua_ls",
                    "pyright", -- Example: Python language server
                    -- Add more servers as needed
                },
                handlers = {
                    function(server_name)
                        require("lspconfig")[server_name].setup({})
                    end,
                }
            })
            require("mason-lspconfig").setup({})
        end,
    },
    -- Add other LSP-related plugins here, e.g., nvim-cmp, mason.nvim, etc.
}
