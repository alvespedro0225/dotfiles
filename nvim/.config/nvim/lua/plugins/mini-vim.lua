local function get_bytes(bytes)
  if type(bytes) ~= "number" then
    return ""
  end

  local units = { "B", "KiB", "MiB", "GiB" }
  local count = 1
  while bytes > 1024 do
    bytes = bytes / 1024
    count = count + 1
  end
  if count == 1 then
    return string.format("%d%s", bytes, units[count])
  else
    return string.format("%.2f%s", bytes, units[count])
  end
end

local icons = {
  lua = "",
  rust = "",
  c = "",
  cs = "",
  python = "",
  typescript = "",
  javascript = "",
  go = "",
}

local function get_file_info()
  local bar = {}
  local file_type = ""
  local extension = vim.bo.filetype

  local icon = icons[extension]

  if icon ~= nil then
    file_type = icon
  elseif extension ~= nil and extension ~= "" then
    file_type = extension
  end

  if file_type ~= nil and file_type ~= "" then
    bar[#bar + 1] = file_type
  end

  local encoding = vim.bo.fileencoding or vim.bo.encoding

  if encoding ~= nil and encoding ~= "" then
    bar[#bar + 1] = encoding
  end

  local format = vim.bo.fileformat

  if format == "unix" then
    bar[#bar + 1] = ""
  elseif format ~= nil and format ~= "" then
    bar[#bar + 1] = format
  end

  local bytes = get_bytes(vim.fn.wordcount().bytes)

  if bytes ~= "" then
    bar[#bar + 1] = bytes
  end
  return vim.fn.join(bar, " | ")
end

return {
  "nvim-mini/mini.nvim",
  version = false,
  config = function()
    require("mini.surround").setup {}
    local statusline = require "mini.statusline"
    statusline.setup { use_icons = vim.g.have_nerd_font }

    ---@diagnostic disable-next-line: duplicate-set-field
    statusline.section_location = function()
      return "%2l:%-2v"
    end

    ---@diagnostic disable-next-line: duplicate-set-field
    statusline.section_fileinfo = get_file_info
  end,
}
