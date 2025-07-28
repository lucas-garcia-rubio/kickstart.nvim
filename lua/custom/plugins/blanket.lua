return {
  'dsych/blanket.nvim',
  opts = {
    report_path = vim.fn.getcwd() .. '/target/site/jacoco/jacoco.xml',
    filetypes = 'java',
  },
  init = function()
    require('blanket').stop()
    local coverage = false
    local report_path = vim.fn.getcwd() .. '/target/site/jacoco/jacoco.xml'
    local report_index_html = vim.fn.getcwd() .. '/target/site/jacoco/index.html'

    local file_exists = function(path)
      local stat = vim.uv.fs_stat(path)
      return stat ~= nil
    end

    local toggle_coverage_report = function()
      if coverage == false then
        if file_exists(report_path) then
          require('blanket').start()
          coverage = true
        else
          vim.notify('jacoco.xml not found at: ' .. report_path .. '. Maybe you should run some tests :)', vim.log.levels.INFO)
        end
      else
        require('blanket').stop()
        coverage = false
      end
    end

    local open_jacoco_report = function()
      if file_exists(report_index_html) then
        vim.fn.system('xdg-open ' .. report_index_html)
      else
        vim.notify('index.html not found at: ' .. report_index_html .. '. Maybe you should run some tests :)', vim.log.levels.INFO)
      end
    end

    vim.api.nvim_create_autocmd('FileType', {
      pattern = { 'java' },
      callback = function()
        vim.keymap.set('n', '<leader>cr', toggle_coverage_report, { buffer = 0, desc = 'Toggle coverage report' })
      end,
    })

    vim.api.nvim_create_autocmd('FileType', {
      pattern = { 'java' },
      callback = function()
        vim.keymap.set('n', '<leader>jro', open_jacoco_report, { desc = 'Open jacoco report in current browser' })
      end,
    })
  end,
}
