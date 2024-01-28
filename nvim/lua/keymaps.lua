local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.keymap.set
local autocmd = vim.api.nvim_create_autocmd

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

--Explore Files
keymap("n", "<leader>e", ":Explore", opts)

-- Move text up and down
keymap("n", "<A-j>", ":m .+1<CR>==", opts)
keymap("n", "<A-k>", ":m .-2<CR>==", opts)

--Explore Files 
keymap("n", "<Leader>e", ":Explore<CR>", opts)
-- Insert --
-- Press jk fast to exit insert mode 
keymap("i", "jk", "<ESC>", opts)
keymap("i", "kj", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv^", opts)
keymap("v", ">", ">gv^", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m '>+1<CR>gv=gv", opts)
keymap("v", "<A-k>", ":m '<-2<CR>gv=gv", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":m '>+1<CR>gv=gv", opts)
keymap("x", "K", ":m '<-2<CR>gv=gv", opts)
keymap("x", "<A-j>", ":m '>+1<CR>gv=gv", opts)
keymap("x", "<A-k>", ":m '<-2<CR>gv=gv", opts)

-- Terminal --
-- Better terminal navigation
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

--keymap({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
--
---- Remap for dealing with word wrap
--keymap('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
--keymap('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
--
---- Diagnostic keymaps
--keymap('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
--keymap('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
--keymap('n', '<leader>j', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
--keymap('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

--Transparency
keymap('n', '<leader>t',":TransparentToggle<CR>" ,opts)


-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

-- autocompile
autocmd("FileType", { pattern = "python",
	callback = function()
		vim.api.nvim_buf_set_keymap(0,"n","<C-c>",":vsplit<CR>:te python3 '%'<CR>i",opts)
	end})
autocmd("FileType", { pattern = "cpp",
	callback = function()
		vim.api.nvim_buf_set_keymap(0,"n","<C-c>",":split<CR>:te g++ -std=c++14 -Wshadow -Wall -o %:t:r % -g -fsanitize=address -fsanitize=undefined -D_GLIBCXX_DEBUG && ./%:t:r<CR>i",opts)
	end})
autocmd("FileType", { pattern = "c",
	callback = function()
		vim.api.nvim_buf_set_keymap(0,"n","<C-c>",":vsplit<CR>:te g++ -Wshadow -Wall % -g -fsanitize=address -fsanitize=undefined -D_GLIBCXX_DEBUG && ./a.out<CR>i",opts)
	end})
