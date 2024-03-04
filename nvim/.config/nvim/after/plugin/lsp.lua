local lsp_zero = require("lsp-zero")


lsp_zero.on_attach(function(client, bufnr)
    lsp_zero.default_keymaps({buffer = bufnr})
end)

require('mason').setup({})
require('mason-lspconfig').setup({
  handlers = {
    lsp_zero.default_setup,
    lua_ls = function()
      local lua_opts = lsp_zero.nvim_lua_ls()
      require('lspconfig').lua_ls.setup(lua_opts)
    end,
  }
})

local cmp = require('cmp')
local cmp_action = lsp_zero.cmp_action()

-- this is the function that loads the extra snippets
-- from rafamadriz/friendly-snippets
require('luasnip.loaders.from_vscode').lazy_load()

cmp.setup({
  -- if you don't know what is a "source" in nvim-cmp read this:
  -- https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/autocomplete.md#adding-a-source
  sources = {
    {name = 'path'},
    {name = 'nvim_lsp'},
    {name = 'luasnip', keyword_length = 2},
    {name = 'buffer', keyword_length = 3},
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  -- default keybindings for nvim-cmp are here:
  -- https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/README.md#keybindings-1
  mapping = cmp.mapping.preset.insert({
    -- confirm completion item
    ['<Enter>'] = cmp.mapping.confirm({ select = true }),

    -- trigger completion menu
    ['<C-Space>'] = cmp.mapping.complete(),

    -- scroll up and down the documentation window
    ['<C-u>'] = cmp.mapping.scroll_docs(-4),
    ['<C-d>'] = cmp.mapping.scroll_docs(4),   

    -- navigate between snippet placeholders
    ['<C-f>'] = cmp_action.luasnip_jump_forward(),
    ['<C-b>'] = cmp_action.luasnip_jump_backward(),
  }),
  -- note: if you are going to use lsp-kind (another plugin)
  -- replace the line below with the function from lsp-kind
  formatting = lsp_zero.cmp_format(),
})


---
--local lsp_zero = require("lsp-zero")
--
--lsp_zero.on_attach(function(client, bufnr)
--    lsp_zero.default_keymaps({buffer = bufnr})
--end)
--
--lsp_zero.set_sign_icons({
--    error = 'E',
--    warn = 'W',
--    hint = 'H',
--    info = 'I'
--})
--
--require('mason').setup({})
--require('mason-lspconfig').setup({
--    handlers = {
--        lsp_zero.default_setup,
--        lua_ls = function()
--            local lua_opts = lsp_zero.nvim_lua_ls()
--            require('lspconfig').lua_ls.setup(lua_opts)
--        end,
--    }
--})
--
--local cmp = require('cmp')
--local cmp_action = lsp_zero.cmp_action()
--
--cmp.setup({
--    sources = {
--        {name = 'path'},
--        {name = 'nvim_lsp'},
--        {name = 'buffer'},
--        {name = 'luasnip', keyuword_length = 2},
--        {name = 'buffer', keyword_kength = 3},
--    },
--    window = {
--        completion = cmp.config.window.bordered(),
--        documentation = cmp.config.window.bordered(),
--    },
--})

-- local lsp = require("lsp-zero")
-- 
-- lsp.preset("recommended")
-- 
-- lsp.ensure_installed({
--   'tsserver',
--   'lua_ls',
--   'rust_analyzer',
--   'phpactor'
-- })
-- 
-- lsp.configure('lua_ls', {
--   settings = {
--     Lua = {
--       diagnostics = {
--         globals = { 'vim' }
--       }
--     }
--   }
-- })
-- 
-- local cmp = require('cmp')
-- local cmp_select = {behavior = cmp.SelectBehavior.Select}
-- local cmp_mappings = lsp.defaults.cmp_mappings({
--   ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
--   ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
--   ['<C-y>'] = cmp.mapping.confirm({ select = true }),
--   ['<C-Space>'] = cmp.mapping.complete(),
-- })
-- 
-- cmp_mappings['<Tab>'] = nil
-- cmp_mappings['<S-Tab>'] = nil
-- 
-- lsp.setup_nvim_cmp({
--   suggest_lsp_servers = false,
--   sign_icons = {
--     error = 'E',
--     warn = 'W',
--     hint = 'H',
--     info = 'I'
--   }
-- })
-- 
-- lsp.on_attach(function(client, bufnr)
--   local opts = {buffer = bufnr, remap = false }
-- 
--   vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
--   vim.keymap.set("n", "gr", function() vim.lsp.buf.references() end, opts)
--   vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
--   vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
--   vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
--   vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
--   vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
--   vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
--   vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
--   vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
--   vim.keymap.set("n", "<C-e>", function() vim.lsp.buf.diagnostic() end, opts)
-- end)
-- 
-- lsp.setup()
-- 
-- vim.diagnostic.config({
--   virtual_text = true
-- })
