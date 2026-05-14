vim.g.mapleader = " "

--------------------------------------------------
-- BASIC SETTINGS
--------------------------------------------------
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.termguicolors = true
vim.opt.clipboard = "unnamedplus"
vim.opt.splitright = true

--------------------------------------------------
-- LAZY.NVIM
--------------------------------------------------
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "https://github.com/folke/lazy.nvim.git",
        lazypath,
    })
end

vim.opt.rtp:prepend(lazypath)

--------------------------------------------------
-- PLUGINS
--------------------------------------------------
require("lazy").setup({

    --------------------------------------------------
    -- DASHBOARD HOME PAGE
    --------------------------------------------------

    {
        "nvimdev/dashboard-nvim",

        event = "VimEnter",

        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },

        config = function()
            require("dashboard").setup({
                theme = "doom",

                config = {
                    header = {
                        "",
                        "   Pratik Dev Environment",
                        "",
                    },

                    center = {
                        {
                            icon = "󰈞 ",
                            desc = "Recent Files",
                            action = "Telescope oldfiles",
                            key = "r",
                        },

                        {
                            icon = "  ",
                            desc = "Projects",
                            action = "Telescope projects",
                            key = "p",
                        },

                        {
                            icon = "  ",
                            desc = "New File",
                            action = "ene",
                            key = "n",
                        },

                        {
                            icon = "  ",
                            desc = "Neovim Config",
                            group = "@property",
                            action = "edit ~/.config/nvim/init.lua",
                            key = "c",
                        },

                        {
                            icon = "  ",
                            desc = "Find Files",
                            group = "Label",
                            action = "Telescope find_files",
                            key = "f",
                        },

                        {
                            icon = "  ",
                            desc = "Quit",
                            action = "qa",
                            key = "q",
                        },
                    },

                    footer = {
                        "",
                        "Linux • Neovim • Vimwiki",
                    },
                },
            })
        end,
    },

    --------------------------------------------------
    -- TELESCOPE FUZZY FIND
    --------------------------------------------------
    {
        "nvim-telescope/telescope.nvim",

        dependencies = {
            "nvim-lua/plenary.nvim",
        },

        config = function()
            local telescope = require("telescope")
            local actions = require("telescope.actions")

            telescope.setup({
                defaults = {
                    mappings = {
                        i = {
                            ["<C-j>"] = actions.move_selection_next,
                            ["<C-k>"] = actions.move_selection_previous,
                        },
                    },
                },
            })
        end,
    },

    --------------------------------------------------
    -- PROJECT
    --------------------------------------------------
    {
        "ahmedkhalf/project.nvim",

        config = function()
            require("project_nvim").setup()
        end,
    },

    --------------------------------------------------
    -- FILE EXPLORER
    --------------------------------------------------
    {
        "nvim-tree/nvim-tree.lua",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },

        config = function()
            require("nvim-tree").setup({
                view = {
                    side = "right",
                    width = 35,
                },
            })
            vim.keymap.set(
            "n",
            "<leader>e",
            ":NvimTreeToggle<CR>",
            { silent = true }
        )
        end,
    },

    --------------------------------------------------
    -- TREESITTER
    --------------------------------------------------

    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",

        config = function()
            require("nvim-treesitter").setup({
                ensure_installed = {
                    "lua",
                    "java",
                    "markdown",
                    "markdown_inline",
                    "bash",
                    "json",
                    "yaml",
                    "html",
                    "css",
                },

                highlight = {
                    enable = true,
                },
            })
        end,
    },

    --------------------------------------------------
    -- AUTOPAIRS
    --------------------------------------------------
    {
        "windwp/nvim-autopairs",

        config = function()
            require("nvim-autopairs").setup()
        end,
    },

    --------------------------------------------------
    -- COMMENTS
    --------------------------------------------------
    {
        "numToStr/Comment.nvim",

        config = function()
            require("Comment").setup()
        end,
    },

    --------------------------------------------------
    -- VSCODE THEME
    --------------------------------------------------
    {
        "Mofiqul/vscode.nvim",

        config = function()
            require("vscode").setup({
                transparent = true,
            })

            vim.cmd.colorscheme("vscode")
        end,
    },

    --------------------------------------------------
    -- VIM WIKI
    --------------------------------------------------
    {
        "vimwiki/vimwiki",

        init = function()
            vim.g.vimwiki_list = {
                {
                    path = "~/repos/pratik280.github.io/vimwiki/",
                    syntax = "default",
                    ext = ".wiki",

                    path_html = "~/repos/pratik280.github.io/",
                    custom_wiki2html = "",
                    template_path = "~/repos/pratik280.github.io/templates/",
                    template_default = "default",
                    template_ext = ".tpl",
                    diary_rel_path = "",
                },
                {
                    path = "~/repos/diary_wiki/vimwiki/",
                    syntax = "default",
                    ext = ".wiki",

                    path_html = "~/repos/diary_wiki/",
                    custom_wiki2html = "",
                    template_path = "~/repos/diary_wiki/templates/",
                    template_default = "default",
                    template_ext = ".tpl",
                    diary_rel_path = "diary/",
                    diary_index = "diary",
                    diary_header = "Diary",
                }
            }

            vim.g.vimwiki_global_ext = 0
        end,
    },
    --------------------------------------------------
    -- STATUS BAR
    --------------------------------------------------
    {
        "nvim-lualine/lualine.nvim",

        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },

        config = function()
            require("lualine").setup({
                options = {
                    theme = "auto",
                    section_separators = "",
                    component_separators = "",
                    globalstatus = true,
                },
            })
        end,
    },

})


--------------------------------------------------
-- DIARY TEMPLATE
--------------------------------------------------
vim.api.nvim_create_autocmd("BufNewFile", {
    pattern = "*/diary_wiki/vimwiki/diary/*.wiki",
    callback = function()
        local lines = {
            "= " .. vim.fn.expand("%:t:r") .. " =",
            "",
            "== 🌅 Morning Intentions ==",
            "* ",
            "",
            "== ✅ TODOs ==",
            "* [ ] ",
            "* [ ] ",
            "* [ ] ",
            "",
            "== 📋 Daily Log ==",
            "",
            "=== 💼 Office ===",
            "* ",
            "",
            "=== 🏠 Personal ===",
            "* ",
            "",
            "=== 📚 Learning ===",
            "* ",
            "",
            "== 💡 Notes & Ideas ==",
            "",
            "== 🌙 Evening Reflection ==",
            "* *What went well:* ",
            "* *What could be better:* ",
            "* *Grateful for:* ",
        }
        vim.api.nvim_buf_set_lines(0, 0, -1, false, lines)
    end,
})

--------------------------------------------------
-- SHORTCUTS
--------------------------------------------------

vim.keymap.set("n", "<C-s>", ":w<CR>", { silent = true })
vim.keymap.set("n", "<C-q>", ":q<CR>", { silent = true })
vim.keymap.set("n", "<C-h>", "<C-w>h", { silent = true })
vim.keymap.set("n", "<C-l>", "<C-w>l", { silent = true })
vim.keymap.set("n", "<C-j>", "<C-w>j", { silent = true })
vim.keymap.set("n", "<C-k>", "<C-w>k", { silent = true })
vim.keymap.set( "n", "<leader>e", ":NvimTreeToggle<CR>", { silent = true })
vim.keymap.set("n", "<leader>/", "gcc", { remap = true })
vim.keymap.set("v", "<leader>/", "gc", { remap = true })
vim.keymap.set("n", "<leader>ww", ":VimwikiIndex<CR>", { silent = true })
vim.keymap.set("n", "<leader>wt", ":VimwikiTabIndex<CR>", { silent = true })
vim.keymap.set("n", "<leader>w1", "<cmd>VimwikiIndex 1<CR>")
vim.keymap.set("n", "<leader>w2", "<cmd>VimwikiIndex 2<CR>")

local builtin = require("telescope.builtin")

vim.keymap.set("n", "<leader>ff", builtin.find_files, {}) -- leader + ff : find files
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})  -- leader + fg : search text across entire project
vim.keymap.set("n", "<leader>fb", builtin.buffers, {})    -- leader + fb : switch between opened files / buffers
vim.keymap.set("n", "<leader>fr", builtin.oldfiles, {})   -- leader + fr : recent files

--------------------------------------------------
-- ENABLE SYNTAX
--------------------------------------------------
vim.cmd("syntax on")
