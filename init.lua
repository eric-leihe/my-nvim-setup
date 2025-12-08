
-- Set Tab to 4 spaces
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.softtabstop = 4
vim.wo.number = true


-- Set command console to Powershell
if vim.fn.executable('pwsh') == 1 then
  vim.o.shell = 'pwsh'
else
  vim.o.shell = 'powershell'
end

vim.o.shellcmdflag = '-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;'
vim.o.shellquote = ''
vim.o.shellxquote = ''

-- Load Modules
require("config.lazy")




