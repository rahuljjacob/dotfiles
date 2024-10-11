require('everblush').setup({

    -- Default options
    override = {},
    transparent_background = false,
    nvim_tree = {
        contrast = false,
    },

    -- Configuration examples

    -- Override the default highlights using Everblush or other colors
    override = {
        Normal = { fg = '#ffffff', bg = '#0C1214' },
    },
    -- Set transparent background
    transparent_background = true,

    -- Set contrast for nvim-tree highlights
    nvim_tree = {
        contrast = true,
    },
})

vim.cmd('colorscheme everblush')

