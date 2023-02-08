vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- packer
    use({ "wbthomason/packer.nvim", opt = true })
    -- help ja
    use "vim-jp/vimdoc-ja"
    -- color scheme
    use 'Rigellute/rigel'
    -- air_line
    use 'vim-airline/vim-airline'
    use 'vim-airline/vim-airline-themes'
    --  fean
    use 'lambdalisue/fern.vim'
    -- support
    use 'machakann/vim-highlightedyank'
    use 'wakatime/vim-wakatime'
    use 'direnv/direnv.vim'
    use 'editorconfig/editorconfig-vim'
    -- lsp
    use 'neovim/nvim-lspconfig'
    if packer_bootstrap then
        require("packer").sync()
    end
end)
