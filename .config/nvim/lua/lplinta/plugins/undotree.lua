return {
    "mbbill/undotree",
    config = function()
        vim.g.undotree_WindowLayout = 3
        vim.opt.undofile = true
        vim.opt.undodir = vim.fn.expand("~/.local/state/nvim/undo")

        local undodir = vim.opt.undodir:get()[1]
        vim.fn.mkdir(undodir, "p")

        vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)

        vim.api.nvim_create_user_command("CleanUndoFiles", function()
            local cmd = "find " .. undodir .. " -type f -mtime +30 -delete"
            vim.fn.system(cmd)
            print("Histórico de undo removido.")
        end, {})
    end,
}
