local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
  print("require.(lualine) failed")
  return
end

lualine.setup {
  -- your configuration comes here
  -- or leave it empty to use the default settings
  -- refer to the configuration section below
  options = { theme = "onedark" }
}
