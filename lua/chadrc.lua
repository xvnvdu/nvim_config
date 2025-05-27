-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

M.base46 = {
    theme = "ayu_dark",
    hl_override = {
        Type = { fg = "white" },
        TbBufOn = { bg = "grey" },
        Include = { fg = "white" },
        Boolean = { fg = "baby_pink" },
        TbBufOnClose = { bg = "grey" },
        NvDashAscii = { fg = "orange" },
        Normal = { bg = "darker_black" },
        TbFill = { bg = "darker_black" },
        CursorLineNr = { fg = "orange" },
        NvDashButtons = { fg = "orange" },
        TbBufOnModified = { bg = "grey" },
        TbBufOff = { bg = "darker_black" },
        NvimTreeWinSeparator = { fg = "line" },
        TbBufOffClose = { bg = "darker_black" },
        TbBufOffModified = { bg = "darker_black" },
        ["@module"] = { fg = "sun" },
        ["@keyword"] = { fg = "blue" },
        ["@string"] = { fg = "orange" },
        ["@variable"] = { fg = "white" },
        ["@type.builtin"] = { fg = "green" },
        ["@operator"] = { fg = "#b09e52" },
        ["@function"] = { fg = "nord_blue" },
        ["@keyword.function"] = { fg = "blue" },
        ["@function.call"] = { fg = "nord_blue" },
        ["@keyword.import"] = { fg = "baby_pink" },
        ["@keyword.return"] = { fg = "dark_purple" },
        ["@function.builtin"] = { fg = "nord_blue" },
        ["@keyword.repeat"] = { fg = "dark_purple" },
        ["@function.method.call"] = { fg = "nord_blue" },
        ["@keyword.conditional"] = { fg = "dark_purple" },
    },

    changed_themes = {
        ayu_dark = {
            base_30 = {
                darker_black = "#000000",
                orange = "#fe9233",
                baby_pink = "#fc76ac",
                blue = "#43b0e6",
                nord_blue = "#a1ddfa",
            },
            base_16 = {
                base05 = "#d4d3d0",
                base08 = "#d4d3d0",
            },
        },
    },
}

M.nvdash = {
    load_on_startup = true,
    header = {
        -- "_________________________________________________________________________________",
        "╔════════════════════════════════════════════════════════════════════════════════════╗",
        "║                                                                                    ║",
        "║  █████   ███   █████          ████                                                 ║",
        "║  ░███   ░███   ░███   ██████  ░███   ██████   ██████  █████████████    ██████      ║",
        "║  ░███   ░███   ░███  ███░░███ ░███  ███░░███ ███░░███░░███░░███░░███  ███░░███     ║",
        "║  ░░███  █████  ███  ░███████  ░███ ░███ ░░░ ░███ ░███ ░███ ░███ ░███ ░███████      ║",
        "║   ░░░█████░█████░   ░███░░░   ░███ ░███  ███░███ ░███ ░███ ░███ ░███ ░███░░░       ║",
        "║     ░░███ ░░███     ░░██████  █████░░██████ ░░██████  █████░███ █████░░██████  ██  ║",
        "║      ░░░   ░░░       ░░░░░░  ░░░░░  ░░░░░░   ░░░░░░  ░░░░░ ░░░ ░░░░░  ░░░░░░  ██   ║",
        "║                                                                              ░░    ║",
        "║                                                                                    ║",
        "║                                                        █████               ███     ║",
        "║                                                        ░░███              ░███     ║",
        "║      █████ █████ █████ █████ ████████   █████ █████  ███████  █████ ████  ░███     ║",
        "║     ░░███ ░░███ ░░███ ░░███ ░░███░░███ ░░███ ░░███  ███░░███ ░░███ ░███   ░███     ║",
        "║      ░░░█████░   ░███  ░███  ░███ ░███  ░███  ░███ ░███ ░███  ░███ ░███   ░███     ║",
        "║       ███░░░███  ░░███ ███   ░███ ░███  ░░███ ███  ░███ ░███  ░███ ░███   ░░░      ║",
        "║      █████ █████  ░░█████    ████ █████  ░░█████   ░░████████ ░░████████   ███     ║",
        "║     ░░░░░ ░░░░░    ░░░░░    ░░░░ ░░░░░    ░░░░░     ░░░░░░░░   ░░░░░░░░   ░░░      ║",
        "║                                                                                    ║",
        "╚════════════════════════════════════════════════════════════════════════════════════╝",
    },
    buttons = {
        { txt = " ", hl = "NvDashFooter", no_gap = true, rep = true },
        { txt = "  Find File", hl = "NvDashButtons", keys = "ff", cmd = "Telescope find_files" },
        { txt = "  Recent Files", keys = "fo", cmd = "Telescope oldfiles" },
        { txt = "󰈭  Find Word", keys = "fw", cmd = "Telescope live_grep" },
    },
}

M.ui = {
    statusline = {
        theme = "vscode",
        order = {
            "mode",
            "file",
            "git",
            "%=",
            "lsp_msg",
            "%=",
            "diagnostics",
            "lsp",
            "cursor",
            "where_am_i",
        },
        modules = {
            where_am_i = function()
                local cwd = vim.api.nvim_buf_get_name(0)
                local icon = " "

                if cwd == "/home/xvnvdu/NvimTree_1" then
                    api = require("nvim-tree.api")
                    cwd = api.tree.get_nodes().absolute_path
                    icon = " "
                end

                local display = vim.fn.fnamemodify(cwd, ":~")

                if display == "~" then
                    display = "~/"
                end

                return icon .. display .. " "
            end,
        },
    },
    nvimtree = {
        git = {
            enable = true,
            ignore = false,
        },
    },
}

return M
