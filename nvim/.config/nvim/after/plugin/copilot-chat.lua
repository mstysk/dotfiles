require("CopilotChat").setup {
    debug = true,
    system_prompt = "日本語でお願いします",
}

vim.api.nvim_set_keymap("n", "<leader>cc", "<cmd>lua require('CopilotChat').open()<CR>",
    { noremap = true, silent = true })
