-- local ok, _ = pcall(vim.cmd, 'colorscheme base16-onedark')
-- local ok, _ = pcall(vim.cmd, 'colorscheme base16-tomorrow-night')

-- local colorscheme = "default"
-- local colorscheme = "base16-tomorrow-night"
local colorscheme = "base16-default-dark"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end


