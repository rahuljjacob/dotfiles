local colors = {
            darkwhite = "#16161d",
            white = "#ffffff",
            innerbg = nil,
            outerbg = "#141B1E",
            normal = "#8CCF7E",
            insert = "#E182E0",
            visual = "#6CBFBF",
            replace = "#ffa066",
            command = "#E57474",
}

local bubbles_theme = {
            inactive = {
                a = { fg = colors.white, bg = colors.outerbg, gui = "bold" },
                b = { fg = colors.white, bg = colors.outerbg },
                c = { fg = colors.white, bg = colors.innerbg },
            },
            visual = {
                a = { fg = colors.darkwhite, bg = colors.visual, gui = "bold" },
                b = { fg = colors.white, bg = colors.outerbg },
                c = { fg = colors.white, bg = colors.innerbg },
            },
            replace = {
                a = { fg = colors.darkwhite, bg = colors.replace, gui = "bold" },
                b = { fg = colors.white, bg = colors.outerbg },
                c = { fg = colors.white, bg = colors.innerbg },
            },
            normal = {
                a = { fg = colors.darkwhite, bg = colors.normal, gui = "bold" },
                b = { fg = colors.white, bg = colors.outerbg },
                c = { fg = colors.white, bg = colors.innerbg },
            },
            insert = {
                a = { fg = colors.darkwhite, bg = colors.insert, gui = "bold" },
                b = { fg = colors.white, bg = colors.outerbg },
                c = { fg = colors.white, bg = colors.innerbg },
            },
            command = {
                a = { fg = colors.darkwhite, bg = colors.command, gui = "bold" },
                b = { fg = colors.white, bg = colors.outerbg },
                c = { fg = colors.white, bg = colors.innerbg },
            },
}

require('lualine').setup {
  options = {
    theme = bubbles_theme,
    component_separators = '|',
    section_separators = { left = '', right = '' },
  },
  sections = {
    lualine_a = {
      { 'mode', separator = { left = '' }, right_padding = 2 },
    },
    lualine_b = { 'filename', 'branch' },
    lualine_c = {},
    lualine_x = {},
    lualine_y = {'fileformat', 'filetype'},
    lualine_z = {
      { 'location', separator = { right = '' }, left_padding = 2 },
    },
  },
  inactive_sections = {
    lualine_a = { 'filename' },
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = { 'location' },
  },
  tabline = {},
  extensions = {},
}


