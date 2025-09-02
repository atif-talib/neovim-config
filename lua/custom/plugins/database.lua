return {
  {
    "tpope/vim-dadbod",
    lazy = true,
    cmd = { "DBUI", "DBUIToggle", "DBUIAddConnection", "DBUIFindBuffer" },
  },
  {
    "kristijanhusak/vim-dadbod-ui",
    dependencies = { "tpope/vim-dadbod" },
    config = function()
      -- Hook into DBUI open to start the SSH tunnel
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "dbui",
        callback = function()
          tunnel.ensure_tunnel()
        end,
      })
    end
  },
  {
    "kristijanhusak/vim-dadbod-completion",
    ft = { "sql", "mysql" },
    dependencies = { "tpope/vim-dadbod" },
    config = function()
      vim.api.nvim_exec([[
        autocmd FileType sql,mysql lua require('cmp').setup.buffer {
          sources = { { name = 'vim-dadbod-completion' } }
        }
      ]], false)
      notify.info("Dadbod completion loaded for SQL files.")
    end
  }
}
