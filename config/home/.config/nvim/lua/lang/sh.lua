local filetype = 'sh'

local function setupLsp()
end

return {
  filetype = filetype,
  extensions = {},
  setupLsp = setupLsp,
  fileOpenCmds = {},
  preSaveCmds = {},
  efmCfg = {
    {
      formatCommand = "shfmt -ci -i 2 -s",
      formatStdin = true
    },
    {
      lintCommand = "shellcheck -f gcc -x",
      lintSource = "shellcheck",
      lintFormats = {'%f:%l:%c: %trror: %m', '%f:%l:%c: %tarning: %m', '%f:%l:%c: %tote: %m'},
    },
  },
  treesitterParsers = {'bash'}
}
