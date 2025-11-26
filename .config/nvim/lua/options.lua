require "nvchad.options"

-- add yours here!
local o = vim.o

o.tabstop = 4
o.shiftwidth = 4
o.expandtab = true
o.autoindent = true
o.smartindent = true
o.wrap = true
o.linebreak = true
o.textwidth = 80
o.cursorlineopt = "number"

-- vim.cmd('cd %:p:h')
vim.cmd [[
  hi DiagnosticUnderlineInfo  guisp=#5fb3ff gui=undercurl
  hi DiagnosticUnderlineError guisp=#ff5f5f gui=undercurl
  hi DiagnosticUnderlineWarn  guisp=#ffaa00 gui=undercurl
  hi DiagnosticUnderlineHint  guisp=#2CB13B gui=undercurl
]]
