local M = {}

M.lazygit = {
  n = {
    ["<leader>gg"] = { ":LazyGit<CR>", "open LazyGit" },
  },
}

M.refactoring = {
  v = {
    ["<leader>rr"] = {
      ":lua require('refactoring').select_refactor()<CR>",
      "Refactor",
      opts = { noremap = true, silent = true, expr = false },
    },
  },
}

return M
