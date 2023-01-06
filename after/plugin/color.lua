function SetColor(color)
	color = color or "angr"
	vim.cmd.AirlineTheme(color)
    vim.cmd { cmd = "highlight", args = { "clear", "SignColumn" } }
    --vim.cmd.colorscheme("desert")
	
	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none"})
end

SetColor("angr")
