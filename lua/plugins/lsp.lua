return {
  'neovim/nvim-lspconfig',
  dependencies = {
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    { 'j-hui/fidget.nvim', opts = {} },
  },
  config = function()
    vim.api.nvim_create_autocmd('LspAttach', {
      callback = function(event)
        local map = function(keys, func, desc)
          vim.keymap.set('n', keys, func, { buffer = event.buf, desc = desc })
        end

        -- Essential navigation
        map('gd', require('telescope.builtin').lsp_definitions, 'Go to Definition')
        map('gR', require('telescope.builtin').lsp_references, 'Go to References')
        map('gI', require('telescope.builtin').lsp_implementations, 'Go to Implementation')

        -- Essential actions
        map('<leader>rn', vim.lsp.buf.rename, 'Rename')
        map('<leader>ca', vim.lsp.buf.code_action, 'Code Action')
        map('K', vim.lsp.buf.hover, 'Hover Documentation')

        -- Document symbols
        -- map('<leader>ds', require('telescope.builtin').lsp_document_symbols, 'Document Symbols')

        -- Highlight references when cursor holds
        local client = vim.lsp.get_client_by_id(event.data.client_id)
        if client and client.server_capabilities.documentHighlightProvider then
          vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
            buffer = event.buf,
            callback = vim.lsp.buf.document_highlight,
          })
          vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
            buffer = event.buf,
            callback = vim.lsp.buf.clear_references,
          })
        end
      end,
    })

    local capabilities = require('cmp_nvim_lsp').default_capabilities()

    local servers = {
      lua_ls = {
        settings = {
          Lua = {
            runtime = { version = 'LuaJIT' },
            workspace = {
              checkThirdParty = false,
              library = {
                '${3rd}/luv/library',
                unpack(vim.api.nvim_get_runtime_file('', true)),
              },
            },
            telemetry = { enable = false },
            diagnostics = { disable = { 'missing-fields' }, globals = { 'vim' } },
          },
        },
      },
      pylsp = {
        settings = {
          pylsp = {
            plugins = {
              pycodestyle = {
                enabled = true,
                ignore = { 'E501' }, -- Ignore line length
              },
              pyflakes = { enabled = true },
              mccabe = { enabled = true },
            },
          },
        },
      },
      ruff = {},
    }

    require('mason').setup()
    require('mason-lspconfig').setup {
      ensure_installed = vim.tbl_keys(servers),
      handlers = {
        function(server_name)
          local server = servers[server_name] or {}
          server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
          require('lspconfig')[server_name].setup(server)
        end,
      },
    }
  end,
}
