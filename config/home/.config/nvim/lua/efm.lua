local efmFiletypes = {}
local efmLangCfg = {}
for name, lang in pairs(langs) do
  if lang.efmCfg ~= nil then
    table.insert(efmFiletypes, lang.filetype)
    efmLangCfg[lang.filetype] = lang.efmCfg
  end
end
require('lspconfig').efm.setup{
  filetypes = efmFiletypes,

  cmd = {'efm-langserver'},
  -- Enable this for debugging
  -- cmd = {'efm-langserver', '-logfile', '/tmp/efm.log', '-loglevel', '5'},

  rootdir = vim.loop.cwd,
  init_options = {documentFormatting = true},
  settings = {
    rootMarkers = {".git/"},
    languages = efmLangCfg,
  },
}
