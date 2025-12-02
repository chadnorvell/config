return {
  "stevearc/oil.nvim",
  lazy = false,
  dependencies = {
    "echasnovski/mini.icons",
  },
  config = function()
    -- Helper to parse output
    local function parse_output(proc)
      local result = proc:wait()
      local ret = {}

      if result.code == 0 then
        for line in vim.gsplit(result.stdout, "\n", { plain = true, trimempty = true }) do
          -- Remove trailing slash
          line = line:gsub("/$", "")
          ret[line] = true
        end
      end

      return ret
    end

    -- Build git status cache
    local function new_git_status()
      return setmetatable({}, {
        __index = function(self, key)
          local ignore_proc = vim.system({
            "git",
            "ls-files",
            "--ignored",
            "--exclude-standard",
            "--others",
            "--directory",
          }, {
            cwd = key,
            text = true,
          })

          local tracked_proc = vim.system({ "git", "ls-tree", "HEAD", "--name-only" }, {
            cwd = key,
            text = true,
          })

          local ret = {
            ignored = parse_output(ignore_proc),
            tracked = parse_output(tracked_proc),
          }

          rawset(self, key, ret)
          return ret
        end,
      })
    end

    local git_status = new_git_status()

    -- Clear git status cache on refresh
    local refresh = require("oil.actions").refresh
    local orig_refresh = refresh.callback
    refresh.callback = function(...)
      git_status = new_git_status()
      orig_refresh(...)
    end

    local show_detail = false

    require("oil").setup({
      keymaps = {
        ["gd"] = {
          desc = "Toggle file detail view",
          callback = function()
            show_detail = not show_detail

            if show_detail then
              require("oil").set_columns({ "icon", "permissions", "size", "mtime" })
            else
              require("oil").set_columns({ "icon" })
            end
          end,
        },
      },
      view_options = {
        -- Show hidden git files and hide git-ignored files
        is_hidden_file = function(name, bufnr)
          local dir = require("oil").get_current_dir(bufnr)
          local is_dotfile = vim.startswith(name, ".") and name ~= ".."

          -- If no local directory (e.g. for ssh connections), just hide dotfiles
          if not dir then
            return is_dotfile
          end

          -- Dot files are considered hidden unless tracked
          if is_dotfile then
            return not git_status[dir].tracked[name]
          else
            -- Check if file is gitignored
            return git_status[dir].ignored[name]
          end
        end,
      },
    })
  end,
  keys = {
    { "<leader>fb", "<cmd>Oil<cr>", desc = "browse" },
    {
      "<D-b>",
      function()
        require("oil").toggle_float()
      end,
      desc = "browse",
    },
  },
}
