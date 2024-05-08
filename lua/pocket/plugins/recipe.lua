return {
  'ten3roberts/recipe.nvim',
  depends = { 'MunifTanjim/nui.nvim' },
  opt = {
    ----@class Task
    ----@field stop fun()
    ----@field focus fun()
    ----@field restart fun(on_start: fun(task: Task|nil), on_exit: fun(code: number): Task|nil): Task
    ----@field callbacks fun(code: number)[] added by lib
    ----@field recipe Recipe

    ----@class Config
    ----@field custom_recipes table<string, Recipe>
    ----@field term TermConfig customize terminal
    ----@field default_recipe Recipe
    ----@field adapter table
    ----@field dotenv string Load path as dotenv before spawn
    ----@class TermConfig
    term = {
      height = 0.7,
      width = 0.5,
      type = 'smart',
      border = 'single',
      jump_to_end = true,
      auto_close = false,
    },
    recipes_file = 'recipes.json',
    --- Define custom global recipes, either globally or by filetype as key
    -- custom_recipes = require 'recipe.ft',
    hooks = {
      pre = {
        function(_)
          vim.cmd ':wa'
        end,
      },
    },

    ---@class Recipe
    ---@field cmd string
    ---@field cwd string
    ---@field kind string one of build,term,dap or a custom adapter
    ---@field plain boolean
    ---@field env table|nil
    ---@field opts table Extra options for the current backend
    ---@field depends_on (string|Recipe)[]
    default_recipe = {
      cmd = '',
      kind = 'build',
      opts = {},
      restart = false,
      plain = false,
      depends_on = {},
      env = { __type = 'table' },
    },

    -- debug_adapters = {
    --   rust = require('recipe.debug_adapters').codelldb,
    --   c = require('recipe.debug_adapters').codelldb,
    --   cpp = require('recipe.debug_adapters').codelldb,
    -- },
    dotenv = '.env',
  },
  config = function()
    require('recipe').setup {

      default_options = {
        recipe_format = 'markdown',
        note_format = 'markdown',
        tags = {},
        default_tags = {},
        mappings = {
          default = {
            add_note = '<leader>an',
            add_tag = '<leader>at',
            edit_note = '<leader>en',
            open_note = '<leader>o',
            open_recipe = '<leader>o',
            remove_tag = '<leader>rt',
            toggle_tag = '<leader>tt',
          },
          insert = {},
        },
      },
    }
  end,
}
