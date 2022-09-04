vim.g.db_ui_use_nerd_fonts = 1
vim.g.db_ui_show_database_icon = 1
vim.g.db_ui_force_echo_notifications = 0


vim.g.db_ui_icons = {
    expanded = {
        db = '▾ ',
        buffers = '▾ ',
        saved_queries = '▾ ',
        schemas = '▾ ',
        schema = '▾ פּ',
        tables = '▾ 藺',
        table = '▾ ',
    },
    collapsed = {
        db = '▸ ',
        buffers = '▸ ',
        saved_queries = '▸ ',
        schemas = '▸ ',
        schema = '▸ פּ',
        tables = '▸ 藺',
        table = '▸ ',
    },
    saved_query = '',
    new_query = '璘',
    tables = '離',
    buffers = '﬘',
    add_connection = '',
    connection_ok = '✓',
    connection_error = '✕',
}

vim.keymap.set('n', '<leader>db', ':tab DBUI<CR>', {})
vim.keymap.set('n', ',tn', ':tabnext<CR>', {})
vim.keymap.set('n', ',tp', ':tabprevious<CR>', {})
