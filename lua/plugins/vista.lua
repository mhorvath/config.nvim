return {
  'liuchengxu/vista.vim',
  config = function()
    vim.g.vista_default_executive = 'nvim_lsp'
    vim.g.vista_close_on_jump = 1
    vim.g.vista_sidebar_width = 45
    vim.api.nvim_set_keymap('n', '<leader>v', ':Vista<CR>', {})
  end,
}
