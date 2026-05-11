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
                "vim",
                "java",
                "javascript",
                "json",
                "bash",
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
            vim.cmd.colorscheme("vscode")
            -- vim.cmd.colorscheme("habamax")
        end,
    },

    --------------------------------------------------
    -- VSCODE THEME
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
            }
        }

        vim.g.vimwiki_global_ext = 0
    end,
},

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

--------------------------------------------------
-- ENABLE SYNTAX
--------------------------------------------------
vim.cmd("syntax on")
