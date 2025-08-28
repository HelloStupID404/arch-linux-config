-- Perfection Is A Trap.
-- Simple Config For Linux.
------------
-- options
------------
vim.opt.number = true
vim.opt.relativenumber = false
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "html", "css", "json", "xml",
    "javascript", "typescript", "markdown", "lua" },
  callback = function()
    vim.bo.shiftwidth = 2
    vim.bo.tabstop = 2
  end,
})
vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.textwidth = 80
vim.opt.cursorline = true
vim.opt.clipboard = 'unnamedplus'
vim.o.mouse = "a"
vim.o.mousemodel = "extend"
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.termguicolors = true
vim.opt.signcolumn = "yes"
vim.o.fillchars = "vert:┃"
vim.cmd('cd %:p:h')
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.o.shell= "bash"
vim.api.nvim_create_autocmd("TermOpen", {
  callback = function()
    local buf = vim.api.nvim_get_current_buf()
    vim.api.nvim_buf_set_name(buf, "Term-"..buf..".exe")
  end,
})
vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = function()
    vim.api.nvim_set_hl(0, "Comment", { bold = true })
    vim.api.nvim_set_hl(0, "NvimTreeNormal", { link = "Normal" })
    vim.api.nvim_set_hl(0, "NvimTreeNormalNC", { link = "Normal" })
    vim.api.nvim_set_hl(0, "NormalFloat", { link = "Normal" })
    vim.api.nvim_set_hl(0, "FloatBorder", { link = "Normal" })
  end,
})
vim.cmd('colorscheme nightfox')
------------
-- keymaps
------------
local keymap = vim.keymap
vim.g.mapleader = " "
keymap.set("n", "<leader>in", ":e $MYVIMRC<CR>", { noremap = true, silent = true })
keymap.set("n", "<leader>rs", ":source $MYVIMRC<CR>", { noremap = true, silent = true })
keymap.set("n", "<leader>af", ":NvimTreeOpen $HOME<CR>", { noremap = true, silent = true })
keymap.set("n", "<C-q>", ":q!<CR>", { noremap = true, silent = true })
keymap.set({"n", "i", "v", "s", "x", "o", "c"}, "fj", "<ESC>")
keymap.set({'n', 'i', 'v'}, '<C-;>', '<End>')
keymap.set({'n', 'i', 'v'}, '<C-\'>', '<Home>')
keymap.set('n', '<leader>w', ':w<CR>')
keymap.set('n', '<leader>cp', ':<C-r>+')
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")
keymap.set('t', 'fj', '<C-\\><C-n>')
keymap.set('i', '<C-BS>', '<ESC>dbi')
keymap.set("n", "<leader>sv", "<C-w>v")
keymap.set("n", "<leader>sh", "<C-w>s")
-- bufferline
keymap.set("n", "<leader>bn", ":bn<CR>")
keymap.set("n", "<leader>bp", ":bp<CR>")
keymap.set("n", "<leader>bd", ":bd<CR>")
keymap.set("n", "<leader>bb", ":b#<CR>")  -- Alt+Tab
keymap.set("n", "<leader>b;", ":bufdo bd<CR>")
-- nvim-tree
keymap.set("n", "<leader>nt", ":NvimTreeToggle<CR>", { noremap = true, silent = true })
keymap.set("n", "<leader>cd", ":NvimTreeOpen %:p:h<CR>", { noremap = true, silent = true })
keymap.set("n", "<leader>af", ":NvimTreeOpen D:/A8File/AUTO<CR>", { noremap = true, silent = true })
-- -- lspconfig
-- keymap.set("n", "<leader>gd", ":lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true })
-- keymap.set("n", "<leader>gD", ":lua vim.lsp.buf.declaration()<CR>", { noremap = true, silent = true })
-- keymap.set("n", "<leader>gr", ":lua vim.lsp.buf.references()<CR>", { noremap = true, silent = true })
-- keymap.set("n", "<leader>rn", ":lua vim.lsp.buf.rename()<CR>", { noremap = true, silent = true })
-- keymap.set("n", "<leader>do", ":lua vim.diagnostic.open_float()<CR>", { noremap = true, silent = true })
-- clang
keymap.set("n", "<leader>cl", ":!cmd /k clang -g -O0 -o %<.exe %<CR>")
keymap.set("n", "<leader>ex", ":terminal chcp 65001 & cls & echo -------------------& echo Welcome To C Space!&echo -------------------& %<.exe<CR>", { noremap = true, silent = true })
-- java
keymap.set("n", "<leader>ja", ":terminal echo ----------------------&echo Welcome To Java Space!&echo ----------------------& java %<CR>", { noremap = true, silent = true })
-- python
keymap.set("n", "<leader>py", ":terminal echo ------------------------&echo Welcome To Python Space!&echo ------------------------& python %<CR>", { noremap = true, silent = true })
local themes = { "nightfox", "dawnfox", "tokyonight-moon","tokyonight-night" }
local index = 1
local function toggle_theme()
  index = index % 4 + 1
  vim.cmd.colorscheme(themes[index])
end
vim.keymap.set("n", "<leader>th", toggle_theme, { noremap = true, silent = true })
------------
-- plugins
------------
-- lualine
function time()
  return " ".. os.date("%H:%M")
end
vim.loop.new_timer():start(0, 60000, vim.schedule_wrap(function()
  battery = "" end))
require('lualine').setup{
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'location'},
    lualine_c = {
        { 'filename', path = 2 },
        'branch', 'diagnostics'
    },
    lualine_x = {'encoding'},
    lualine_y = {'progress'},
    lualine_z = {time}
  },
}
----------------
-- tree-sitter
require('nvim-treesitter.configs').setup{
  ensure_installed = { "c", "cpp", "java", "python", "c_sharp",
    "typescript", "javascript", "html", "css", "json", "xml",
    "go", "rust", "markdown", "lua", "vim", "yaml",
    "ruby", "bash", "haskell", "sql"
  },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}
--------------
-- nvim-tree
require('nvim-tree').setup{
  view = {
    width = 30,
  },
  filters = {
    dotfiles = false,
    custom = { "desktop.ini" },
  },
  renderer = {
    root_folder_label = function(name)
      return "========= Explorer ========="
    end,
    indent_markers = {
      enable = true,
    },
  },
}
---------------
-- bufferline
require("bufferline").setup{
  highlights = {
    buffer_selected = {
      italic = false,
    },
  },
  options = {
    separator_style = "slant",  -- slant, slope
    show_buffer_close_icons = true,
    buffer_close_icon = "",
  },
}
------------
-- comment
require('Comment').setup({
  toggler = {  -- Normal Mode
    line = 'gcc',
    block = 'gbc',
  },
  opleader = {  -- Visual Mode
    line = 'gc',
    block = 'gb',
  },
})
--------------
-- autopairs
local npairs_ok, npairs = pcall(require, "nvim-autopairs")
if not npairs_ok then
  return
end
npairs.setup({
  check_ts = true,
  enable_moveright = true,
})
local Rule = require("nvim-autopairs.rule")
npairs.add_rules({
  Rule("<", ">", { "html", "xml", "markdown" }),
})
--------------
-- indent-bl
local highlight = {
    "RainbowRed",
    "RainbowYellow",
    "RainbowBlue",
    "RainbowOrange",
    "RainbowGreen",
    "RainbowViolet",
    "RainbowCyan",
}
local hooks = require "ibl.hooks"
hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
    vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
    vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
    vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
    vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
    vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
    vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
    vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
end)
vim.g.rainbow_delimiters = { highlight = highlight }
require("ibl").setup { scope = { highlight = highlight } }
hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
--------------
-- colorizer
require 'colorizer'.setup()
--------
-- END
