return {
    'stevearc/oil.nvim',
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {},
    -- Optional dependencies
    -- dependencies = { { "echasnovski/mini.icons", opts = {} } },
    dependencies = { "nvim-tree/nvim-web-devicons" },
    -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
    lazy = false,

    config = function()
        require('oil').setup({
            keymaps = {
                ["<C-h>"] = false, -- pra não sobrepor o atalho do harpoon
            },
            view_options = {
                show_hidden = true,
            }
        })
    end
}
