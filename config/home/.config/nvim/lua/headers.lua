local fileTemplate = os.getenv('NVIM_NEW_FILE_TEMPLATE')
if fileTemplate ~= nil then
  cmd('au BufNewFile * 0read '..fileTemplate)

  local api = require("nvim-tree.api")
  local Event = api.events.Event
  api.events.subscribe(Event.FileCreated, function(data)
    cmd('edit '..data.fname)
    cmd('0read '..fileTemplate)
  end)
end
