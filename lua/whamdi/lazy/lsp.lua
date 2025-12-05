return {
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    config = function()
      require("mason").setup()
    end,
  },

  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "ts_ls",
          "pyright",
        },
      })
    end,
  },

  {
    "neovim/nvim-lspconfig", -- encore requis mais plus pour config
    config = function()
      -- capabilities pour nvim-cmp
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      local cmp_ok, cmp_lsp = pcall(require, "cmp_nvim_lsp")
      if cmp_ok then
        capabilities = cmp_lsp.default_capabilities(capabilities)
      end

      local servers = { "lua_ls", "ts_ls", "pyright" }

      for _, server in ipairs(servers) do
        vim.lsp.config[server] = {
          capabilities = capabilities,
          settings = (server == "lua_ls") and {
            Lua = {
              diagnostics = { globals = { "vim" } },
            },
          } or nil,
        }

        -- lance automatiquement le client
        vim.lsp.start(vim.lsp.config[server])
      end
    end,
  },
}
