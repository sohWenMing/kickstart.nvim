-- [[ Install `lazy.nvim` plugin manager ]]
--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'

-- evals lazypath to be the expression from vim.fn.stdpth('data' + '/lazy/lazy.nvm')
-- ~/local/share/nvim/lazy/lazy.nvim
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  -- if lazypath doesn't exist, then go to the repo, and get it
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end

---@type vim.Option
local rtp = vim.opt.rtp
-- remember - rtp is actually the 'runtimepath'
-- we are prepending this to the run time path so that it gets evaluated first,
-- because we are going to need it later
rtp:prepend(lazypath)

-- really, all we're trying to do here, is to prepend the lazypath (if it exists)
-- to the runtimepath. if it doesn't yet exist, then we grab the repo, then append
-- to the runtimepath
