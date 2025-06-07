return {
  'neovim/nvim-lspconfig',
  opts = {
    servers = {
      tsserver = {
        init_options = {
          preferences = {
            includeCompletionsForModuleExports = true,
            includeCompletionsWithInsertText = true,
          },
        },
      },
    },
  },
}
