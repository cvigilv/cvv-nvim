local execute = vim.cmd

-- Default options
vim.o.termguicolors = true

-- Overrides autocommand
execute [[
	augroup colors_override
		" QuickScope
		autocmd ColorScheme * highlight link QuickScopePrimary IncSearch
		autocmd ColorScheme * highlight link QuickScopeSecondary Search
    augroup END
	]]

-- Load colorscheme
execute "colorscheme tokyonight"
