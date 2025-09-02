-- snacks/lsp.lua
return {
  'neovim/nvim-lspconfig',
  dependencies = {
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    {
      'j-hui/fidget.nvim',
      tag = 'v1.4.0',
      opts = {
        progress = { display = { done_icon = '✓' } },
        notification = { window = { winblend = 0 } },
      },
    },
  },
  config = function()
    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
      callback = function(event)

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
            completion = { callSnippet = 'Replace' },
            telemetry = { enable = false },
            diagnostics = { disable = { 'missing-fields' } },
          },
        },
      },
      pylsp = {
        settings = {
          pylsp = {
            configurationSources = { "pycodestyle" },
            plugins = {
              pycodestyle = { enabled = true, maxLineLength = 120, ignore = { 'E501' } },
              pyflakes = { enabled = true },
              mccabe = { enabled = true },
              autopep8 = { enabled = false },
              yapf = { enabled = false },
              pylint = { enabled = false },
              pylsp_mypy = { enabled = false },
              pylsp_black = { enabled = false },
              pylsp_isort = { enabled = false },
            },
          },
        },
      },
      ruff = {
        cmd = { 'ruff', 'server' },
        filetypes = { 'python' },
        root_markers = { 'pyproject.toml', 'ruff.toml', '.ruff.toml', '.git' },
        settings = {
          args = { '--ignore', 'E501' },
        },
        commands = {
          RuffAutofix = {
            function()
              vim.lsp.buf.execute_command {
                command = 'ruff.applyAutofix',
                arguments = { { uri = vim.uri_from_bufnr(0) } },
              }
            end,
            description = 'Ruff: Fix all auto-fixable problems',
          },
          RuffOrganizeImports = {
            function()
              vim.lsp.buf.execute_command {
                command = 'ruff.applyOrganizeImports',
                arguments = { { uri = vim.uri_from_bufnr(0) } },
              }
            end,
            description = 'Ruff: Format imports',
          },
        },
      },
    }

    require('mason').setup()

    local ensure_installed = vim.tbl_keys(servers or {})
    require('mason-tool-installer').setup { ensure_installed = ensure_installed }

    require('mason-lspconfig').setup {
      ensure_installed = ensure_installed,
      automatic_enable = true,
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
