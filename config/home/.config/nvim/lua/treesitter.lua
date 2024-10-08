local ensureInstalled = {
  "comment",
  "cpp",
  "css",
  "gomod",
  "html",
  "json",
  "lua",

  -- Needed for Lspsaga hover_doc
  "markdown",
  "markdown_inline",

  "python",
  "ruby",
  "rust",
  "vim",
  "vimdoc",
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
  ensure_installed = ensureInstalled,
  rainbow = {
    enable = true,
    extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = nil, -- Do not enable for files with more than n lines, int
    -- colors = {}, -- table of hex strings
    -- termcolors = {} -- table of colour name strings
  }
}
