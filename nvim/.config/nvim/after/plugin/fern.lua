vim.keymap.set("n", "<leader>t", function() vim.cmd('Fern . -drawer -stay -keep -toggle -reveal=%') end)
vim.g['fern#renderer'] = 'nerdfont'
vim.g['fern#default_hidden'] = true

-- lua コマンドに移植したい
vim.cmd [[
augroup my-glyph-palette
    autocmd!
    autocmd FileType fern call glyph_palette#apply()
    autocmd FileType nerdtree call glyph_palette#apply()
    autocmd FileType startify call glyph_palette#apply()
augroup END
]]
