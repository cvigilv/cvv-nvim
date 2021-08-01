local execute = vim.api.nvim_command
local fn = vim.fn

-- Ensure `packer.nvim` is installed on any machine
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
	fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
end

-- `packer.nvim` configuration
execute 'packadd packer.nvim'
require('packer').startup(
{
	function()
		use 'wbthomason/packer.nvim'

		-- Aesthetic
		use 'folke/tokyonight.nvim'
		
		-- Syntax
		use {
			'JuliaEditorSupport/julia-vim',
			ft = {'julia'}
		}
		use {
			'lervag/vimtex',
			ft = { 'tex' }
		}

		-- Tools
		use 'unblevable/quick-scope'

		-- LSP & Autocomplete
		use 'hrsh7th/nvim-compe'
		use {
			'neovim/nvim-lspconfig',
			ft = { 'julia' }
		}
		use {
			'nvim-treesitter/nvim-treesitter',
			ft = { 'julia', 'python' }
		}
	end,

	config = {
		max_jobs = 12,
	}
})

-- Installed packages configurations
require('plugin/nvim-compe')
require('plugin/nvim-treesitter')
