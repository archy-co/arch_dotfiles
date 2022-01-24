if has("nvim")
    source ~/.vim/plugged/nvim-vim-termbinds/autoload/vim_termbinds/readkeys.vim 
    source ~/.vim/plugged/nvim-vim-termbinds/plugin/termbindings.vim

    source ~/.vim/modules/general.vim
    source ~/.vim/modules/plugins.vim

    " Telescope
    nnoremap <space>ff <cmd>Telescope find_files<cr>
    nnoremap <space>fb <cmd>Telescope buffers<cr>
    nnoremap <leader>f <cmd>Telescope lsp_range_code_actions<cr>


lua << EOF

    -- vim.cmd [[autocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()]]
    -- Showing defaults
    -- require'nvim-lightbulb'.update_lightbulb {
    --     sign = {
    --         enabled = true,
    --         -- Priority of the gutter sign
    --         priority = 10,
    --     },
    --     float = {
    --         enabled = false,
    --         -- Text to show in the popup float
    --         text = "*",
    --         -- Available keys for window options:
    --         -- - height     of floating window
    --         -- - width      of floating window
    --         -- - wrap_at    character to wrap at for computing height
    --         -- - max_width  maximal width of floating window
    --         -- - max_height maximal height of floating window
    --         -- - pad_left   number of columns to pad contents at left
    --         -- - pad_right  number of columns to pad contents at right
    --         -- - pad_top    number of lines to pad contents at top
    --         -- - pad_bottom number of lines to pad contents at bottom
    --         -- - offset_x   x-axis offset of the floating window
    --         -- - offset_y   y-axis offset of the floating window
    --         -- - anchor     corner of float to place at the cursor (NW, NE, SW, SE)
    --         -- - winblend   transparency of the window (0-100)
    --         win_opts = {},
    --     },
    --     virtual_text = {
    --         enabled = false,
    --         -- Text to show at virtual text
    --         text = "*",
    --         -- highlight mode to use for virtual text (replace, combine, blend), see :help nvim_buf_set_extmark() for reference
    --         hl_mode = "replace",
    --     },
    --     status_text = {
    --         enabled = false,
    --         -- Text to provide when code actions are available
    --         text = "*",
    --         -- Text to provide when no actions are available
    --         text_unavailable = "-"
    --     }
    -- }




    local has_words_before = function()
      local line, col = unpack(vim.api.nvim_win_get_cursor(0))
      return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
    end




    local nvim_lsp = require('lspconfig')

    local on_attach = function(client, bufnr)
      local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
      local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

      -- Enable completion triggered by <c-x><c-o>
      buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

      -- Mappings.
      local opts = { noremap=true, silent=true }

      -- See `:help vim.lsp.*` for documentation on any of the below functions
      buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
      buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
      buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
      buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
      buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
      buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
      buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
      buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
      buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
      buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
      buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
      buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
      buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
      buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
      buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
      buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
      buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)

    end

    -- Add additional capabilities supported by nvim-cmp
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities.textDocument.completion.completionItem.documentationFormat = { 'markdown', 'plaintext' }
    capabilities.textDocument.completion.completionItem.snippetSupport = true
    capabilities.textDocument.completion.completionItem.preselectSupport = true
    capabilities.textDocument.completion.completionItem.insertReplaceSupport = true
    capabilities.textDocument.completion.completionItem.labelDetailsSupport = true
    capabilities.textDocument.completion.completionItem.deprecatedSupport = true
    capabilities.textDocument.completion.completionItem.commitCharactersSupport = true
    capabilities.textDocument.completion.completionItem.tagSupport = { valueSet = { 1 } }
    capabilities.textDocument.completion.completionItem.resolveSupport = {
      properties = {
        'documentation',
        'detail',
        'additionalTextEdits',
      },
    }

    -- Setup nvim-cmp.
    local cmp = require'cmp'

    local luasnip = require('luasnip')
    
    cmp.setup({
      snippet = {
        -- REQUIRED - you must specify a snippet engine
        expand = function(args)
          luasnip.lsp_expand(args.body) -- For `luasnip` users.
        end,
      },
      mapping = {
        ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
        ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
        ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
        ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
        ['<C-e>'] = cmp.mapping({
          i = cmp.mapping.abort(),
          c = cmp.mapping.close(),
        }),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),


        ["<C-l>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          elseif has_words_before() then
            cmp.complete()
          else
            fallback()
          end
        end, { "i", "s" }),

        ["<C-S-l>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),

        -- ["<S-Tab>"] = cmp.mapping(function(fallback)
        --   if cmp.visible() then
        --     cmp.select_prev_item()
        --   elseif luasnip.jumpable(-1) then
        --     luasnip.jump(-1)
        --   else
        --     fallback()
        --   end
        -- end, { "i", "s" }),

        --["<Tab>"] = cmp.mapping(function(fallback)
        --  if cmp.visible() then
        --    cmp.select_next_item()
        --  elseif luasnip.expand_or_jumpable() then
        --    luasnip.expand_or_jump()
        --  elseif has_words_before() then
        --    cmp.complete()
        --  else
        --    fallback()
        --  end
        --end, { "i", "s" }),

        --["<S-Tab>"] = cmp.mapping(function(fallback)
        --  if cmp.visible() then
        --    cmp.select_prev_item()
        --  elseif luasnip.jumpable(-1) then
        --    luasnip.jump(-1)
        --  else
        --    fallback()
        --  end
        --end, { "i", "s" }),
      },
      sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' }, -- For luasnip users.
        { name = 'path' },
      -- }, {
      --   { name = 'buffer' },
      })
    })
    
    -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
    cmp.setup.cmdline('/', {
      sources = {
        { name = 'buffer' }
      }
    })
    
    -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
    cmp.setup.cmdline(':', {
      sources = cmp.config.sources({
        { name = 'path' }
      },
      {
        { name = 'cmdline' }
      })
    })
    
    -- Setup lspconfig.
    local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

    local system_name = "Linux"
    -- -- set the path to the sumneko installation; if you previously installed via the now deprecated :LspInstall, use
    local sumneko_root_path = vim.fn.stdpath('cache')..'/lspconfig/sumneko_lua/lua-language-server'
    local sumneko_binary = sumneko_root_path.."/bin/"..system_name.."/lua-language-server"

    local runtime_path = vim.split(package.path, ';')
    table.insert(runtime_path, "lua/?.lua")
    table.insert(runtime_path, "lua/?/init.lua")

    nvim_lsp.sumneko_lua.setup {
      cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"};
      settings = {
        Lua = {
          runtime = {
            -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
            version = 'LuaJIT',
            -- Setup your lua path
            path = runtime_path,
          },
          diagnostics = {
            -- Get the language server to recognize the `vim` global
            globals = {'vim'},
          },
          workspace = {
            -- Make the server aware of Neovim runtime files
            library = vim.api.nvim_get_runtime_file("", true),
          },
          -- Do not send telemetry data containing a randomized but unique identifier
          telemetry = {
            enable = false,
          },
        },
      },
    }


    -- nvim_lsp.clangd.setup {
    --     on_attach = on_attach,
    --     capabilities = capabilities,
    -- }


    -- Enable some language servers with the additional completion capabilities offered by nvim-cmp
    -- require'lspconfig'.java_language_server.setup{cmd = { '/usr/bin/java-language-server' }}
    local servers = { 'clangd', 'jedi_language_server', 'jdtls' }
    for _, lsp in ipairs(servers) do
      nvim_lsp[lsp].setup {
        on_attach = on_attach,
        capabilities = capabilities,
      }
    end

EOF
    " autocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()
    autocmd CursorHold,CursorHoldI * lua require('code_action_utils').code_action_listener()
endif
