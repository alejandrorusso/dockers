vim.g.base46_cache = vim.fn.stdpath "data" .. "/nvchad/base46/"
vim.g.mapleader = " "

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require "configs.lazy"

-- load plugins
require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
    config = function()
      require "options"
    end,
  },

  { import = "plugins" },
}, lazy_config)

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "nvchad.autocmds"

vim.schedule(function()
  require "mappings"
end)

local mr = require "mason-registry"

-- Auto-install Mason Pretty Printers
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    -- Lua
    if not mr.is_installed "stylua" then
      vim.cmd "MasonInstall stylua"
    end

    -- Haskell
    if not mr.is_installed "fourmolu" then
      vim.cmd "MasonInstall fourmolu"
    end

    -- Markdown
    if not mr.is_installed "prettier" then
      vim.cmd "MasonInstall prettier@2.8.8"
    end

    -- Grammar checker
    if not mr.is_installed "ltex-ls" then
      vim.cmd "MasonInstall ltex-ls"
    end

    -- vim.cmd "TSInstall haskell"
  end,
})
