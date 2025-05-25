function SetColor(color)
	color = color or "angr"
	vim.cmd.AirlineTheme(color)
	vim.cmd { cmd = "highlight", args = { "clear", "SignColumn" } }

	vim.cmd.AirlineTheme("wombat")
	vim.api.nvim_set_hl(0, "Normal", { bg = "NONE", ctermbg = "NONE" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE", ctermbg = "NONE" })

	--vim.cmd("set background=NONE")
end

SetColor("angr")
