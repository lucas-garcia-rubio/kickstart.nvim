return {
  'waiting-for-dev/ergoterm.nvim',
  config = function()
    require('ergoterm').setup()

    local map = vim.keymap.set
    local opts = { noremap = true, silent = true }

    -- Terminal creation with different layouts
    map('n', '<leader>cs', ':TermNew layout=below<CR>', opts) -- Split below
    -- map('n', '<leader>cv', ':TermNew layout=right<CR>', opts) -- Vertical split
    -- map('n', '<leader>cf', ':TermNew layout=float<CR>', opts) -- Floating window
    -- map('n', '<leader>ct', ':TermNew layout=tab<CR>', opts) -- New tab

    -- Open terminal picker
    map('n', '<leader>cl', ':TermSelect<CR>', opts) -- List and select terminals

    -- Send text to last focused terminal
    -- map('n', '<leader>cs', ':TermSend! new_line=false<CR>', opts) -- Send line without newline
    -- map('x', '<leader>cs', ':TermSend! new_line=false<CR>', opts) -- Send selection without newline
    --
    -- -- Send and show output without focusing terminal
    -- map('n', '<leader>cx', ':TermSend! action=visible<CR>', opts) -- Execute in terminal, keep focus
    -- map('x', '<leader>cx', ':TermSend! action=visible<CR>', opts) -- Execute selection in terminal, keep focus
    --
    -- -- Send as markdown code block
    -- map('n', '<leader>cS', ':TermSend! action=visible trim=false decorator=markdown_code<CR>', opts)
    -- map('x', '<leader>cS', ':TermSend! action=visible trim=false decorator=markdown_code<CR>', opts)
  end,
}
