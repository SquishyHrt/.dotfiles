local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
    -- see :help lsp-zero-keybindings
    -- to learn the available actions
    lsp_zero.default_keymaps({buffer = bufnr})
end)

require('mason').setup({})
require('mason-lspconfig').setup({
    -- Replace the language servers listed here 
    -- with the ones you want to install
    ensure_installed = {'lua_ls'},
    handlers = {
        lsp_zero.default_setup,
    },
})


-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

local import_cmp, cmp = pcall(require, 'cmp')
if not import_cmp then return end

local import_luasnip, luasnip = pcall(require, 'luasnip')
if not import_luasnip then return end

cmp.setup({
	snippet = {
		expand = function(args) luasnip.lsp_expand(args.body) end,
	},

	formatting = {

		format = function(entry, vim_item)
			-- fancy icons and a name of kind
			local import_lspkind, lspkind = pcall(require, "lspkind")
			if import_lspkind then
				vim_item.kind = lspkind.presets.default[vim_item.kind]
			end

			-- limit completion width
			local ELLIPSIS_CHAR = '…'
			local MAX_LABEL_WIDTH = 35
			local label = vim_item.abbr
			local truncated_label = vim.fn.strcharpart(label, 0, MAX_LABEL_WIDTH)
			if truncated_label ~= label then
				vim_item.abbr = truncated_label .. ELLIPSIS_CHAR
			end

			-- set a name for each source
			vim_item.menu = ({
				buffer = "[Buff]",
				nvim_lsp = "[LSP]",
				luasnip = "[LuaSnip]",
				nvim_lua = "[Lua]",
				latex_symbols = "[Latex]",
			})[entry.source.name]
			return vim_item
		end,
	},

    sources = {
        {name = 'luasnip'},
		{name = 'nvim_lsp'},
		{name = 'nvim_lua'},
		{name = 'path'},
		{name = 'buffer', keyword_length = 1},
	},

	window = {
		documentation = {
			border = {"┌", "─", "┐", "│", "┘", "─", "└", "│"},
		},
		completion = {
			border = {"┌", "─", "┐", "│", "┘", "─", "└", "│"},
		}
	},

})

cmp.setup({
	mapping = {
		['<C-Space>'] = cmp.mapping.complete({}),
		['<C-e>'] = cmp.mapping.close(),
		['<C-u>'] = cmp.mapping.scroll_docs(-4),
		['<C-d>'] = cmp.mapping.scroll_docs(4),
		['<CR>'] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Replace,
			select = false,
		}),

		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			else
				fallback()
			end
		end, {"i", "s"}),

		["<S-Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, {"i", "s"}),

	},
})

-- lsp_zero.set_preferences({
--     suggest_lsp_servers = false,
--     sign_icons = {
--         error = 'E',
--         warn = 'W',
--         hint = 'H',
--         info = 'I'
--     }
-- })


require'lspconfig'.lua_ls.setup {
  on_init = function(client)
    local path = client.workspace_folders[1].name
    if vim.loop.fs_stat(path..'/.luarc.json') or vim.loop.fs_stat(path..'/.luarc.jsonc') then
      return
    end

    client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
      runtime = {
        -- Tell the language server which version of Lua you're using
        -- (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT'
      },
      -- Make the server aware of Neovim runtime files
      workspace = {
        checkThirdParty = false,
        library = {
          vim.env.VIMRUNTIME
          -- Depending on the usage, you might want to add additional paths here.
          -- "${3rd}/luv/library"
          -- "${3rd}/busted/library",
        }
        -- or pull in all of 'runtimepath'. NOTE: this is a lot slower
        -- library = vim.api.nvim_get_runtime_file("", true)
      }
    })
  end,
  settings = {
    Lua = {}
  }
}

require'lspconfig'.clangd.setup {
    cmd = { 'clangd',
    '--background-index',
    '--clang-tidy',
    '--header-insertion=iwyu',
    '--all-scopes-completion',
    '--background-index',
    '--compile_args_from=filesystem',
    '--completion-parse=always',
    '--completion-style=bundled',
    '--cross-file-rename',
    '--debug-origin',
    '--enable-config',
    '--fallback-style=Qt',
    '--folding-ranges',
    '--function-arg-placeholders',
    '--pch-storage=memory',
    '--suggest-missing-includes',
    '-j=4',
    '--log=error',
},

filetypes = { 'c', 'cpp', 'objc', 'objcpp' },
root_dir = require'lspconfig'.util.root_pattern('compile_commands.json', 'compile_flags.txt', '.git'),
init_options = {
    clangdFileStatus = true
}
}
