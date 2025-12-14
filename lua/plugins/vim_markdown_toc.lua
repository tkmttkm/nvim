return {
  "mzlogin/vim-markdown-toc",
  ft = { "markdown" },
  cmd = { "GenTocGFM", "GenTocRedcarpet", "GenTocGitLab", "UpdateToc" },
  init = function()
    -- 見出しを連番にする
    vim.g.vmt_auto_numbering = 1
  end,
}
