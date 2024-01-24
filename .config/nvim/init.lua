-- *********************************************************************
--  _       _ _     _
-- (_)_ __ (_) |_  | |_   _  __ _
-- | | '_ \| | __| | | | | |/ _` |
-- | | | | | | |_ _| | |_| | (_| |
-- |_|_| |_|_|\__(_)_|\__,_|\__,_|
--
-- *********************************************************************

local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
vim.g.mapleader = ' '
require('lazy').setup({
  {
    'vim-jp/vimdoc-ja',
    lazy = true,
    keys = {
      { 'h', mode = 'c', },
    },
  },
  {
    'KeitaNakamura/neodark.vim',
    config = function()
      vim.o.background = 'dark'
      vim.g['neodark#use_custom_terminal_theme'] = 1
      vim.cmd.colorscheme 'neodark'
    end,
  },
  {
    'hrsh7th/nvim-cmp',
    config = function()
      local cmp = require('cmp')

      cmp.setup({
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert({
          ['<TAB>'] = function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            else
              fallback()
            end
          end,
          ['<S-TAB>'] = function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            else
              fallback()
            end
          end,
          ['<CR>'] = cmp.mapping.confirm({ select = true })
        }),
        matching = {
          disallow_fuzzy_matching = false,
          disallow_fullfuzzy_matching = false,
          disallow_partial_fuzzy_matching = false,
          disallow_partial_matching = false,
          disallow_prefix_unmatching = false,
        },
        sources = cmp.config.sources({
          { name = 'buffer' },
          { name = 'path' },
        }),
      })

      cmp.setup.filetype('gitcommit', {
        sources = cmp.config.sources({
          { name = 'git' },
          { name = 'buffer' },
        }),
      })

      cmp.setup.cmdline({ '/', '?' }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = 'buffer' },
        }),
      })

      cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = 'path' },
          { name = 'cmdline' },
        }),
      })
    end,
  },
  {
    'hrsh7th/cmp-buffer',
  },
  {
    'hrsh7th/cmp-path',
  },
  {
    'hrsh7th/cmp-cmdline',
  },
  {
    'petertriho/cmp-git',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = {},
  },
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function()
      local configs = require('nvim-treesitter.configs')

      configs.setup({
        ensure_installed = { 'c', 'go', 'lua', 'python', 'query', 'vim', 'vimdoc' },
        highlight = { enable = true },
        indent = { enable = true },
      })
    end,
  },
  {
    'nvim-treesitter/nvim-treesitter-textobjects',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
  },
  {
    'nvim-treesitter/nvim-treesitter-context',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
  },
  {
    'nvim-tree/nvim-tree.lua',
    opts = {
      on_attach = function(bufnr)
        local api = require('nvim-tree.api')
        local function opts(desc)
            return {
              desc = 'nvim-tree: ' .. desc,
              buffer = bufnr,
              noremap = true,
              silent = true,
              nowait = true,
            }
        end

        -- api.config.mappings.default_on_attach(bufnr)
        -- selected from the default mappings
        vim.keymap.set('n', '<C-i>',   api.node.show_info_popup,            opts('Info'))
        vim.keymap.set('n', '<C-r>',   api.fs.rename_sub,                   opts('Rename: Omit Filename'))
        vim.keymap.set('n', '<C-v>',   api.node.open.vertical,              opts('Open: Vertical Split'))
        vim.keymap.set('n', '<BS>',    api.node.navigate.parent_close,      opts('Close Directory'))
        vim.keymap.set('n', '<CR>',    api.node.open.edit,                  opts('Open'))
        vim.keymap.set('n', 'a',       api.fs.create,                       opts('Create File Or Directory'))
        vim.keymap.set('n', 'B',       api.tree.toggle_no_buffer_filter,    opts('Toggle Filter: No Buffer'))
        vim.keymap.set('n', 'c',       api.fs.copy.node,                    opts('Copy'))
        vim.keymap.set('n', 'C',       api.tree.toggle_git_clean_filter,    opts('Toggle Filter: Git Clean'))
        vim.keymap.set('n', 'd',       api.fs.remove,                       opts('Delete'))
        vim.keymap.set('n', 'D',       api.fs.trash,                        opts('Trash'))
        vim.keymap.set('n', 'E',       api.tree.expand_all,                 opts('Expand All'))
        vim.keymap.set('n', 'F',       api.live_filter.clear,               opts('Live Filter: Clear'))
        vim.keymap.set('n', 'f',       api.live_filter.start,               opts('Live Filter: Start'))
        vim.keymap.set('n', 'g?',      api.tree.toggle_help,                opts('Help'))
        vim.keymap.set('n', 'gy',      api.fs.copy.absolute_path,           opts('Copy Absolute Path'))
        vim.keymap.set('n', 'H',       api.tree.toggle_hidden_filter,       opts('Toggle Filter: Dotfiles'))
        vim.keymap.set('n', 'I',       api.tree.toggle_gitignore_filter,    opts('Toggle Filter: Git Ignore'))
        vim.keymap.set('n', 'M',       api.tree.toggle_no_bookmark_filter,  opts('Toggle Filter: No Bookmark'))
        vim.keymap.set('n', 'm',       api.marks.toggle,                    opts('Toggle Bookmark'))
        vim.keymap.set('n', 'o',       api.node.open.edit,                  opts('Open'))
        vim.keymap.set('n', 'O',       api.node.open.no_window_picker,      opts('Open: No Window Picker'))
        vim.keymap.set('n', 'p',       api.fs.paste,                        opts('Paste'))
        vim.keymap.set('n', 'P',       api.node.navigate.parent,            opts('Parent Directory'))
        vim.keymap.set('n', 'q',       api.tree.close,                      opts('Close'))
        vim.keymap.set('n', 'r',       api.fs.rename,                       opts('Rename'))
        vim.keymap.set('n', 'R',       api.tree.reload,                     opts('Refresh'))
        vim.keymap.set('n', 'S',       api.tree.search_node,                opts('Search'))
        vim.keymap.set('n', 'W',       api.tree.collapse_all,               opts('Collapse'))
        vim.keymap.set('n', 'x',       api.fs.cut,                          opts('Cut'))
        vim.keymap.set('n', 'y',       api.fs.copy.filename,                opts('Copy Name'))
        vim.keymap.set('n', 'Y',       api.fs.copy.relative_path,           opts('Copy Relative Path'))
        -- custom mappings
        vim.keymap.set('n', '<C-e>', api.tree.toggle, opts('Toggle'))
        vim.keymap.set('n', '<C-s>', api.node.open.horizontal, opts('Open: Horizontal Split'))
        vim.keymap.set('n', 'h', api.tree.change_root_to_parent, opts('Up'))
        vim.keymap.set('n', 'l', api.tree.change_root_to_node, opts('CD'))
      end,
      renderer = {
        indent_markers = {
          enable = true,
          inline_arrows = true,
        },
        icons = {
          show = {
            file = false,
            folder = false,
            folder_arrow = true,
            git = false,
            modified = false,
            diagnostics = false,
            bookmarks = false,
          },
          glyphs = {
            folder = {
              arrow_closed = '▸',
              arrow_open = '▾',
            },
          },
        },
      },
    },
    config = function(_, opts)
      require('nvim-tree').setup(opts)
      local api = require('nvim-tree.api')
      vim.keymap.set('n', '<C-e>', api.tree.toggle)
    end
  },
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.5',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = {
      defaults = {
        vimgrep_arguments = {
          'rg',
          '--color=never',
          '--no-heading',
          '--with-filename',
          '--hidden',
          '--line-number',
          '--column',
          '--smart-case',
          '--trim',
       },
      },
      pickers = {
        find_files = {
          hidden = true,
        },
      },
    },
    config = function(_, opts)
      require('telescope').setup(opts)
      local builtin = require('telescope.builtin')
      vim.keymap.set('n', '<C-p>', builtin.find_files)
      vim.keymap.set('n', '<C-o>', builtin.live_grep)
    end,
  },
  {
  },
  {
    'kylechui/nvim-surround',
    version = '*',
    event = 'VeryLazy',
    opts = {},
  },
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    opts = {},
  },
  {
    'nvim-lualine/lualine.nvim',
    opts = {
      options = {
        icons_enabled = false,
      },
      extensions = { 'lazy', 'nvim-tree' },
    },
  },
  {
    'tyru/caw.vim',
  },
  {
    'Vonr/align.nvim',
    branch = 'v2',
    lazy = true,
    init = function()
      local opts = { noremap = true, silent = true }
      vim.keymap.set(
        'x',
        'aa',
        function()
          require('align').align_to_char({
            length = 1,
          })
        end,
        opts
      )
    end
  },
  {
    'petertriho/nvim-scrollbar',
    opts = {},
  },
  {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup()
      require('scrollbar.handlers.gitsigns').setup()
    end
  },
  {
    'kevinhwang91/nvim-hlslens',
    config = function()
      -- require('hlslens').setup() is not required
      require('scrollbar.handlers.search').setup()
    end
  },
  {
    'HiPhish/rainbow-delimiters.nvim',
  },
  {
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    -- lazy loading to overwrite listchars only when the plugin is activated
    event = 'VeryLazy',
    config = function()
      -- using the colors from `bracket-pair-colorizer`
      local highlight = {
        'RainbowGold',
        'RainbowOrchid',
        'RainbowLightSkyBlue',
      }
      local hooks = require 'ibl.hooks'
      -- create the highlight groups in the highlight setup hook, so they are reset
      -- every time the colorscheme changes
      hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
        vim.api.nvim_set_hl(0, 'RainbowGold', { ctermfg = 11, fg = '#ffd700' })
        vim.api.nvim_set_hl(0, 'RainbowOrchid', { ctermfg = 9,fg = '#da70d6' })
        vim.api.nvim_set_hl(0, 'RainbowLightSkyBlue', { ctermfg = 14, fg = '#87cefa' })
      end)

      -- overwriting the value of tab to render indent scopes with `|`
      vim.opt.listchars:append({ tab = '|->' })
      vim.g.rainbow_delimiters = { highlight = highlight }
      require('ibl').setup({ indent = { highlight = highlight }, scope = { highlight = highlight } })

      hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
    end,
  },
})

vim.o.number = true
vim.o.hlsearch = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.expandtab = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.list = true
vim.o.listchars = 'tab:-->,space:·,nbsp:%'
vim.o.incsearch = true
vim.o.whichwrap = 'b,s,h,l,<,>,[,]'
vim.o.colorcolumn = 80
vim.o.laststatus = 2
vim.o.synmaxcol = 350
vim.o.wrap = false
vim.o.showmode = false
vim.o.scrolloff = 2
vim.o.cursorline = true
vim.o.foldmethod = 'expr'
vim.o.foldexpr = 'nvim_treesitter#foldexpr()'
vim.o.foldenable = false
vim.o.mouse = 'a'
vim.o.encoding = 'utf-8'
vim.o.fileencodings = 'utf-8,sjis'
vim.o.fileformats = 'unix,dos,mac'
vim.o.spelllang = 'en,cjk'
vim.o.backspace = 'indent,eol,start'
vim.o.clipboard= 'unnamedplus'
vim.o.termguicolors = true

vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-k>', '<C-w>k')
vim.keymap.set('n', '<C-l>', '<C-w>l')
vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<ESC><ESC>', ':nohl<CR>', { silent = true })

-- Remove trailing whitespace when saving the file
vim.api.nvim_create_autocmd({'BufWritePre'}, {
  pattern = { '*' },
  command = '%s/\\s\\+$//e'
})
