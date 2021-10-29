local cmp = require('cmp')
cmp.setup({
	snippet = {
		expand = function(args)
			require('luasnip').lsp_expand(args.body)
		end,
	},
	mapping = cmp.mapping.preset.insert({
		['<C-b>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<C-Space>'] = cmp.mapping.complete(),
		['<C-e>'] = cmp.mapping.abort(),
		['<CR>'] = cmp.mapping.confirm({ select = true }),
	}),
	sources = cmp.config.sources({
		{ name = 'nvim_lsp' },
		{ name = 'luasnip' },
	}, {
		{ name = 'buffer' },
		{ name = 'path' },
	}, {
	})
})
local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

cmp.setup.cmdline('/', {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = 'buffer' }
	}
})

cmp.setup.cmdline(':', {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = 'path' }
	}, {
		{
			name = 'cmdline',
			option = {
				ignore_cmds = { 'Man', '!' }
			}
		}
	})
})

local function config(_config)
	return vim.tbl_deep_extend("force", {
		capabilities = capabilities,
		on_attach = function()
			vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end)
			vim.keymap.set("n", "gr", function() vim.lsp.buf.references() end)
			vim.keymap.set("n", "gt", function() vim.lsp.buf.type_definition() end)
			vim.keymap.set("n", "rn", function() vim.lsp.buf.rename() end)
			vim.keymap.set("n", "ca", function() vim.lsp.buf.code_action() end)
			vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end)
			vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end)
			vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end)
		end,
	}, _config or {})
end

require('lspconfig').zls.setup(config())
require('lspconfig').vls.setup(config())
require('lspconfig').rust_analyzer.setup(config())
require('lspconfig').clangd.setup(config())
require('lspconfig').lua_ls.setup(config())
require('lspconfig').gopls.setup(config())
require('lspconfig').pyright.setup(config())
