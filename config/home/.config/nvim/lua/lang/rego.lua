local function setupLsp()
end

return {
  filetype = 'rego',
  extensions = {'rego'},
  setupLsp = setupLsp,
  fileOpenCmds = {'setlocal noexpandtab'},
  preSaveCmds = {},
}
