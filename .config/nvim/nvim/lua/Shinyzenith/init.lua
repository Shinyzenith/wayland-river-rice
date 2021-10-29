require("Shinyzenith.packer")
require("Shinyzenith.autocmd")

vim.cmd("source " .. os.getenv("XDG_CONFIG_HOME") .. "nvim/lua/Shinyzenith/abbrev.vim")

-- G settings
vim.g.mapleader = " "
vim.g.neovide_transparency = 0.8
vim.g.neovide_cursor_vfx_mode = "sonicboom"

-- Netrw settings
vim.g.netrw_banner = 0
vim.g.netrw_browser_split = 0
vim.g.netrw_winsize = 25

-- vim.opt.scrolloff=999
vim.opt.backup = false
vim.opt.cindent = true
vim.opt.clipboard = "unnamed"
vim.opt.colorcolumn = "150"
vim.opt.completeopt = { "menuone", "noselect" }
vim.opt.encoding = "UTF-8"
vim.opt.errorbells = false
vim.opt.guifont = "Iosevka Term"
vim.opt.hidden = true
vim.opt.incsearch = true
vim.opt.linebreak = true
--vim.opt.mouse = "a"
vim.opt.mouse = nil
vim.opt.mousefocus = true
vim.opt.relativenumber = true
vim.opt.shiftwidth = 4
vim.opt.signcolumn = "yes"
vim.opt.smartcase = true
vim.opt.smartindent = true
vim.opt.smarttab = true
vim.opt.softtabstop = 4
vim.opt.swapfile = false
vim.opt.tabstop = 4
vim.opt.title = true
vim.opt.undodir = os.getenv("XDG_CACHE_HOME") .. "nvim/undodir"
vim.opt.undofile = true
vim.opt.wildmenu = true
vim.opt.wildmode = { "longest", "list", "full" }
vim.opt.wrap = false

-- Global status line and set window separator
vim.opt.laststatus = 3
vim.cmd("highlight WinSeparator guibg=None")
