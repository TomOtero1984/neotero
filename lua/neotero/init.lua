-- init.lua


-- Flags
local PLUG = true
local MINI_NVIM = true
local LAZY_NVIM = false



-- VimOption
vim.o.termguicolors = true
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.softtabstop = 2
vim.o.laststatus = 3
vim.o.splitkeep = 'screen'


-- VimCommands
vim.cmd.colorscheme('koehler')

require('neotero.keymaps')


-- Plug
if PLUG then
	require('neotero.plug')
end





-- MiniNvim
if MINI_NVIM then
	require('neotero.mini')
end


--  LazyVim
if LAZY_NVIM then
  require('neotero.lazy')
end

