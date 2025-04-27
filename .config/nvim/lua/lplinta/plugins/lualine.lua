return {
    'nvim-lualine/lualine.nvim',
    dependencies = {
        'nvim-tree/nvim-web-devicons',
    },
    config = function()
        local clients_lsp = function()
            local clients = vim.lsp.get_clients()
            if next(clients) == nil then
                return ''
            end
            return '⁘'
        end

        local custom_catppuccin = require("lualine.themes.catppuccin")

        custom_catppuccin.normal.a.bg = "#cba6f7"
        custom_catppuccin.normal.b.fg = "#cba6f7"
        custom_catppuccin.visual.a.bg = "#89dceb"
        custom_catppuccin.visual.b.fg = "#89dceb"

        require('lualine').setup({
            options = {
                theme = custom_catppuccin,
                component_separators = '',
                section_separators = { left = '', right = '' },
                disabled_filetypes = { 'alpha', 'Outline' },
            },
            sections = {
                lualine_a = {
                    { 'mode', separator = { left = '', right = '' } },
                },
                lualine_b = {'filename'},
                lualine_c = {
                    {
                        'branch',
                        icon = '',
                    },
                    {
                        'diff',
                        symbols = { added = '● ', modified = ' ', removed = '☉ ' },
                        colored = false,
                    },
                },
                lualine_x = {
                    {
                        'diagnostics',
                        symbols = { error = '● ', warn = '● ', info = '● ', hint = '● ' },
                        update_in_insert = true,
                    },
                },
                lualine_y = {
                    {
                        clients_lsp,
                        color = { bg = '#282c34' }
                    }
                },
                lualine_z = {},
            },
            extensions = { 'trouble' },
        })
    end,
}
