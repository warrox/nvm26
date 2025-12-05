-- lua/plugins/bufferline.lua
return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = "nvim-tree/nvim-web-devicons",
  config = function()
    require("bufferline").setup({
      options = {
        diagnostics = "nvim_lsp",
        separator_style = "thin",
        show_buffer_close_icons = false,
        show_close_icon = false,
      },
    })

    -- Keymaps basiques
    vim.keymap.set("n", "<Tab>", "<Cmd>BufferLineCycleNext<CR>")
    vim.keymap.set("n", "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>")
  end,
}
