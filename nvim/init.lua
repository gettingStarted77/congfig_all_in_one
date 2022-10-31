-------- BASIC ---------
require "basic.options"
require "basic.colorscheme"

------- PLUGINS --------
require "plugins"

---------- UI ----------
require "ui"

----- LSP AND CODE -----
require "code"
require "lsp"

-------- BASIC ---------
require "basic.keymaps"
local rt = require("rust-tools")

rt.setup({
  server = {
    on_attach = function(_, bufnr)
      -- Hover actions
      vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
      -- Code action groups
      vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
      vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>lf", "<cmd>lua vim.lsp.buf.format {async = true}<cr>", {noremap = true, silent = false})
      vim.keymap.set('n', 'ml', function()
        print("asdf")
      end)
    end,
  },
})
