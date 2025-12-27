return {
  "nvim-telescope/telescope.nvim",
  tag = "v0.2.0",
  dependencies = { "nvim-lua/plenary.nvim", {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
  } },
  config = function()
    require("telescope").setup {
      extensions = "fzf",
    }

    local builtin = require "telescope.builtin"
    local map = vim.keymap.set
    map("n", "<leader>sh", builtin.help_tags, { desc = "[S]earch [H]elp" })
    map("n", "<leader>sk", builtin.keymaps, { desc = "[S]earch [K]eymaps" })
    map("n", "<leader>sf", builtin.find_files, { desc = "[S]earch [F]iles" })
    map("n", "<leader>ss", builtin.builtin, { desc = "[S]earch [S]elect Telescope" })
    map("n", "<leader>sw", builtin.grep_string, { desc = "[S]earch current [W]ord" })
    map("n", "<leader>sg", builtin.live_grep, { desc = "[S]earch by [G]rep" })
    map("n", "<leader>sd", builtin.diagnostics, { desc = "[S]earch [D]iagnostics" })
    map("n", "<leader>sr", builtin.resume, { desc = "[S]earch [R]esume" })
    map("n", "<leader>s.", builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
    map("n", "<leader><leader>", builtin.buffers, { desc = "[ ] Find existing buffers" })
    map("n", "grr", builtin.lsp_references, { desc = "[G]oto [R]eferences" })
    map("n", "gri", builtin.lsp_implementations, { desc = "[G]oto [I]mplementation" })
    map("n", "grd", builtin.lsp_definitions, { desc = "[G]oto [D]efinition" })
    map("n", "gO", builtin.lsp_document_symbols, { desc = "Open Document Symbols" })
    map("n", "gW", builtin.lsp_dynamic_workspace_symbols, { desc = "Open Workspace Symbols" })
    map("n", "grt", builtin.lsp_type_definitions, { desc = "[G]oto [T]ype Definition" })

    map("n", "<leader>/", function()
      builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown {
        winblend = 10,
        previewer = false,
      })
    end, { desc = "[/] Fuzzily search in current buffer" })

    map("n", "<leader>s/", function()
      builtin.live_grep {
        grep_open_files = true,
        prompt_title = "Live Grep in Open Files",
      }
    end, { desc = "[S]earch [/] in Open Files" })

    map("n", "<leader>sc", function()
      builtin.find_files { cwd = vim.fn.stdpath "config" }
    end, { desc = "[S]earch [C]onfig" })

    map("n", "<leader>sw", function()
      builtin.find_files { cwd = "~/code" }
    end, { desc = "[S]each Code" })

    require("telescope.multigrep").setup {}
  end,
}
