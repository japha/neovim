function SetColor(color)
	color = color or "angr"
	vim.cmd.AirlineTheme(color)
    vim.cmd { cmd = "highlight", args = { "clear", "SignColumn" } }
	
	vim.api.nvim_set_hl(0, "Normal", { bg = "#0a0a0a" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#0a0a0a"})

    vim.cmd("set background=dark")
    vim.cmd.colorscheme("angr")
end

SetColor("angr")
