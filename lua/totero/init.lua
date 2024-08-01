-- init.lua


-- <Flags>
local PLUG = true
local MINI_NVIM = true
local LAZY_NVIM = false
-- </Flags>


-- <VimOption
vim.o.termguicolors = true
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.softtabstop = 2
vim.o.laststatus = 3
vim.o.splitkeep = "screen"
-- </VimOptions>

-- <VimCommands>
local clr_schm = 'koehler'
vim.cmd('colorscheme ' .. clr_schm)
-- </VimCommands>


-- <Plug>
if PLUG then
	local Plug = vim.fn['plug#']
	vim.call('plug#begin')
		Plug('junegunn/fzf', { ['dir'] = '~/.fzf' })
		Plug('junegunn/fzf', { ['dir'] = '~/.fzf', ['do'] = './install --all' })
		Plug('tanvirtin/monokai.nvim')
	vim.call('plug#end')
end
-- </Plug>




-- <MiniNvim>
if MINI_NVIM then
	local path_package = vim.fn.stdpath('data') .. '/site/'
	local mini_path = path_package .. 'pack/deps/start/mini.nvim'
	if not vim.loop.fs_stat(mini_path) then
	  vim.cmd('echo "Installing `mini.nvim`" | redraw')
	  local clone_cmd = { 'git', 'clone', '--filter=blob:none', 'https://github.com/echasnovski/mini.nvim', mini_path }
	  vim.fn.system(clone_cmd)
	  vim.cmd('packadd mini.nvim | helptags ALL')
	  vim.cmd('echo "Installed `mini.nvim`" | redraw')
	end

	--   <DependencyManager>
	require('mini.deps').setup({ path = { package = path_package } })
	local add, now, later = MiniDeps.add, MiniDeps.now, MiniDeps.later
	--   </DependencyManager>

	--   <MiniPlugins>
	now(function() require('mini.basics').setup() end)
	now(function() require('mini.completion').setup() end)
	now(function() require('mini.fuzzy').setup() end)
	now(function() require('mini.git').setup() end)
	now(function() require('mini.map').setup() end)
	now(function()
	  require('mini.notify').setup()
	  vim.notify = require('mini.notify').make_notify()
	end)
	now(function() require('mini.sessions').setup() end)
	now(function() require('mini.splitjoin').setup() end)
	now(function() require('mini.starter').setup() end)
	now(function() require('mini.statusline').setup() end)
	now(function() require('mini.surround').setup() end)
	now(function() require('mini.tabline').setup() end)
	now(function() require('mini.trailspace').setup() end)
	now(function() require('mini.visits').setup() end)

	later(function() require('mini.ai').setup() end)
	later(function() require('mini.align').setup() end)
	later(function() require('mini.animate').setup() end)
	later(function() require('mini.bufremove').setup() end)
	later(function() require('mini.comment').setup() end)
	later(function() require('mini.diff').setup() end)
	later(function() require('mini.doc').setup() end)
	later(function() require('mini.extra').setup() end)
	later(function() require('mini.git').setup() end)
	later(function() require('mini.hipatterns').setup() end)
	later(function() require('mini.indentscope').setup() end)
	later(function() require('mini.misc').setup() end)
	later(function() require('mini.pairs').setup() end)
	later(function() require('mini.pick').setup() end)
	later(function() require('mini.surround').setup() end)
	--   </MiniPlugins>

	--   <ExternalPlugins>

	now(function()
		add({
			source = 's1n7ax/nvim-window-picker',
		})
		require('window-picker').setup()
	end)

	now(function()
	  add('williamboman/mason.nvim')
		require('mason').setup()
	end)

	now(function()
	  add({ source = 'neovim/nvim-lspconfig', depends = { 'williamboman/mason.nvim' } })
	end)

	now(function()
		add('nvim-lua/plenary.nvim')
	end)

	now(function()
	add('stevearc/resession.nvim')
	end)

	now(function()
		add({
			source ='nvim-telescope/telescope.nvim',
			depends = { 'nvim-lua/plenary.nvim' }
		})
		require('telescope').setup({
			extensions = {
				project = {
					theme = 'dropdown'
				}
			}
		})
	end)


	later(function()
	  add({
	    source = 'nvim-treesitter/nvim-treesitter',
	    -- Use 'master' while monitoring updates in 'main'
	    checkout = 'master',
	    monitor = 'main',
	    -- Perform action after every checkout
	    hooks = { post_checkout = function() vim.cmd('TSUpdate') end },
	  })
	  require('nvim-treesitter.configs').setup({
	    ensure_installed = { 'lua', 'vimdoc', 'markdown', 'markdown_inline' },
	    highlight = { enable = true },
	  })
	end)

	later(function()
		add({
			source = 'nvim-lualine/lualine.nvim'
		})
	end)

	later(function()
		add({
			source = 'folke/trouble.nvim',
		})
		require('trouble').setup({
			cmd = 'Trouble'
		})
	end)
--   </ExternalPlugins>
-- </MiniNvim>
end

-- <Depricated>
--  <LazyVim>
--require("config.lazy")
--  </LazyVim>
-- </Depricated>
