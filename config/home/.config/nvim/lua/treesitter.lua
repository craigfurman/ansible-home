local ensureInstalled = {
  "bash",
  "comment",
  "css",
  "gomod",
  "gomod",
  "hcl",
  "html",
  "json",
  "lua",
  "python",
  "ruby",
  "rust",
  "vim",
  "yaml",
}

for name, lang in pairs(langs) do
  if lang.treesitterParsers ~= nil then
    for i = 1, #lang.treesitterParsers do
      table.insert(ensureInstalled, lang.treesitterParsers[i])
    end
  else
    table.insert(ensureInstalled, lang.filetype)
  end
end

require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    disable = {},
  },
  -- TODO learn what this is
  -- indent = {
  --   enable = false,
  --   disable = {},
  -- },
  ensure_installed = ensureInstalled,
}
