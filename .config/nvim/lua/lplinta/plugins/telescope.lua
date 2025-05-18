return {
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.8',
        dependencies = {
            'nvim-lua/plenary.nvim',
            { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
        },

        config = function()
            require('telescope').setup {
                extensions = {
                    fzf = {}
                }
            }
            require('telescope').load_extension('fzf')

            local builtin = require('telescope.builtin')

            -- file pickers
            vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
            vim.keymap.set('n', '<leader>en', function()
                builtin.find_files {
                    cwd = vim.fn.stdpath('config')
                }
            end)
            vim.keymap.set('n', '<leader>fs', builtin.live_grep, {})
            vim.keymap.set('n', '<leader>fis', builtin.grep_string, {})

            -- vim pickers
            vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
            vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

            -- lsp pickers
            vim.keymap.set('n', '<leader>gd', builtin.lsp_definitions, {})
            vim.keymap.set('n', '<leader>gtd', builtin.lsp_type_definitions, {})
            vim.keymap.set('n', '<leader>gr', builtin.lsp_references, {})
            vim.keymap.set('n', '<leader>gi', builtin.lsp_implementations, {})
        end
    }
}
