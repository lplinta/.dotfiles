return {
    {
        'saghen/blink.cmp',
        dependencies = 'rafamadriz/friendly-snippets',

        version = 'v0.*',

        opts = {
            keymap = { preset = 'super-tab' },

            appearance = {
                use_nvim_cmp_as_default = true
            },

            signature = { enabled = true },

            sources = {
                default = { 'lsp' },
            },

            completion = {
                ghost_text = {
                    enabled = true,
                    show_with_menu = false
                },
                menu = {
                    auto_show = false
                },
            },
        },
    },
}
