local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>pf', builtin.find_files, {})

-- Search in Git project
vim.keymap.set('n', '<C-p>', builtin.git_files, {})

--vim.keymap.set('n', '<leader>ps', function()
--	builtin.grep_string({ search = vim.fn.input("Grep > ") });
--
--end)

-- Current file search
vim.keymap.set('n', '<leader>f', builtin.current_buffer_fuzzy_find, {})

-- Current file selected search
vim.keymap.set('v', '<leader>f', function()
	text = vim.getVisualSelection()

	builtin.current_buffer_fuzzy_find({ default_text = text });
end)


-- Working dir search
vim.keymap.set('n', '<leader>F', builtin.live_grep, {})

-- Working dir selected search
vim.keymap.set('v', '<leader>F', function()
	text = vim.getVisualSelection()

	builtin.grep_string({ search = text });
	
	-- live_grep does not work here	
	--builtin.live_grep({ search = text });
end)

function vim.getVisualSelection()
	vim.cmd('noau normal! "vy"')
	local text = vim.fn.getreg('v')
	vim.fn.setreg('v', {})

	text = string.gsub(text, "\n", "")
	if #text > 0 then
		return text
	else
		return ''
	end
end

