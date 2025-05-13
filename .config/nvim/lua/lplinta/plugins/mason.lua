return {
    "mason-org/mason.nvim",
    dependencies = {
        "mason-org/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",
    },

    config = function()
        require("mason").setup()

        require("mason-lspconfig").setup {
            ensure_installed = { "lua_ls", "rust_analyzer" },
        }
    end
}
