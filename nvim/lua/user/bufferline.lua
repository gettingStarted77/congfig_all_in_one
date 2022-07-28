local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then
  print("require.(bufferline) failed")
  return
end

bufferline.setup {
  options = {
  -- You can prefix buffer names with either the ordinal or buffer id 
  -- For 8|² -
  --numbers = function(opts)
  --  return string.format('%s|%s', opts.id, opts.raise(opts.ordinal))
  --end,
  numbers = "buffer_id",
  }
}
