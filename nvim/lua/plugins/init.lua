return {
  {
    "stevearc/conform.nvim",
    event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = {
      git = { enable = true },
    },
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "cpp",
        "lua",
        "python",
        "vhdl",
        "sql",
      }
    }
  },

  {
    "smoka7/hop.nvim",
    opts = {
      multi_windows = true,
      keys = "wertiopksjdmxnc",
      uppercase_labels = false,
    },
    keys = {
      {
        "<leader>fj",
        function ()
          require("hop").hint_words()
        end,
        mode = { "n", "x", "o" }
      }
    }
  },

  {
    'Exafunction/codeium.vim',
    event = 'BufEnter',
    version="1.8.37",
  },

  { 'echasnovski/mini.nvim', version = '*', lazy=false, config=function() require('mini.animate').setup() end},
    {
    "kkoomen/vim-doge", lazy=false
  },

    {
        'brianhuster/live-preview.nvim',
        dependencies = {
            'brianhuster/autosave.nvim',  -- Not required, but recomended for autosaving and sync scrolling
            'nvim-telescope/telescope.nvim',
        },
        opts = {
cmd = "LivePreview", -- Main command of live-preview.nvim
    port = 5500, -- Port to run the live preview server on.
    autokill = false, -- If true, the plugin will autokill other processes running on the same port (except for Neovim) when starting the server.
    browser = 'default', -- Terminal command to open the browser for live-previewing (eg. 'firefox', 'flatpak run com.vivaldi.Vivaldi'). By default, it will use the default browser.
    dynamic_root = false, -- If true, the plugin will set the root directory to the previewed file's directory. If false, the root directory will be the current working directory (`:lua print(vim.uv.cwd())`).
    sync_scroll = true, -- If true, the plugin will sync the scrolling in the browser as you scroll in the Markdown files in Neovim.
    picker = 'telescope',
      },
   },

{
  'nvimdev/dashboard-nvim',
  event = 'VimEnter',
  config = function()
    require('dashboard').setup {
        theme = 'hyper',
        config = {
         header = {
            '',
          ' █████▒██▓    ▄▄▄    ██▒   █▓ ██▓ ███▄ ▄███▓',
          '▓██   ▒▓██▒   ▒████▄ ▓██░   █▒▓██▒▓██▒▀█▀ ██▒',
          '▒████ ░▒██░   ▒██  ▀█▄▓██  █▒░▒██▒▓██    ▓██░',
          '░▓█▒  ░▒██░   ░██▄▄▄▄██▒██ █░░░██░▒██    ▒██ ',
          '░▒█░   ░██████▒▓█   ▓██▒▒▀█░  ░██░▒██▒   ░██▒',
          ' ▒ ░   ░ ▒░▓  ░▒▒   ▓▒█░░ ▐░  ░▓  ░ ▒░   ░  ░',
          ' ░     ░ ░ ▒  ░ ▒   ▒▒ ░░ ░░   ▒ ░░  ░      ░',
          ' ░ ░     ░ ░    ░   ▒     ░░   ▒ ░░      ░   ',
          '           ░  ░     ░  ░   ░   ░         ░   ',
          '                          ░                   ',
          },
         shortcut ={
          {
            desc = "Oh no!!! Not you again!!!",
          },
        },
          footer = {"", "Let’s pretend this never happened!"},
       },
      }
        end,
        dependencies = { {'nvim-tree/nvim-web-devicons'}}
  },

}
