require("core.plugins")
require("core.plugin_config")

-- settings

vim.wo.number = true
vim.keymap.set("n", "<Tab>n", ":tabnew<CR>") -- opens a new empty tab
vim.keymap.set("n", "<c-s>", ":%s@") -- for search and replace like :%s@search@replace

--highlighting can be editten on /Users/$USERNAME/.local/share/nvim/site/pack/packer/start/nvim-treesitter/queries
vim.api.nvim_set_option("clipboard", "unnamed")

-- Keybinding for code actions c+a
vim.keymap.set("n", "ca", vim.lsp.buf.code_action, { noremap = true, silent = true })
