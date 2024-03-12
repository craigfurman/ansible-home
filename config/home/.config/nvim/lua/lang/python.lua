-- TODO formatting

local filetype = 'python'

local function setupLsp()
  require('lspconfig').pylsp.setup{}
end

return {
  filetype = filetype,
  extensions = {'py'},
  setupLsp = setupLsp,
  fileOpenCmds = {},
  preSaveCmds = {},
}
