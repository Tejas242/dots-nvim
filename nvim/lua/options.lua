require "nvchad.options"

-- add yours here!
-- vim.opt.background = "dark" -- set this to dark or light
-- vim.cmd("colorscheme oxocarbon")
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
local o = vim.o
o.cursorlineopt ='both' -- to enable cursorline!
