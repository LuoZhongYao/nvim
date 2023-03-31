local use = require('packer').use
require('packer').startup(function()
  use 'wbthomason/packer.nvim' -- Package manager
  use 'neovim/nvim-lspconfig' -- Collection of configurations for built-in LSP client
  use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
  use 'hrsh7th/cmp-buffer' -- nvim-cmp source for buffer words
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
  use 'p00f/clangd_extensions.nvim'
  use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
  use 'github/copilot.vim'
end)

-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }
vim.api.nvim_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
vim.api.nvim_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
vim.api.nvim_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
vim.api.nvim_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
vim.lsp.set_log_level(vim.lsp.log_levels.OFF)

vim.api.nvim_create_autocmd('LspAttach', {
  desc = 'LSP actions',
  callback = function()
    local bufmap = function(mode, lhs, rhs)
      local opts = {buffer = true}
      vim.keymap.set(mode, lhs, rhs, opts)
    end

    bufmap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>')
    bufmap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
    bufmap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>')
    bufmap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>')
    bufmap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>')
    bufmap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>')
    bufmap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>')
    bufmap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>')
    bufmap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>')
    bufmap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>')
    bufmap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>')
    bufmap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>')
    bufmap('n', '<space>f', '<cmd>lua vim.lsp.buf.format { async = true }<CR>')
  end
})

local lspconfig = require('lspconfig')
-- Add additional capabilities supported by nvim-cmp
local capabilities = require('cmp_nvim_lsp').default_capabilities()

local servers = { 'clangd', 'rust_analyzer', 'cmake', 'pyright' }
for _, lsp in ipairs(servers) do
  require('lspconfig')[lsp].setup {
    capabilities = capabilities,
  }
end

local lspkind = require('lspkind')
-- nvim-cmp setup
local cmp = require 'cmp'
cmp.setup {
  mapping = cmp.mapping.preset.insert({
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
  }),
  sources = {
    { name = 'buffer' },
    { name = 'nvim_lsp' },
  },
  formatting = {
    format = lspkind.cmp_format({
      mode = 'symbol', -- show only symbol annotations
      maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
      ellipsis_char = '...', -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)

      -- The function below will be called before any actual modifications from lspkind
      -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
      before = function (entry, vim_item)
        return vim_item
      end
    })
  }
}

require'nvim-treesitter.configs'.setup {
  -- ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  -- ignore_install = { "javascript" }, -- List of parsers to ignore installing
  highlight = {
    enable = true,              -- false will disable the whole extension
    -- disable = { "c", "rust" },  -- list of language that will be disabled
  },
}
require("clangd_extensions").setup {
  extensions = {
    inlay_hints = {
      only_current_line = true,
      max_len_align = true,
      only_current_line_autocmd = "CursorMoved",
    }
  }
}

vim.opt.mouse = 'a'
vim.opt.background = 'light'
vim.opt.termguicolors = true
vim.opt.colorcolumn = '81'
vim.opt.laststatus = 0
vim.opt.fileencodings = {"utf-8", "gb18030", "gdk", "gdk2312"}
-- vim.opt.colorscheme = 'selenized'
vim.api.nvim_command [[colorscheme selenized]]
vim.api.nvim_buf_set_option(0, "tagfunc", "v:lua.vim.lsp.tagfunc")
vim.api.nvim_buf_set_option(0, 'formatexpr', 'v:lua.vim.lsp.formatexpr()')

-- copilot
vim.g.copilot_no_tab_map = 'v:true'
vim.api.nvim_set_keymap('i', '<C-J>', 'copilot#Accept("<CR>")', {script = true, silent = true, expr = true })

-- gtags
vim.cmd [[call gtags#load()]]
