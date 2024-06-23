local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
	'folke/flash.nvim',
   	'nvim-tree/nvim-tree.lua',
   	'nvim-tree/nvim-web-devicons',
	{
	'nvim-lualine/lualine.nvim',
	dependencies = { 'nvim-tree/nvim-web-devicons'}},
	{	
	'svrana/neosolarized.nvim',
        dependencies = { 'tjdevries/colorbuddy.nvim' }},
   	'nvim-treesitter/nvim-treesitter',
	{
  	'nvim-telescope/telescope.nvim', tag = '0.1.8',
	dependencies = {'nvim-lua/plenary.nvim'}},
	{
	"williamboman/mason.nvim",
  	"neovim/nvim-lspconfig",
  	"williamboman/mason-lspconfig.nvim"},
	{
	"windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end},

	{
  	'hrsh7th/nvim-cmp',
  	'hrsh7th/cmp-nvim-lsp',
  	'L3MON4D3/LuaSnip'},
	{
	-- amongst your other plugins
	{'akinsho/toggleterm.nvim', version = "*", config = true},
  -- or
	{'akinsho/toggleterm.nvim', version = "*", opts = {
  		size = 7,
  		open_mapping = [[<c-\>]],
  		shade_filetypes = {},
  		shade_terminals = true,
  		shading_factor = '1',
  		start_in_insert = true,
  		persist_size = true,
  		direction = 'horizontal'}}}}
local opts = {}

require("lazy").setup(plugins, opts)
