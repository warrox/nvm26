return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },

  config = function()
    require('lualine').setup({
        theme = 'gruvbox',
        options = {
          icons_enabled = false,
          component_separators = '',
          section_separators = '',
        },
        sections = {
          lualine_a = { 'mode' },
          lualine_b = { 'branch', 'diff' },
          lualine_c = { { 'filename', path = 1 } },
          lualine_x = { 'diagnostics' },
          lualine_y = { 'filetype', 'lsp_status' },
          lualine_z = { 'location' }
        },
     })

  end
}
