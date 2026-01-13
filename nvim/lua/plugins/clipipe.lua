if vim.g.dotfiles_is_wsl == true then
return {
	{
		'bkoropoff/clipipe',
		enabled = false,
		opts = {}
	}
}
end
