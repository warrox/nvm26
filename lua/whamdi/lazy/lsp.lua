return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      -- capabilities pour nvim-cmp
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      local ok, cmp_lsp = pcall(require, "cmp_nvim_lsp")
      if ok then
        capabilities = cmp_lsp.default_capabilities(capabilities)
      end

      -- diagnostics UI
      vim.diagnostic.config({
        virtual_text = true,
        signs = true,
        underline = true,
        update_in_insert = false,
        severity_sort = true,
      })

      vim.api.nvim_create_autocmd("CursorHold", {
        callback = function()
          vim.diagnostic.open_float(nil, { focus = false })
        end,
      })

      -----------------------------------------------------------
      -- 🚀 Nouvelle API 0.11 (plus de lspconfig.setup)
      -----------------------------------------------------------

      vim.lsp.config.lua_ls = {
        capabilities = capabilities,
        settings = {
          Lua = {
            diagnostics = { globals = { "vim" } },
          },
        },
      }

      vim.lsp.config.ts_ls = {
        capabilities = capabilities,
      }

      vim.lsp.config.pyright = {
        capabilities = capabilities,
      }

      -- démarre les serveurs automatiquement
      vim.lsp.enable("lua_ls")
      vim.lsp.enable("ts_ls")
      vim.lsp.enable("pyright")
    end,
  },
}
