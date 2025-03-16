return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.prettier,
				null_ls.builtins.formatting.black,
				null_ls.builtins.formatting.isort,
				null_ls.builtins.diagnostics.rubocop.with({
					command = "bundler",
					args = { "exec", "rubocop", "--format", "json", "--stdin", "$FILENAME" },
					condition = function()
						return vim.fn.executable("bundle") == 1
					end,
				}),
				null_ls.builtins.diagnostics.erb_lint.with({
					command = "bundle",
					args = { "exec", "erb-lint", "--format", "json", "--stdin", "$FILENAME" },
					condition = function()
						return vim.fn.executable("bundle") == 1
					end,
				}),
				null_ls.builtins.formatting.rubocop,
			},
		})
	end,
	vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {}),
}
