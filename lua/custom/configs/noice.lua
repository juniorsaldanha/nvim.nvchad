local present, noice = pcall(require, "noice")
if not present then
  print "Not found noice package"
  require("custom.function.plugin").notify_missing_plugin "noice"
  return
end

noice.setup {
  lsp = {
    hover = {
      enabled = false,
    },
    signature = {
      enabled = false,
    },
    override = {
      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      ["vim.lsp.util.stylize_markdown"] = true,
      ["cmp.entry.get_documentation"] = true,
    },
  },
  -- -- you can enable a preset for easier configuration
  presets = {
    bottom_search = true, -- use a classic bottom cmdline for search
    command_palette = true, -- position the cmdline and popupmenu together
    long_message_to_split = true, -- long messages will be sent to a split
    inc_rename = false, -- enables an input dialog for inc-rename.nvim
    lsp_doc_border = false, -- add a border to hover docs and signature help
  },
  format = {
    level = {
      icons = {
        error = "✖",
        warn = "▼",
        info = "●",
      },
    },
  },
  popupmenu = {
    kind_icons = false,
  },
  inc_rename = {
    cmdline = {
      format = {
        IncRename = { icon = "⟳" },
      },
    },
  },
  routes = {
    filter = {
      event = "msg_show",
      any = {
        { find = "%d+L, %d+B" },
        { find = "; after #%d+" },
        { find = "; before #%d+" },
        { find = "%d fewer lines" },
        { find = "%d more lines" },
        { find = "written" },
      },
    },
    opts = { skip = true },
  },
}
