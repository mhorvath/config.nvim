return {
  'mfussenegger/nvim-dap',
  dependencies = {
    'nvim-neotest/nvim-nio',
    'theHamsta/nvim-dap-virtual-text',
    'rcarriga/nvim-dap-ui',
    'leoluz/nvim-dap-go',
  },
  config = function()
    local dap = require 'dap'
    local dapui = require 'dapui'
    local dap_go = require 'dap-go'

    -- Configure delve as the Go debugger
    dap_go.setup()

    -- Configure DAP UI
    dapui.setup()

    -- Set up DAP UI event listeners
    dap.listeners.after.event_initialized['dapui_config'] = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated['dapui_config'] = function()
      dapui.close()
    end
    dap.listeners.before.event_exited['dapui_config'] = function()
      dapui.close()
    end

    -- Key mappings for DAP
    vim.api.nvim_set_keymap('n', '<F5>', '<Cmd>lua require"dap".continue()<CR>', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<F10>', '<Cmd>lua require"dap".step_over()<CR>', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<F11>', '<Cmd>lua require"dap".step_into()<CR>', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<F12>', '<Cmd>lua require"dap".step_out()<CR>', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<Leader>cdb', '<Cmd>lua require"dap".toggle_breakpoint()<CR>', { noremap = true, silent = true })
    vim.api.nvim_set_keymap(
      'n',
      '<Leader>cdB',
      '<Cmd>lua require"dap".set_breakpoint(vim.fn.input("Breakpoint condition: "))<CR>',
      { noremap = true, silent = true }
    )
    vim.api.nvim_set_keymap(
      'n',
      '<Leader>cdlp',
      '<Cmd>lua require"dap".set_breakpoint(nil, nil, vim.fn.input("Log point message: "))<CR>',
      { noremap = true, silent = true }
    )
    vim.api.nvim_set_keymap('n', '<Leader>cddr', '<Cmd>lua require"dap".repl.open()<CR>', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<Leader>cddl', '<Cmd>lua require"dap".run_last()<CR>', { noremap = true, silent = true })
  end,
}
