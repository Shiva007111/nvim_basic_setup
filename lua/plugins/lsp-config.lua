local on_attach = function(_, bufnr)
  local map = function(mode, lhs, rhs, desc)
    vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
  end

  -- LSP keybindings
  map("n", "gd", vim.lsp.buf.definition, "[G]oto [D]efinition")
  map("n", "gr", vim.lsp.buf.references, "[G]oto [R]eferences")
  map("n", "gi", vim.lsp.buf.implementation, "[G]oto [I]mplementation")
  map("n", "K", vim.lsp.buf.hover, "Hover Documentation")
  map("n", "<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
  map("n", "<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
  map("n", "<leader>f", function() vim.lsp.buf.format { async = true } end, "[F]ormat")

  -- Diagnostic navigation
  map("n", "[d", vim.diagnostic.goto_prev, "Previous Diagnostic")
  map("n", "]d", vim.diagnostic.goto_next, "Next Diagnostic")
  map("n", "<leader>e", vim.diagnostic.open_float, "Show Diagnostic")
end

return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      -- Lua
      local util = require("lspconfig.util")
      lspconfig.lua_ls.setup {
        cmd = { vim.fn.expand("~") .. "/workspace/practice/lua-language-server/bin/lua-language-server" },
        capabilities = capabilities,
        on_attach = on_attach,
        root_dir = util.root_pattern(".git", "init.lua", ".nvim-root"),
        settings = {
          Lua = {
            runtime = { version = "LuaJIT" },
            diagnostics = { globals = { "vim" } },
            workspace = {
              library = vim.api.nvim_get_runtime_file("", true),
              checkThirdParty = false,
            },
            telemetry = { enable = false },
          },
        },
      }

      -- Python
      lspconfig.pyright.setup {
        capabilities = capabilities,
        on_attach = on_attach
      }

      -- JavaScript / TypeScript
      lspconfig.ts_ls.setup {
        capabilities = capabilities,
        on_attach = on_attach
      }

      -- Ruby
      lspconfig.solargraph.setup {
        capabilities = capabilities,
        on_attach = on_attach
      }
    end,
  }
}

