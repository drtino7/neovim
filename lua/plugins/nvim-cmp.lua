-- NOTE: Completion Engine
return {
  "hrsh7th/nvim-cmp",
  event = { "InsertEnter", "CmdlineEnter" },
  opts = function()
    local cmp = require "cmp"
    cmp.setup.cmdline(":", {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = "cmdline" },
      },
    })
  end,
  config = function(_, opts)
    table.insert(opts.sources, 2, { name = "codeium" })
    opts.mapping = vim.tbl_extend("force", {}, opts.mapping, {
      
      -- You can add here new mappings.
    })

    local luasnip = require "luasnip"
    luasnip.filetype_extend("javascriptreact", { "html" })
    luasnip.filetype_extend("typescriptreact", { "html" })
    luasnip.filetype_extend("svelte", { "html" })
    luasnip.filetype_extend("vue", { "html" })

    opts.completion["completeopt"] = "menu,menuone,noselect" -- disable autoselect
    require("cmp").setup(opts)
  end,
  dependencies = {
    {
      "saecki/crates.nvim",
      tag = "v0.4.0",
      opts = {},
    },
    -- Commandline completions
    {
      "hrsh7th/cmp-cmdline",
    },
    -- AI Autocomplete
{
  "Exafunction/codeium.nvim",
  opts = {
    -- Configuration options for codeium.nvim
    -- For example:
     enable = true,
    theme = "onedark",
     width = 80,
     height = 25,
     position = "top",
     border = "single",
     opacity = 90,
    -- etc.
  },
},




    {
      "L3MON4D3/LuaSnip",
      dependencies = "rafamadriz/friendly-snippets",
    },
  },
}
