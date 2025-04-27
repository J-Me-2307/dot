return {
  "saghen/blink.cmp",
  dependencies = "rafamadriz/friendly-snippets",
  version = "*",

  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    keymap = {
      preset = "none",
      ["<Tab>"] = { "select_next", "fallback" },
      ["<S-Tab>"] = { "select_prev", "fallback" },
      ["<enter>"] = { "accept", "fallback" },
    },
    sources = {
      default = { "lsp", "path", "snippets" },
    },
    cmdline = {
      enabled = false,
      sources = {},
      keymap = {},
    },
    completion = {
      ghost_text = { enabled = true },
      menu = {
        border = "rounded",
        scrollbar = false,
        draw = {
          columns = {
            { "label", "label_description", gap = 1 },
            { "kind_icon", "kind", gap = 1 },
          },
        },
      },
      documentation = { auto_show = true, auto_show_delay_ms = 500 },
    },
  },
}
