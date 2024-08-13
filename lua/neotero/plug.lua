local Plug = vim.fn['plug#']
	vim.call('plug#begin')
		Plug('junegunn/fzf', { ['dir'] = '~/.fzf' })
		Plug('junegunn/fzf', { ['dir'] = '~/.fzf', ['do'] = './install --all' })
		Plug('tanvirtin/monokai.nvim')
	vim.call('plug#end')
