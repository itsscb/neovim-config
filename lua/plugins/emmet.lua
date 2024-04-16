return {
  {
    'mattn/emmet-vim',
      setup = function ()
        -- Emmet plugin configuration
        vim.g.user_emmet_leader_key = ','  -- Change leader key (optional)

        -- Key mappings for triggering Emmet actions
        vim.api.nvim_set_keymap('i', '<C-y>,', '<C-y>,', { silent = true, noremap = true })
        vim.api.nvim_set_keymap('i', '<C-y>l', '<C-y>l', { silent = true, noremap = true })

        print('Emmet plugin loaded successfully!')
      end
  }
}
