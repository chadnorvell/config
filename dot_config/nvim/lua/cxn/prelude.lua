vim.opt.breakindent = true
vim.opt.confirm = true
vim.opt.cursorline = true
vim.opt.formatoptions:remove("ct")
vim.opt.ignorecase = true
vim.opt.inccommand = "split"
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
vim.opt.mouse = "a"
vim.opt.number = true
vim.opt.scrolloff = 10
vim.opt.showmode = false
vim.opt.signcolumn = "yes"
vim.opt.smartcase = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.timeoutlen = 300
vim.opt.undofile = true
vim.opt.updatetime = 250
vim.o.sessionoptions =
  "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
vim.g.have_nerd_font = true
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Use spaces for indentation, defaulting to 4 spaces
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smarttab = true

-- If there are tabs already, make it obvious
vim.opt.tabstop = 6
vim.opt.softtabstop = 0

-- Overrides for 2-space tab stop file formats
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = {
    "*.css",
    "*.ex",
    "*.exs",
    "*.nix",
    "*.rb",

    "*.js",
    "*.cjs",
    "*.mjs",
    "*.jsx",
    "*.ts",
    "*.cts",
    "*.mts",
    "*.tsx",
    "*.json",
    "*.jsonc",
  },
  callback = function()
    vim.opt_local.shiftwidth = 2
    vim.opt_local.tabstop = 3
  end,
})

vim.filetype.add({ extension = { fidl = "fidl" } })

-- TODO: This might be unnecessary in neovim 0.12
vim.api.nvim_create_autocmd("FileType", {
  callback = function(event)
    -- Wrap vim.treesitter.start() in pcall to avoid errors if a parser is missing or broken
    if pcall(vim.treesitter.start, event.buf) then
      -- Enable Treesitter highlighting (default behavior of vim.treesitter.start())

      -- Optional: Enable Treesitter folding
      -- vim.wo[event.buf].foldmethod = "expr"
      -- vim.wo[event.buf].foldexpr = "v:lua.vim.treesitter.foldexpr()"

      -- Optional: Enable Treesitter indentation
      vim.bo[event.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    else
      -- Fallback to default syntax highlighting if Treesitter can't start
      vim.bo[event.buf].syntax = "on"
    end
  end,
})

-- Share the system clipboard
-- Loaded async because otherwise it can increase startup time
vim.schedule(function()
  vim.opt.clipboard = "unnamedplus"
end)

vim.diagnostic.config({ signs = true })
