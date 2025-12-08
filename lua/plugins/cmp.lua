return {
    "hrsh7th/nvim-cmp",

    dependencies = {
        -- Required dependency for LSP source
        'hrsh7th/cmp-nvim-lsp',

        -- Other common sources you might need:
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'L3MON4D3/LuaSnip',
      },

    event = { "InsertEnter", "CmdlineEnter" },
    config = function()
        local cmp = require("cmp")
        local luasnip = require('luasnip')

        luasnip.config.setup({})

        cmp.setup({
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end,
            },
            window = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered(),
            },
            completion = {
                autocomplete = { cmp.TriggerEvent.TextChanged, cmp.TriggerEvent.InsertEnter },
                },
            mapping = cmp.mapping.preset.insert({
                ['<C-p>'] = cmp.mapping.select_prev_item(),
                ['<C-n>'] = cmp.mapping.select_next_item(),
                ['<Up>'] = cmp.mapping.select_prev_item(),
                ['<Down>'] = cmp.mapping.select_next_item(),
                ['<C-d>'] = cmp.mapping.scroll_docs(-4),
                ['<C-f>'] = cmp.mapping.scroll_docs(4),
                ['<C-Space>'] = cmp.mapping.complete(),
                -- Use <Enter> to confirm the selection
                ['<CR>'] = cmp.mapping.confirm({ select = true }),
                -- Or use <C-y> (Control+Y) as the original default
                -- ['<C-y>'] = cmp.mapping.confirm({ select = true }), 
                -- Example for using Tab to select next item (useful with snippet plugins)
                ['<Tab>'] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_next_item()
                        elseif luasnip.expand_or_locally_jumpable() then
                            luasnip.expand_or_jump()
                        else
                            fallback()
                        end
                    end, { 'i', 's' }),
                ['<S-Tab>'] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_prev_item()
                        elseif luasnip.locally_jumpable(-1) then
                            luasnip.jump(-1)
                        else
                            fallback()
                        end
                    end, { 'i', 's' }),

                ['<C-e>'] = cmp.mapping.abort(),
            }),

            sources = cmp.config.sources({
                { name = 'nvim_lsp', max_item_count = 10 },
                { name = 'luasnip' },
                }, {
                { name = 'buffer', max_item_count = 10 },
                { name = 'nvim_lua' },
                { name = 'path', max_item_count = 10 },
            }),
        })
    end,
}
