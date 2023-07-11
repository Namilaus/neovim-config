local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use  'folke/flash.nvim'
  use 'nvim-tree/nvim-tree.lua'
  use 'nvim-tree/nvim-web-devicons'
  use {
  'nvim-lualine/lualine.nvim',
  requires = { 'nvim-tree/nvim-web-devicons', opt = true }
}
  use {
	 'svrana/neosolarized.nvim',
          requires = { 'tjdevries/colorbuddy.nvim' }
  }
  use 'nvim-treesitter/nvim-treesitter'
  use {
  'nvim-telescope/telescope.nvim', tag = '0.1.1',
  requires = { {'nvim-lua/plenary.nvim'} }
}
  use {
	"williamboman/mason.nvim",
  	"neovim/nvim-lspconfig",
  	"williamboman/mason-lspconfig.nvim"
}
   use {
	"windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
}

  use {
  'hrsh7th/nvim-cmp',
  'hrsh7th/cmp-nvim-lsp',
  'L3MON4D3/LuaSnip'
  }
  use {
   "akinsho/toggleterm.nvim", tag = '*', config = function ()
   require("toggleterm").setup ({
  	size = 7,
  	open_mapping = [[<c-\>]],
  	shade_filetypes = {},
  	shade_terminals = true,
  	shading_factor = '1',
  	start_in_insert = true,
  	persist_size = true,
  	direction = 'horizontal'
})
   end}

  -- My plugins here
  -- use 'foo1/bar1.nvim'
  -- use 'foo2/bar2.nvim'

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
