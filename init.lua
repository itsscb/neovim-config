-- This file simply bootstraps the installation of Lazy.nvim and then calls other files for execution
-- This file doesn't necessarily need to be touched, BE CAUTIOUS editing this file and proceed at your own risk.
local lazypath = vim.env.LAZY or vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not (vim.env.LAZY or (vim.uv or vim.loop).fs_stat(lazypath)) then
  -- stylua: ignore
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
end
vim.opt.rtp:prepend(lazypath)

-- validate that lazy is available
if not pcall(require, "lazy") then
  -- stylua: ignore
  vim.api.nvim_echo({ { ("Unable to load lazy from: %s\n"):format(lazypath), "ErrorMsg" }, { "Press any key to exit...", "MoreMsg" } }, true, {})
  vim.fn.getchar()
  vim.cmd.quit()
end

require "lazy_setup"
require "polish"

vim.cmd.colorscheme 'melange'

require('leap').create_default_mappings()

local opts = { noremap = true }
local keymap = vim.api.nvim_set_keymap
keymap("n", "<C-e>", "<cmd>Neotree toggle<cr>", opts)
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-k>", "<C-w>k", opts) 
keymap("n", "<C-j>", "<C-w>j", opts) 
keymap("n", "<C-l>", "<C-w>l", opts) 
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<c-down>", ":resize +2<cr>", opts)
keymap("n", "<c-right>", ":vertical resize -2<cr>", opts)
keymap("n", "<c-left>", ":vertical resize +2<cr>", opts)
keymap("n", "<tab>", ":bnext<cr>", opts)  
keymap("n", "<s-tab>", ":bprevious<cr>", opts) 
keymap("n", "<leader>h", ":nohlsearch<cr>", opts) 
keymap("n", "<a-j>", "<esc>:m .+1<cr>==gi<esc>", opts)  
keymap("n", "<a-k>", "<esc>:m .-2<cr>==gi<esc>", opts) 
keymap("i", "jk", "<esc>", opts)
keymap("i", "kj", "<esc>", opts)
keymap("v", "<", "<gv", opts) 
keymap("v", ">", ">gv", opts) 
keymap("v", "<a-j>", ":m .+1<cr>==", opts)
keymap("v", "<a-k>", ":m .-2<cr>==", opts)
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)
