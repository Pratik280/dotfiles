call plug#begin()
Plug 'martinsione/darkplus.nvim'
Plug 'nvim-lualine/lualine.nvim'
Plug 'tpope/vim-surround'
Plug 'alvan/vim-closetag'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-commentary'
Plug 'lambdalisue/fern.vim'
Plug 'Shatur/neovim-ayu'
Plug 'catppuccin/nvim'
"Plug 'christianchiarulli/nvcode-color-schemes.vim' " nvcode onedark nord aurora 
"Plug 'Mofiqul/dracula.nvim'
"Plug 'catppuccin/nvim', {'as': 'catppuccin'}
"Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
"Plug 'vimwiki/vimwiki'
"Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
"Plug 'junegunn/goyo.vim'
call plug#end()

" -------------------- colortheme -------------------
"let g:catppuccin_flavour = "macchiato" " latte, frappe, macchiato, mocha
if (has("termguicolors"))
 set termguicolors
endif
let g:nvcode_termcolors=256
colorscheme catppuccin-mocha " catppuccin-latte, catppuccin-frappe, catppuccin-macchiato, catppuccin-mocha
syntax on
hi Normal guibg=none ctermbg=none
hi LineNr guibg=none ctermbg=none
hi Folded guibg=none ctermbg=none
hi NonText guibg=none ctermbg=none
hi SpecialKey guibg=none ctermbg=none
hi VertSplit guibg=none ctermbg=none
hi SignColumn guibg=none ctermbg=none
hi EndOfBuffer guibg=none ctermbg=none
highlight Normal ctermbg=none guibg=none
highlight NonText ctermbg=none guibg=none
" -------------------- general settings -------------------
set number
syntax enable
set smartcase
set ignorecase
set relativenumber
set nu
set cursorline
set completeopt=menuone,noinsert,noselect
set path+=**			        " Searches current directory recursively.
set t_Co=256                    " Set if term supports 256 colors.
set clipboard=unnamedplus       " Copy/paste between vim and other programs.
set nuw=5                       " number width
set hidden
set nohlsearch                  " 
set incsearch                   " increments highlights for searching word while typing
set scrolloff=8                 
set signcolumn=no               " extra column before number for linting error
" set colorcolumn=80            " a line at 80
set cursorline
set mouse=a                             " Enable your mouse
set splitbelow                          " Horizontal splits will automatically be below
set splitright                          " Vertical splits will automatically be to the right
set updatetime=300                      " Faster completion
set timeoutlen=500                      " By default timeoutlen is 1000 ms
set formatoptions-=cro                  " Stop newline continution of comments
set formatoptions-=ro        "disbales next line auto comment
set noswapfile                "set no swap file
set nowrap
set expandtab                   " Use spaces instead of tabs.
set smarttab                    " Be smart using tabs ;)
set shiftwidth=2                " One tab == four spaces.
set tabstop=2                   " One tab == four spaces.
let g:vimwiki_list = [{'path': '~/00MAIN/00MAIN/vimwiki/' }]

" -------------------- keymaps -------------------
set timeoutlen=500
" Setting <Leader> to Spacebar button
let g:mapleader = "\<Space>"
" Use alt + hjkl to resize windows
nnoremap <M-j>    :resize -2<CR>
nnoremap <M-k>    :resize +2<CR>
nnoremap <M-l>    :vertical resize -2<CR>
nnoremap <M-h>    :vertical resize +2<CR>
" I hate escape more than anything else
inoremap jk <Esc>
inoremap kj <Esc>
" makes capital copy line from cursor till end
nnoremap Y yg$
" Better tabbing
vnoremap < <gv
vnoremap > >gv
" Better window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-s> :w<CR>
" Searched word will appear in middle of screen
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z
" select and move up down shift + J/K
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
" maximize minimize splits using cltr+W M/m
nnoremap <C-W>M <C-W>\| <C-W>_
nnoremap <C-W>m <C-W>=
" x will only cut but not keep in clipboard
noremap x "_x

" -------------------- statusline -------------------
lua << END
require('lualine').setup()
END

" -------------------- treesitter -------------------
"
"lua << EOF
"require'nvim-treesitter.configs'.setup {
"  ensure_installed = "all", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
"  highlight = {
"    enable = true,              -- false will disable the whole extension
"    disable = { "c", "rust" },  -- list of language that will be disabled
"  },
"}
"EOF

" ------------------ MarkdowmPreview Setting ----------------- 
" let g:mkdp_auto_start = 1 "1 : preview opens when mkdown buffer is opened in vim
let g:mkdp_refresh_slow = 1 "1 : will not live update

" ------------ close tag Setting ------------------- 
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.js,*.jsx,*.ts,*.tsx'
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx,*.js,*.ts,*.tsx'
let g:closetag_filetypes = 'html,xhtml,phtml,js,jsx,ts,tsx'
let g:closetag_xhtml_filetypes = 'xhtml,jsx,ts,tsx,js,jsx'
let g:closetag_emptyTags_caseSensitive = 1
let g:closetag_regions = {
      \ 'typescript.tsx': 'jsxRegion,tsxRegion',
      \ 'javascript.jsx': 'jsxRegion',
      \ 'typescriptreact': 'jsxRegion,tsxRegion',
      \ 'javascriptreact': 'jsxRegion',
      \ }
let g:closetag_shortcut = '>'
let g:closetag_close_shortcut = '<leader>>'

" ------------------ Tree Setting ----------------- 

let g:fern#disable_default_mappings = 1

let g:fern#drawer_width = 40
let g:fern#default_hidden = 1
let g:fern#disable_drawer_auto_quit = 1

" noremap <silent> <C-b> :Fern . -drawer -reveal=% -toggle -width=40<CR><C-w>=
noremap <leader>e :Fern . -right -drawer -reveal=% -toggle -width=40<CR><C-w>=
      
function! s:init_fern() abort
  nmap <buffer><expr>
      \ <Plug>(fern-my-expand-or-collapse)
      \ fern#smart#leaf(
      \   "\<Plug>(fern-action-collapse)",
      \   "\<Plug>(fern-action-expand)",
      \   "\<Plug>(fern-action-collapse)",
      \ )
  nmap <buffer><nowait> l <Plug>(fern-my-expand-or-collapse)
  nmap <buffer> o <Plug>(fern-action-open:edit)
  nmap <buffer> H <Plug>(fern-action-open:split)
  nmap <buffer> V <Plug>(fern-action-open:vsplit)
  nmap <buffer> R <Plug>(fern-action-rename)
	nmap <buffer> M <Plug>(fern-action-move)
	nmap <buffer> C <Plug>(fern-action-copy)
	nmap <buffer> N <Plug>(fern-action-new-path)
	" nmap <buffer> T <Plug>(fern-action-new-file)
	nmap <buffer> F <Plug>(fern-action-new-file)
	nmap <buffer> D <Plug>(fern-action-new-dir)
	nmap <buffer> S <Plug>(fern-action-hidden-toggle)
  nmap <buffer> r <Plug>(fern-action-reload)
  nmap <buffer> dd <Plug>(fern-action-remove)
  nmap <buffer> <leader> <Plug>(fern-action-mark)
  nmap <buffer><nowait> < <Plug>(fern-action-leave)
  nmap <buffer><nowait> > <Plug>(fern-action-enter)
endfunction

augroup fern-custom
  autocmd! *
  autocmd FileType fern setlocal norelativenumber | setlocal nonumber | call s:init_fern()
augroup END

let g:fern#renderer = "nerdfont"

" Disable netrw.
let g:loaded_netrw  = 1
let g:loaded_netrwPlugin = 1
let g:loaded_netrwSettings = 1
let g:loaded_netrwFileHandlers = 1

augroup my-fern-hijack
  autocmd!
  autocmd BufEnter * ++nested call s:hijack_directory()
augroup END

function! s:hijack_directory() abort
  let path = expand('%:p')
  if !isdirectory(path)
    return
  endif
  bwipeout %
  execute printf('Fern %s', fnameescape(path))
endfunction
