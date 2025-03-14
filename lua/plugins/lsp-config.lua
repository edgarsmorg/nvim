return{
  {
  "williamboman/mason.nvim",
  config = function()
    require("mason").setup()
  end
  },
  {
   "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "sorbet", "ruby_lsp", "rubocop"}
      })
  end
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
      lspconfig.lua_ls.setup({})
      lspconfig.sorbet.setup({})
      lspconfig.ruby_lsp.setup({
        mason = false
        cmd = {vim.fn.expand("")}
      })
      lspconfig.rubocop.setup({})

      vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
      vim.keymap.set({'n', 'v'}, '<leader>ca', vim.lsp.buf.code_action, {})  
    end
  }
}
