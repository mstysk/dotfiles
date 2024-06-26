-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    use 'vim-jp/vimdoc-ja'
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.4',
        -- or                            , branch = ''0'.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    use({
        'rose-pine/neovim',
        as = 'rose-pine',
        config = function()
            require("rose-pine").setup()
            vim.cmd('colorscheme rose-pine')
        end
    })

    use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
    use('nvim-treesitter/playground')
    use('theprimeagen/harpoon')
    use('mbbill/undotree')
    use('tpope/vim-fugitive')

    use 'wakatime/vim-wakatime'
    use 'machakann/vim-highlightedyank'
    use 'mattn/vim-sonictemplate'
    use 'lambdalisue/fern.vim'
    use 'lambdalisue/fern-renderer-nerdfont.vim'
    use 'lambdalisue/nerdfont.vim'
    use 'lambdalisue/fern-git-status.vim'
    use 'lambdalisue/glyph-palette.vim'
    use "github/copilot.vim"
    use 'godlygeek/tabular'
    use 'ktakayama/gpt-commit-msg.vim'
    use 'mbledkowski/neuleetcode.vim'
    use 'lewis6991/spellsitter.nvim'
    use 'cocopon/iceberg.vim'
    use 'morhetz/gruvbox'
    use 'altercation/vim-colors-solarized'
    use 'folke/tokyonight.nvim'
    use 'lukas-reineke/lsp-format.nvim'

    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        requires = {
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },
            { 'neovim/nvim-lspconfig' },
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'L3MON4D3/LuaSnip' },
        }

    }

    use({
        "utilyre/sentiment.nvim",
        tag = "*",
        config = function()
            require("sentiment").setup({
                -- config
            })
        end,
    })

    use({
        "CopilotC-Nvim/CopilotChat.nvim",
        branch = 'canary'
    })
end)
