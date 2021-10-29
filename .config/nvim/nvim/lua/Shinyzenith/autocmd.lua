local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

-- Format on save :)
autocmd({ "BufWritePre" }, {
	group = augroup("fmt", {}),
	pattern = "*",
	command = "lua vim.lsp.buf.format()"
})

-- Automatic building on save :)
local build = augroup("build", {})
autocmd({ "BufWritePost" }, {
	group = build,
	pattern = "*.tex",
	command = "silent! !pdflatex %"
})

autocmd({ "BufWritePost" }, {
	group = build,
	pattern = "*.c(p{2})?",
	command = "!make"
})
