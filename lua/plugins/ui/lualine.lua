return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  dependencies = {
    "AndreM222/copilot-lualine",
  },
  otps = {
    options = {
      icons_enabled = true,
      theme = "auto",
      component_separators = { left = "", right = "" },
      section_separators = { left = "", right = "" },
    },
    sections = {
      lualine_a = { { "mode", separator = { left = "" } }, 'swenv' },
      lualine_b = { "filename", "branch" },
      lualine_c = {
        "diagnostics",
      },
      lualine_x = {
        "copilot",
        "filetype",
        { 'swenv', icon = '<icon>' }
      },
      lualine_y = { "progress" },
      lualine_z = {
        { "location", separator = { right = "" }, left_padding = 2 },
      },
    },
    inactive_sections = {
      lualine_a = { "filename" },
      lualine_b = {},
      lualine_c = {},
      lualine_x = {},
      lualine_y = {},
      lualine_z = { "location" },
    },
    tabline = {},
    extensions = { "quickfix", "man", "fugitive" },
  },
  config = function()
    require('lualine').setup {
      options = {
        theme = "auto",
        component_separators = '',
        section_separators = { left = '', right = '' },
      },
      sections = {
        lualine_a = { { "mode", separator = { left = "" } }, 'swenv' },
        lualine_b = { "filename", "branch" },
        lualine_c = {
          "diagnostics",
        },
        lualine_x = {
          "copilot",
          "filetype",
          { 'swenv', icon = '<icon>' }
        },
        lualine_y = { "progress" },
        lualine_z = {
          { "location", separator = { right = "" }, left_padding = 2 },
        },
      },
      inactive_sections = {
        lualine_a = { "filename" },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = { "location" },
      },
      tabline = {},
      extensions = { "quickfix", "man", "fugitive" },
    }
  end,
}
