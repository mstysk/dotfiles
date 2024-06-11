local lsp_zero = require('lsp-zero')
local lspconfig = require('lspconfig')
local lsp_format = require('lsp-format')

-- lsp-format setup
lsp_format.setup {}
-- lsp settings
lspconfig.denols.setup({
    root_dir = lspconfig.util.root_pattern("deno.json", "deno.jsonc"),
})

lspconfig.tsserver.setup({
    root_dir = lspconfig.util.root_pattern("package.json"),
    single_file_support = false,
})

lsp_zero.on_attach(function(clinet, bufnr)
    lsp_zero.default_keymaps({buffer = bufnr})
end)

lsp_zero.set_sign_icons({
    error = 'E',
    warn = 'W',
    hint = 'H',
    info = 'I'
})

require('mason').setup({})
local mason_lspconfig = require('mason-lspconfig');
require('mason-lspconfig').setup({
    handlers = {
        function(server_name)
            if (server_name == 'denols' or server_name == 'tsserver') then
                return
            end
            lspconfig[server_name].setup {
                on_attach = lsp_format.on_attach,
            }
        end
    },
})


local cmp = require('cmp')
local cmp_action = lsp_zero.cmp_action()

require('luasnip.loaders.from_vscode').lazy_load()

cmp.setup({
    sources = {
        {name = 'path'},
        {name = 'nvim_lsp'},
        {name = 'luasnip', keyword_length = 2},
        {name = 'buffer', keyword_length = 3},
    },
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered()
    },
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert({
        -- confirm completion item
        ['<Enter>'] = cmp.mapping.confirm({ select = true }),
        -- trigger completion menu
        ['<C-Space>'] = cmp.mapping.complete(),

        -- scroll up an down the documentation window
        ['<C-u>'] = cmp.mapping.scroll_docs(-4),
        ['<C-d>'] = cmp.mapping.scroll_docs(4),

        -- navigate between snippet placeholders
        ['<C-f>'] = cmp_action.luasnip_jump_forward(),
        ['<C-b>'] = cmp_action.luasnip_jump_backward(),
    }),
    -- note: if you are going to use lsp-kind (another plugin)
    -- replace the line below with the function from lsp-kind
    formatting = lsp_zero.cmp_format({details = true}),
})
