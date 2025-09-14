-- example plugin spec for lazy.nvim (init.lua / plugins.lua)
return{ 
  {
  'chomosuke/typst-preview.nvim',
  lazy = false,
  version = '1.*',
  config = function()
    local data = vim.fn.stdpath('data')
    local mason_tinymist = vim.fn.executable('tinymist') == 1 and 'tinymist' or nil

    require('typst-preview').setup({
      -- if you want to force a path: dependencies_bin = { tinymist = data .. '/mason/bin/tinymist' }
      
      open_cmd = "qutebrowser %s",
      invert_colors = 'never',
      dependencies_bin = {
        ['tinymist'] = mason_tinymist,   -- 'tinymist' if in PATH, or nil to allow plugin downloads
        ['websocat'] = nil,              -- plugin will download websocat if nil
      },
      debug = false, -- set true to log debug info to stdpath('data') .. '/typst-preview/log.txt'
    })

    -- handy keymaps:
    vim.keymap.set('n', '<leader>tp', ':TypstPreviewToggle<CR>', {silent=true})
    vim.keymap.set('n', '<leader>to', ':TypstPreview<CR>', {silent=true})
    vim.keymap.set('n', '<leader>ts', ':TypstPreviewStop<CR>', {silent=true})
    vim.keymap.set('n', '<leader>tf', ':TypstPreviewFollowCursorToggle<CR>', {silent=true})
    vim.keymap.set('n', '<leader>tw', ':TypstWatch<CR>', {silent=true})

  end,
},
}
