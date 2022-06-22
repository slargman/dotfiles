require('slargman/telescope')
require('slargman/nvim-tree')
require('slargman/leap')
require('gitsigns').setup({
  signs = {
    add          = {hl = 'GitSignsAdd'   , text = '+', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'},
    change       = {hl = 'GitSignsChange', text = '~', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
    changedelete = {hl = 'GitSignsDelete', text = '~', numhl='GitSignsDeleterNr', linehl='GitSignsDeleterLn'},
  }
})
require('which-key').setup({})
