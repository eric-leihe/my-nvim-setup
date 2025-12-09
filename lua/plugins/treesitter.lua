-- nvim-treesitter can not be lazy load

return {
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  branch = 'main',
  build = ':TSUpdate',
  config = function ()
    local treesitter = require("nvim-treesitter")
    treesitter.setup({})
    treesitter.install({ 'javascript', 'java', 'typescript', 'json', 'lua', 'jsx' })
  end
}

