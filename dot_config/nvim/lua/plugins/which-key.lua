-- Track visual selection lines so they survive which-key exiting visual mode
local saved_visual = {}
local visual_cursor_autocmd
vim.api.nvim_create_autocmd("ModeChanged", {
  callback = function()
    local m = vim.api.nvim_get_mode().mode
    if m == "v" or m == "V" or m == "\22" then
      saved_visual.line1 = vim.fn.line("v")
      saved_visual.line2 = vim.fn.line(".")
      if not visual_cursor_autocmd then
        visual_cursor_autocmd = vim.api.nvim_create_autocmd("CursorMoved", {
          callback = function()
            saved_visual.line1 = vim.fn.line("v")
            saved_visual.line2 = vim.fn.line(".")
          end,
        })
      end
    elseif visual_cursor_autocmd then
      vim.api.nvim_del_autocmd(visual_cursor_autocmd)
      visual_cursor_autocmd = nil
    end
  end,
})

return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    spec = {
      { "<leader>b", group = "buffers" },
      { "<leader>c", group = "code" },
      { "<leader>g", group = "git" },
      { "<leader>s", group = "search" },
      { "<leader>t", group = "tabs" },
      { "<leader>x", group = "diagnostics" },
      {
        "<leader>xl",
        function()
          vim.diagnostic.config({ virtual_lines = not vim.diagnostic.config().virtual_lines })
        end,
        desc = "toggle virtual lines",
      },
      {
        "<leader>xt",
        function()
          vim.diagnostic.config({ virtual_text = not vim.diagnostic.config().virtual_text })
        end,
        desc = "toggle virtual text",
      },

      { "<leader>f", group = "files" },
      { "<leader>fs", vim.cmd.w, desc = "save" },

      { "<leader>l", group = "lazy" },
      {
        "<leader>lc",
        function()
          require("lazy").check()
        end,
        desc = "check",
      },
      {
        "<leader>li",
        function()
          require("lazy").install()
        end,
        desc = "install",
      },
      {
        "<leader>ll",
        function()
          require("lazy").home()
        end,
        desc = "home",
      },
      {
        "<leader>ls",
        function()
          require("lazy").sync()
        end,
        desc = "sync",
      },
      {
        "<leader>lu",
        function()
          require("lazy").update()
        end,
        desc = "update",
      },
      {
        "<leader>lx",
        function()
          require("lazy").clean()
        end,
        desc = "clean",
      },

      { "<leader>q", group = "quit" },
      { "<leader>qa", vim.cmd.qa, desc = "all" },

      { "<leader>u", group = "ui" },
      { "<leader>uc", group = "color scheme" },

      {
        -- Write a devlog entry, in normal mode
        "<leader>d",
        function()
          local root = vim.trim(vim.fn.system("git rev-parse --show-toplevel"))
          local in_git = vim.v.shell_error == 0
          local project = in_git and vim.fn.fnamemodify(root, ":t") or nil
          local prompt = project and ("Devlog (" .. project .. "): ") or "Devlog: "
          vim.ui.input({ prompt = prompt }, function(input)
            if not input or input == "" then
              return
            end
            local cmd = { "devlog", "-m", input }
            if project then
              vim.list_extend(cmd, { "-p", project })
            end
            vim.fn.system(cmd)
            if vim.v.shell_error ~= 0 then
              vim.notify("devlog failed", vim.log.levels.ERROR)
            else
              vim.notify("Devlog entry added", vim.log.levels.INFO)
            end
          end)
        end,
        desc = "devlog",
      },
      {
        -- Write a devlog entry, in visual mode, including selected text
        "<leader>d",
        function()
          local root = vim.trim(vim.fn.system("git rev-parse --show-toplevel"))
          local in_git = vim.v.shell_error == 0
          local project = in_git and vim.fn.fnamemodify(root, ":t") or nil
          local filepath = vim.fn.expand("%:p")
          local file_prefix
          if in_git then
            file_prefix = "@" .. filepath:sub(#root + 2)
          else
            file_prefix = filepath
          end

          local line1 = saved_visual.line1 or vim.fn.line("'<")
          local line2 = saved_visual.line2 or vim.fn.line("'>")
          if line1 > line2 then
            line1, line2 = line2, line1
          end

          local selected = vim.api.nvim_buf_get_lines(0, line1 - 1, line2, false)
          local ref
          if line1 == line2 then
            ref = file_prefix .. " line " .. line1
          else
            ref = file_prefix .. " lines " .. line1 .. "-" .. line2
          end

          local content = { "", "", ref, "```" }
          vim.list_extend(content, selected)
          table.insert(content, "```")

          local buf = vim.api.nvim_create_buf(false, true)
          vim.api.nvim_buf_set_lines(buf, 0, -1, false, content)
          vim.bo[buf].bufhidden = "wipe"

          local title_label = project and ("Devlog (" .. project .. ")") or "Devlog"
          local width = math.min(80, vim.o.columns - 4)
          local height = math.min(#content + 2, math.floor(vim.o.lines * 0.5))
          local win = vim.api.nvim_open_win(buf, true, {
            relative = "editor",
            width = width,
            height = height,
            row = math.floor((vim.o.lines - height) / 2),
            col = math.floor((vim.o.columns - width) / 2),
            style = "minimal",
            border = "rounded",
            title = " " .. title_label .. " - w to submit, q to cancel ",
            title_pos = "center",
          })

          vim.api.nvim_win_set_cursor(win, { 1, 0 })
          vim.cmd("startinsert")

          local function submit()
            local lines = vim.api.nvim_buf_get_lines(buf, 0, -1, false)
            local message = vim.trim(table.concat(lines, "\n"))
            if vim.api.nvim_win_is_valid(win) then
              vim.api.nvim_win_close(win, true)
            end
            if message == "" then
              return
            end
            local cmd = { "devlog", "-m", message }
            if project then
              vim.list_extend(cmd, { "-p", project })
            end
            vim.fn.system(cmd)
            if vim.v.shell_error ~= 0 then
              vim.notify("devlog failed", vim.log.levels.ERROR)
            else
              vim.notify("Devlog entry added", vim.log.levels.INFO)
            end
          end

          vim.keymap.set("n", "w", submit, { buffer = buf })

          vim.keymap.set("n", "q", function()
            if vim.api.nvim_win_is_valid(win) then
              vim.api.nvim_win_close(win, true)
            end
          end, { buffer = buf })
        end,
        mode = "v",
        desc = "devlog",
      },

      {
        -- Yank the file path and cursor line number, in normal mode
        "<leader>cy",
        function()
          local root = vim.trim(vim.fn.system("git rev-parse --show-toplevel"))
          local filepath = vim.fn.expand("%:p")
          local prefix
          if vim.v.shell_error == 0 then
            prefix = "@" .. filepath:sub(#root + 2)
          else
            prefix = filepath
          end
          local text = prefix .. " line " .. vim.fn.line(".")
          vim.fn.setreg("+", text)
          vim.notify("Copied: " .. text)
        end,
        desc = "yank line ref",
      },
      {
        -- Yank the file path and selected line numbers, in visual mode
        "<leader>cy",
        function()
          local root = vim.trim(vim.fn.system("git rev-parse --show-toplevel"))
          local filepath = vim.fn.expand("%:p")
          local prefix
          if vim.v.shell_error == 0 then
            prefix = "@" .. filepath:sub(#root + 2)
          else
            prefix = filepath
          end
          local line1 = saved_visual.line1 or vim.fn.line("'<")
          local line2 = saved_visual.line2 or vim.fn.line("'>")
          if line1 > line2 then
            line1, line2 = line2, line1
          end
          local text
          if line1 == line2 then
            text = prefix .. " line " .. line1
          else
            text = prefix .. " lines " .. line1 .. "-" .. line2
          end
          vim.fn.setreg("+", text)
          vim.notify("Copied: " .. text)
        end,
        mode = "v",
        desc = "yank line ref",
      },

      { "<leader>H", vim.cmd.noh, desc = "clear highlight" },
    },
  },
  keys = {
    {
      "<leader>!",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "which key",
    },
    {
      "<leader>w",
      function()
        require("which-key").show({ keys = "<c-w>", loop = true })
      end,
      desc = "windows",
    },
  },
}
