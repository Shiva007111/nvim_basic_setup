return  {
  'nvim-telescope/telescope.nvim', tag = '0.1.8',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local builtin = require("telescope.builtin")
    vim.keymap.set('n', '<C-p>', builtin.find_files, {})
    vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
    vim.keymap.set('n', '<leader>/', builtin.current_buffer_fuzzy_find, { desc = '[/] Fuzzy search in current file' })
--    vim.keymap.set("n", "<leader><tab>", "<cmd>Telescope buffers<cr>", { desc = "Switch Buffers" })
    vim.keymap.set("n", "<leader><tab>", function()
      require("telescope.builtin").buffers({ initial_mode = "normal" })
    end, { desc = "Switch Buffers (Normal Mode)" })


  end
  }

