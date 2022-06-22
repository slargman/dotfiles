require('leap').set_default_keymaps()

function leap_bidirectional()
  require'leap'.leap { ['target-windows'] = { vim.api.nvim_get_current_win() } }
end

vim.keymap.set('n', 's', leap_bidirectional, { silent = true })
