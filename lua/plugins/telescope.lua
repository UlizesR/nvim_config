return {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim', 'jonarrien/telescope-cmdline.nvim' },
    config = function()
        local tele = require('telescope')
        tele.setup({
            extensions = {
                ["ui-select"] = {
                    require("telescope.themes").get_dropdown{}
                },
                cmdline = {
                    picker = {
                        layout_config = {width  = 120, height = 25,}
                    },
                    mappings = {
                        complete = '<Tab>',
                        run_selection = '<C-CR>',
                        run_input = '<CR>',
                    },
                },
            }
        })
        require('telescope').load_extension("ui-select")
        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
        vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
        vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
        vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
        vim.keymap.set('n', ':', ':Telescope cmdline<CR>', { noremap = true, desc = "Cmdline" })
    end,
}
