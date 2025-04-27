return {
    {
        'catppuccin/nvim',
        name = 'catppuccin',
        priority = 1000,

        config = function()
            require('catppuccin').setup({
                flavour = 'mocha',
                color_overrides = {
                    mocha = {
                        base = '#282c34',
                        mantle = '#282c34',
                        blue = '#77a8f9',
                        lavender = '#b0b9fd',
                    }
                },
                integrations = {
                    harpoon = true,
                    treesitter = true,
                    telescope = {
                        enabled = true
                    }
                },
                custom_highlights = {
                    BlinkCmpGhostText = { fg = '#545a68', italic = true },
                    BlinkCmpMenu = { bg = '#2e303e' }
                }
            })

            vim.cmd('colorscheme catppuccin')
        end
    }
}
