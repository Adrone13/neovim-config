-- Linter configuration
function ConfigConform()
  local conform = require("conform")
  local format_on_save_config = {
    -- I recommend these options. See :help conform.format for details.
    lsp_fallback = true,
    timeout_ms = 500,
    -- async = false, -- If the buffer is modified before the formatter completes, the formatting will be discarded.
  }


  conform.setup({
    formatters_by_ft = {
      javascript = { "prettier" },
      typescript = { "prettier" },
      javascriptreact = { "prettier" },
      typescriptreact = { "prettier" },
      css = { "prettier" },
      html = { "prettier" },
      json = { "prettier" },
      go = { "goimports", "gofmt" },
      lua = { "stylua" }
    },
    format_on_save = format_on_save_config
  })

  vim.keymap.set({ "n", "v" }, "<leader>mp", function()
    conform.format(format_on_save_config)
  end, { desc = "Format file or range (in visual mode)" })
end
