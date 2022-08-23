-- Vanilla Config
require('erik.settings')
require('erik.autocmd')
require('erik.plugins')
require('erik.keybinds')
require('erik.colorscheme')

-- Plugins
require('erik.cmp')
require('erik.lsp')
require('erik.telescope')
require('erik.treesitter')
require('erik.autopairs')
require('erik.comment')
require('erik.toggleterm')
require('erik.quick-scope')
require('erik.sneak')
require('erik.nvim-tree')
require('erik.aerial')
require('erik.which-key')
require('erik.harpoon')
require('erik.markdown-preview')
require('erik.mkdnflow')

require('lualine').setup()
--{ options = { theme = base16 } }


---Pretty print lua table
function _G.dump(...)
    local objects = vim.tbl_map(vim.inspect, { ... })
    print(unpack(objects))
end
