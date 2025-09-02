return {
  -- "okuuva/auto-save.nvim",
  -- event = { "InsertLeave", "TextChanged" },
  -- opts = {
  --   execution_message = {
  --     message = function() return "" end,
  --   },
  --   condition = function(buf)
  --     local fn = vim.fn
  --     local bufname = fn.bufname(buf)
  --     local filetype = vim.api.nvim_buf_get_option(buf, "filetype")
  --
  --     -- Exclude DB query buffers or any matching name pattern
  --     local is_db_query_buf = bufname:match("^query%-%d%d%d%d%-%d%d%-%d%d%-%d%d%-%d%d%-%d%d$")
  --     local is_temp_or_nofile = bufname == "" or filetype == "" or filetype == "snacks_notif"
  --
  --     return not (is_db_query_buf or is_temp_or_nofile)
  --   end,
  -- },
}
