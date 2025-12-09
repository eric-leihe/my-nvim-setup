return     -- in your lazy.nvim spec or similar
    {
      "stevearc/conform.nvim",
      opts = {}, -- You'll fill this in
      config = function()
        require("conform").setup({
          formatters_by_ft = {
            javascript = { "prettier" }
          }
        })
      end
    }
