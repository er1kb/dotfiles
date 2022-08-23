local g = vim.g
local o = vim.o

vim.api.nvim_command('filetype plugin indent on')

o.termguicolors = true
-- o.background = 'dark'

-- Do not save when switching buffers
-- o.hidden = true

-- Map <leader> to ,
g.mapleader = ','
g.maplocalleader = ','

-- Decrease update time
o.timeoutlen = 500
o.updatetime = 200                          -- faster completion (4000ms default)

-- Number of screen lines to keep above and below the cursor
o.scrolloff = 8
o.sidescrolloff = 8

-- Better editor UI
o.number = true                           -- set numbered lines
o.relativenumber = true                  -- set relative numbered lines
o.numberwidth = 4                         -- set number column width to 2 {default 4}
o.signcolumn = "yes"                      -- always show the sign column, otherwise it would shift the text each time
o.cursorline = true                       -- highlight the current line
o.showmatch = true

o.tabstop = 4
o.expandtab = true
o.softtabstop = 4 -- If negative, shiftwidth value is used
o.shiftwidth = 4
o.smarttab = true
o.cindent = true
-- o.autoindent = true
o.wrap = true                            -- do not display lines as one long line
o.textwidth = 300
o.list = true
o.listchars = 'trail:·,nbsp:◇,tab:→ ,extends:▸,precedes:◂'
-- o.listchars = 'eol:¬,space:·,lead: ,trail:·,nbsp:◇,tab:→-,extends:▸,precedes:◂,multispace:···⬝,leadmultispace:│   ,'
-- o.formatoptions = 'qrn1'
-- Makes neovim and host OS clipboard play nicely with each other
o.clipboard = 'unnamedplus'

-- Case insensitive searching UNLESS /C or capital in search
o.ignorecase = true
o.smartcase = true

-- Undo and backup options
o.backup = false
o.writebackup = false
o.undofile = true                         -- enable persistent undo
o.swapfile = false
-- o.backupdir = '/tmp/'
-- o.directory = '/tmp/'
-- o.undodir = '/tmp/'

-- Remember 1000 items in commandline history
o.history = 1000

-- BUG: this won't update the search count after pressing `n` or `N`
-- When running macros and regexes on a large file, lazy redraw tells neovim/vim not to draw the screen
o.lazyredraw = true

-- Better folds (don't fold by default)
-- o.foldmethod = 'indent'
-- o.foldlevelstart = 99
-- o.foldnestmax = 3
-- o.foldminlines = 1

o.cmdheight = 2                           -- more space in the neovim command line for displaying messages
o.completeopt = "menuone,noselect"     -- mostly just for cmp
o.conceallevel = 0                        -- so that `` is visible in markdown files
o.fileencoding = "utf-8"                  -- the encoding written to a file
o.hlsearch = true                         -- highlight all matches on previous search pattern
o.mouse = "a"                             -- allow the mouse to be used in neovim
o.pumheight = 10                          -- pop up menu height
o.showmode = false                        -- we don't need to see things like -- INSERT -- anymore
o.showtabline = 2                         -- always show tabs
o.smartindent = true                      -- make indenting smarter again
o.splitbelow = true                       -- force all horizontal splits to go below current window
o.splitright = true                       -- force all vertical splits to go to the right of current window
o.writebackup = false                     -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
o.guifont = "monospace:h17"               -- the font used in graphical neovim applications

vim.opt.shortmess:append "c" -- https://neovim.io/doc/user/options.html

vim.cmd "set whichwrap+=<,>,[,],h,l"
vim.cmd [[set iskeyword+=-]]
-- vim.cmd [[set formatoptions-=cro]] -- TODO: this doesn't seem to work

-- https://github.com/LunarVim/Neovim-from-scratch/blob/01-options/lua/user/options.lua
-- https://github.com/LunarVim/Neovim-from-scratch/blob/01-options/lua/user/options.lua
-- https://gitlab.com/dwt1/dotfiles/-/blob/master/.config/nvim/init.lua
