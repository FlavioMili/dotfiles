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
