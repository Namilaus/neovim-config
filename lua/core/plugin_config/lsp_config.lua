-- mason setup
require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = { "lua_ls", "rust_analyzer", "tsserver", "clangd", "jedi_language_server", "jdtls" },
})

-- lspconfig
local lspconfig = require("lspconfig")

local capabilities = require("cmp_nvim_lsp").default_capabilities()

lspconfig.lua_ls.setup({
	capabilities = capabilities,
})
lspconfig.rust_analyzer.setup({
	capabilities = capabilities,
})
lspconfig.tsserver.setup({
	capabilities = capabilities,
})

lspconfig.clangd.setup({
	capabilities = capabilities,
})

lspconfig.jedi_language_server.setup({
	capabilities = capabilities,
})

-- JDTLS configuration
local home = os.getenv("HOME")

local config = {
	cmd = {
		home .. "/.local/share/nvim/mason/bin/jdtls", -- Path to jdtls
		"-data",
		home .. "/workspace/", -- Change this to your workspace path
	},
	root_dir = lspconfig.util.root_pattern("gradlew", ".git", "mvnw"),
	capabilities = capabilities,
	settings = {
		java = {
			signatureHelp = { enabled = true },
			contentProvider = { preferred = "fernflower" },
			configuration = {
				updateBuildConfiguration = "interactive",
			},
			completion = {
				favoriteStaticMembers = {
					"org.hamcrest.MatcherAssert.assertThat",
					"org.hamcrest.Matchers.*",
					"org.hamcrest.CoreMatchers.*",
					"org.junit.jupiter.api.Assertions.*",
					"java.util.Objects.requireNonNull",
					"java.util.Objects.requireNonNullElse",
					"org.mockito.Mockito.*",
				},
			},
			sources = {
				organizeImports = {
					starThreshold = 9999,
					staticStarThreshold = 9999,
				},
			},
			codeGeneration = {
				toString = {
					template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}",
				},
				useBlocks = true,
			},
			configuration = {
				runtimes = {
					{
						name = "JavaSE-17",
						path = "/opt/homebrew/opt/openjdk/libexec/openjdk.jdk/Contents/Home", -- Path to JDK 17
					},
					{
						name = "JavaSE-11",
						path = "/opt/homebrew/opt/openjdk@11/libexec/openjdk.jdk/Contents/Home", -- Path to JDK 11
					},
					{
						name = "JavaSE-1.8",
						path = "/opt/homebrew/opt/openjdk@8/libexec/openjdk.jdk/Contents/Home", -- Path to JDK 8
					},
				},
			},
		},
	},
	init_options = {
		bundles = {},
	},
}

require("jdtls").start_or_attach(config)
lspconfig.jdtls.setup({})
