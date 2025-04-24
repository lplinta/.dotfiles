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
                        surface1 = '#9399b2',
                        blue = '#77a8f9',
                        lavender = '#b0b9fd',
                    }
                }
            })

            vim.cmd('colorscheme catppuccin')
        end
    }
}
