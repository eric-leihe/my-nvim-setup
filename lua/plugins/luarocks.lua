-- Config luarocks vis lazy.nvim
return {
  "vhyrro/luarocks.nvim",
  priority = 1000, -- Very high priority is required, luarocks.nvim should run as the first plugin in your config.
  config = true,

  -- Specific version of rocks to install
  -- opts = {
  --    rocks = { "fzy", "pathlib.nvim ~> 1.0" }, -- specifies a list of rocks to install
  -- },
}


