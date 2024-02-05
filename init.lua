require "core"

local custom_init_path = vim.api.nvim_get_runtime_file("lua/custom/init.lua", false)[1]

if custom_init_path then
  dofile(custom_init_path)
end

require("core.utils").load_mappings()

local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

-- bootstrap lazy.nvim!
if not vim.loop.fs_stat(lazypath) then
  require("core.bootstrap").gen_chadrc_template()
  require("core.bootstrap").lazy(lazypath)
end

dofile(vim.g.base46_cache .. "defaults")
vim.opt.rtp:prepend(lazypath)
require "plugins"



-- MY OWN ONFIG MICHAL
-- Normal mode mappings
-- rename
vim.api.nvim_set_keymap('n', '<leader>r', ':lua require("nvchad.renamer").open()<CR>', { noremap = true, silent = true })
-- go to implementation
vim.api.nvim_set_keymap('n', '<leader>gi', ':lua vim.lsp.buf.implementation()<CR>', { noremap = true, silent = true })

--signature hignt
vim.api.nvim_set_keymap('n', '<leader>s', ':lua vim.lsp.buf.signature_help()<CR>', { noremap = true, silent = true })

--go to next error
vim.api.nvim_set_keymap('n', '<leader>,', ':lua vim.diagnostic.goto_next()<CR>', { noremap = true, silent = true })
-- toggle horizontal temirnal
vim.api.nvim_set_keymap('n', '<leader>tt', ':lua require("nvterm.terminal").toggle "horizontal"<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>h', ':lua vim.lsp.buf.hover()<CR>', { noremap = true, silent = true })
--move lines
vim.api.nvim_set_keymap('n', '<S-Up>', ':m-2<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<S-Down>', ':m+<CR>', { noremap = true, silent = true })
-- Insert mode mappings
vim.api.nvim_set_keymap('i', '<S-Up>', '<Esc>:m-2<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<S-Down>', '<Esc>:m+<CR>', { noremap = true, silent = true })

