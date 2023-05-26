local fileTemplate = os.getenv('NVIM_NEW_FILE_TEMPLATE')
if fileTemplate ~= nil then
  cmd('au BufNewFile * 0r '..fileTemplate)
end
