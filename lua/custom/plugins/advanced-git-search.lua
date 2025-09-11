return {
  'aaronhallaert/advanced-git-search.nvim',
  cmd = { 'AdvancedGitSearch' },
  config = function()
    ---@type advanced_git_search.Config
    local config = {
      browse_command = 'GBrowse',
      git_flags = { '-c', 'delta.side-by-side=false' },
      git_diff_flags = {},
      show_builtin_git_pickers = true,
      diff_plugin = 'diffview',
      entry_default_author_or_date = 'author',
    }

    ---@type "fzf" | "telescope" | "snacks"
    local ags_type = 'telescope'

    if ags_type == 'fzf' then
      require('advanced_git_search.fzf').setup(config)
    elseif ags_type == 'snacks' then
      require('advanced_git_search.snacks').setup(config)
    else
      require('telescope').setup {
        extensions = {
          advanced_git_search = config,
        },
      }
      require('telescope').load_extension 'advanced_git_search'
    end
  end,
  dependencies = {
    'tpope/vim-fugitive',
    'tommcdo/vim-fubitive',
    'nvim-telescope/telescope.nvim',
    'sindrets/diffview.nvim',
  },
}
