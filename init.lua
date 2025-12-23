
-- Set Tab to 4 spaces
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true
vim.o.softtabstop = 2
vim.o.winborder = 'single'

vim.opt.number = true
vim.opt.relativenumber = true

-- Set command console to Powershell
if vim and vim.fn.has("win32") == 1 or vim.fn.has("win64") == 1 then
    if vim.fn.executable('pwsh') == 1 then
      vim.o.shell = 'pwsh'
    else
      vim.o.shell = 'powershell'
    end
end

-- In your init.lua
vim.keymap.set('n', '<leader>bd', ':bp|bd #<CR>', { desc = 'Delete buffer without closing window' })


vim.o.shellcmdflag = '-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;'
vim.o.shellquote = ''
vim.o.shellxquote = ''

-- Load Modules
require("config.lazy")




