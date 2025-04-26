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
            return '⁘ '
        end

        require('lualine').setup({
            options = {
                theme = 'catppuccin',
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
