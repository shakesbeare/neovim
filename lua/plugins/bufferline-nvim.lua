return {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons',
    opts = {
        options = {
            offsets = {
                {
                    filetype = "NvimTree",
                    text = "Project Files",
                    highlight = "Directory",
                    separator = true,
                },
                {
                    filetype = "neominimap",
                    separator = true,
                }
            }
        }
    },
}
