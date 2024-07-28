function SetColor()
    vim.cmd.colorscheme("hybrid")
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" }) 
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

SetColor()
