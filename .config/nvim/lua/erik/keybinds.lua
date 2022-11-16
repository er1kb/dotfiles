-- map command v to key combination k in mode m
local function map(m, k, v, opts)
    local options = { noremap = true, silent = true }
    if opts then
        options = vim.tbl.extend("force", options, opts)
    end
    vim.keymap.set(m, k, v, options)
end

-- Autocommand that reloads neovim whenever you save the keybinds.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost keybinds.lua source <afile>
  augroup end
]]

-- NORMAL MODE
-- Swedish qwerty mapping
map('', 'j', 'h')
map('', 'k', 'j')
map('', 'l', 'k')
map('', 'ö', 'l')
map('', 'h', '/')

-- Y yanks from cursor to the EOL
map('n', 'Y', 'yg$')

-- W inserts current working directory
map("n", "W", ":exe ':normal i' . substitute(getcwd(),'\\','/','g') <CR>")

-- Center cursor when joining lines
-- map('n', 'n', 'nzzzv')
-- map('n', 'N', 'Nzzzv')
-- map('n', 'J', 'mzJ`z')

-- Paste from clipboard
map('n', 'mk', '"+p')

-- K is opposite of J (split lines at cursor)
map('n', 'K', 'i<Enter><Esc>')

-- text mode: oo and OO starts a new paragraph below and above respectively
map('n', 'oo', 'o<CR>')
map('n', 'OO', 'O<CR><UP>')


-- Leader key bindings 
-- Press ,-f to turn off highlighting and clear any message already displayed.
map('n', '<Leader>f', '::nohlsearch<CR>')
-- Fast saving
map('n', '<Leader>w', ':w!<CR>')

-- Maps the spacebar to colon
map('n', '<Space>', ':')
map("n", "<Leader>v", "<C-w><C-w>")
map("n", "<Leader>e", ":NvimTreeToggle<CR>")


-- Resize with movement keys
-- map("n", "<C-ö>", ":resize +2<CR>", opts)
-- map("n", "<C-j>", ":resize -2<CR>", opts)
-- map("n", "<C-k>", ":vert--  resize -2<CR>", opts)
-- map("n", "<C-l>", ":vert-- ical resize +2<CR>", opts)
map("n", "<C-Up>", ":resize--  -2<CR>")
map("n", "<C-Down>", ":resi-- ze +2<CR>")
map("n", "<C-Left>", ":vertical resize -2<CR>")
map("n", "<C-Right>", ":vertical resize +2<CR>")

-- Navigate buffers
-- map("n", "<S-ö>", ":bnext<CR>", opts)
-- map("n", "<S-j>", ":bprevious<CR>", opts)


-- INSERT MODE
-- Set undo break points while typing
map('i', ',', ',<c-g>u')
map('i', '.', '.<c-g>u')
map('i', '?', '?<c-g>u')
map('i', '!', '!<c-g>u')
map('i', '(', '(<c-g>u')
map('i', ')', ')<c-g>u')

-- Quickly enter normal mode
map('i', 'jk', '<Esc>')

-- Paste from clipboard
map('i', 'mk', '<C-r>+')

-- Insert newline while being in insert mode
map('i', 'möjl', '<esc>imöjl')
map('i', 'mejl', '<esc>imejl')
map('i', 'jl', '<Esc>o')
map('i', 'JL', '<Esc>O')


-- VISUAL MODE
-- Replace visual selection without yanking it
map('v', 'p', '"_dP')
map('v', '<Space>', '<Esc>') -- Space key escapes visual mode

-- mk yanks to clipboard in visual mode
map('x', 'mk', '"+y')

-- Stay in indent mode
map("v", "<", "<gv")
map("v", ">", ">gv")

-- Move text up and down
map("v", "<A-j>", ":m .+1<CR>==")
map("v", "<A-k>", ":m .-2<CR>==")
map("v", "p", '"_dP')

-- Move text up and down
map("x", "K", ":move '>+1<CR>gv-gv")
map("x", "L", ":move '<-2<CR>gv-gv")
--[[ map("x", "<A-k>", ":move '>+1<CR>gv-gv") ]]
--[[ map("x", "<A-l>", ":move '<-2<CR>gv-gv") ]]

-- Visual mode pressing * or # searches for the current selection
-- Super useful! From an idea by Michael Naumann
-- vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
-- vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>

-- TERMINAL MODE
-- local term_opts = { silent = true }
-- Better terminal navigation
-- map("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
-- map("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
-- map("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
-- map("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

-- PLUGINS

-- keymap("n", "<leader>f", "<cmd>Telescope find_files<cr>", opts)
map("n", "<leader>t", "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>")
--map("n", "<leader>t", "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown())<cr>")
map("n", "<leader>r", "<cmd>Telescope live_grep<cr>")
--[[ map("n", "<leader>s", "<cmd>lua require('nvim-treesitter-playground.internal').toggle()<CR>") ]]
map("", "<leader>c", "gcc")

--[[ map("n", "<leader>p", ":lua _PYTHON_TOGGLE()<CR>") ]]
--
--
-- Harpoon
-- Terminal commands
-- ueoa is first through fourth finger left hand home row.
-- This just means I can crush, with opposite hand, the 4 terminal positions
--
-- These functions are stored in harpoon.  A plugn that I am developing
map("n", "<leader>a", function() require("harpoon.mark").add_file() end)
map("n", "<leader>q", function() require("harpoon.mark").clear_all() end)
map("n","<C-e>", function() require("harpoon.ui").toggle_quick_menu() end)

map("n","<C-j>", "<cmd>lua require('harpoon.ui').nav_file(1)<CR>")
map("n","<C-k>", "<cmd>lua require('harpoon.ui').nav_file(2)<CR>")
map("n","<C-l>", "<cmd>lua require('harpoon.ui').nav_file(3)<CR>")
map("n","<C-ö>", "<cmd>lua require('harpoon.ui').nav_file(4)<CR>")

--map("n", "<C-s>", "<cmd>lua require('markdown-preview').MarkdownPreview<CR>")
--map("n", "<M-s>", "<cmd>lua require('markdown-preview').MarkdownPreviewStop<CR>")
map("n", "<C-p>", ":MarkdownPreviewToggle<CR>")

map("n", "<Leader>cd", ":lua require'telescope'.extensions.zoxide.list{}<CR>")

map("n", "<Leader>b", "<cmd>lua _LAZYGIT_TOGGLE()<CR>")
map("n", "<Leader>l", "<cmd>lua _PYTHON_TOGGLE()<CR>")
