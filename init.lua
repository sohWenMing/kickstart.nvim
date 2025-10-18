--[[

  To learn a bit more about lua, we can take a look at this to understand the syntax of lua
      - https://learnxinyminutes.com/docs/lua/

    After understanding a bit more about Lua, you can use `:help lua-guide` as a
    reference for how Neovim integrates Lua.
    - :help lua-guide
    - (or HTML version): https://neovim.io/doc/user/lua-guide.html

  To be able to see the help, we use :help
  we can also search the help documentation by using "<space>sh"

  I have left several `:help X` comments throughout the init.lua
    These are hints about where to find more information about the relevant settings,
    plugins or Neovim features used in Kickstart.

If you experience any errors while trying to install kickstart, run `:checkhealth` for more info.

--]]

-- gets the options module - ~/.config/nvim/lua/options/
require 'custom.options'
-- gets the keymaps module - ~/.config/nvim/lua/keymaps/
require 'custom.keymaps'
-- gets the autocommand module - ~/.config/nvim/lua/autocommands/
require 'custom.autocommands'
-- installation of lazy.nvim package manager - ~/.config/nvim/lua/lazy_package/
--  To check the current status of your plugins, run
--    :Lazy
require 'package_managment.lazy_package'
-- here - what we're doing is running the init.lua which is in folder
-- package_managemement/lazy_package
--

-- it's important to underestand here that when we require 'lazy' here
-- we're looking in the runtimpath, to find the first directory or file that has
-- "lazy in it" and then we're getting what ever is in there so we can use it
-- the tldr is that there is a setup function, where which allows us to pass in a
-- table which ww're using 'plugins' to achieve
require('lazy').setup(require 'plugins', {
  ui = {
    -- If you are using a Nerd Font: set icons to an empty table which will use the
    -- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
})

vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
  pattern = '*.gohtml',
  command = 'set filetype=html',
})

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
