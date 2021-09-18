" ----------------------------------------------------------------------------------------------
" VIM PLUG 
" ----------------------------------------------------------------------------------------------
call plug#begin('~/.config/nvim/autoload/plugged')

" Nord Theme
" Plug 'arcticicestudio/nord-vim'

Plug 'shaunsingh/nord.nvim'

" Emmet
Plug 'mattn/emmet-vim'

" Javascript syntax highlight
Plug 'pangloss/vim-javascript'
" React syntax highlight
Plug 'MaxMEllon/vim-jsx-pretty'
" Typescript syntax hightlight
Plug 'HerringtonDarkholme/yats.vim'
" Another js syntax hightlight
"Plug 'yuezk/vim-js'

" Python Syntax
Plug 'kh3phr3n/python-syntax'

" Prettier
" Plug 'prettier/vim-prettier', { 'do': 'yarn install' }

" Closetag 
Plug 'tpope/vim-surround'
Plug 'alvan/vim-closetag'
Plug 'jiangmiao/auto-pairs'

" Comments
Plug 'tpope/vim-commentary'

" Vim Wiki
Plug 'vimwiki/vimwiki'

" Markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }

" Goyo
Plug 'junegunn/goyo.vim'

call plug#end()

" ----------------------------------------------------------------------------------------------
" THEME 
" ----------------------------------------------------------------------------------------------
"  Nord Theme configuraion
set termguicolors
colorscheme nord

" For Transparency
" au ColorScheme * hi Normal ctermbg=none guibg=none
" au ColorScheme myspecialcolors hi Normal ctermbg=red guibg=red

" ----------------------------------------------------------------------------------------------
" Markdown Preview 
" ----------------------------------------------------------------------------------------------

" let g:mkdp_auto_start = 1 "1 : preview opens when mkdown buffer is opened in vim
let g:mkdp_refresh_slow = 1 "1 : will not live update 

" ----------------------------------------------------------------------------------------------
" NETRW 
" ----------------------------------------------------------------------------------------------
" Netrw settings
let g:netrw_keepdir = 0
let g:netrw_winsize = 25
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_localcopydircmd = 'cp -r'
let g:netrw_browse_split=4

function! OpenToRight()
  :normal v
  let g:path=expand('%:p')
  execute 'q!'
  execute 'belowright vnew' g:path
  :normal <C-w>l
endfunction

function! OpenBelow()
  :normal v
  let g:path=expand('%:p')
  execute 'q!'
  execute 'belowright new' g:path
  :normal <C-w>l
endfunction

function! OpenTab()
  :normal v
  let g:path=expand('%:p')
  execute 'q!'
  execute 'tabedit' g:path
  :normal <C-w>l
endfunction

function! NetrwMappings()
  " Hack fix to make ctrl-l work properly
  noremap <buffer> <A-l> <C-w>l
  noremap <buffer> <C-l> <C-w>l
  noremap <silent> <C-b> :Lexplore<CR>
  noremap <silent> <A-f> :call ToggleNetrw()<CR>
  noremap <buffer> V :call OpenToRight()<cr>
  noremap <buffer> H :call OpenBelow()<cr>
  noremap <buffer> T :call OpenTab()<cr>
endfunction

augroup netrw_mappings
  autocmd!
  autocmd filetype netrw call NetrwMappings()
augroup END

" Allow for netrw to be toggled
function! ToggleNetrw()
  if g:NetrwIsOpen
    let i = bufnr("$")
    while (i >= 1)
      if (getbufvar(i, "&filetype") == "netrw")
        silent exe "bwipeout " . i
      endif
      let i-=1
    endwhile
    let g:NetrwIsOpen=0
  else
    let g:NetrwIsOpen=1
    silent Lexplore
  endif
endfunction

" Check before opening buffer on any file
function! NetrwOnBufferOpen()
  if exists('b:noNetrw')
    return
  endif
  call ToggleNetrw()
  setlocal statusline=/
endfun

" Close Netrw if it's the only buffer open
autocmd WinEnter * if winnr('$') == 1 && getbufvar(winbufnr(winnr()), "&filetype") == "netrw" || &buftype == 'quickfix' |q|endif

" Make netrw act like a project Draw
augroup ProjectDrawer
  autocmd!
  " Don't open Netrw
  autocmd VimEnter ~/.config/joplin/tmp/*,/tmp/calcurse*,~/.calcurse/notes/*,~/vimwiki/*,*/.git/COMMIT_EDITMSG let b:noNetrw=1
  autocmd VimEnter * :call NetrwOnBufferOpen()
augroup END

let g:NetrwIsOpen=0

" ----------------------------------------------------------------------------------------------
" STATUS LINE
" ----------------------------------------------------------------------------------------------

let g:currentmode={
      \ 'n'  : 'NORMAL ',
      \ 'v'  : 'VISUAL ',
      \ 'V'  : 'V·Line ',
      \ "\<C-V>" : 'V·Block ',
      \ 'i'  : 'INSERT ',
      \ 'R'  : 'R ',
      \ 'Rv' : 'V·Replace ',
      \ 'c'  : 'Command ',
      \}

set statusline=
set statusline+=%#DiffAdd#
set statusline+=\ %{toupper(g:currentmode[mode()])}
set statusline+=%#StatusLine#
"set statusline+=\ %M
set statusline+=\ %y
set statusline+=\ %r
set statusline+=\ %F
"set statusline+=%#CursorLineNr#
set statusline+=%=
set statusline+=%#DiffText#
set statusline+=\ %c:%l/%L
set statusline+=\ %p%%
set statusline+=\ [%n]

" ----------------------------------------------------------------------------------------------
" Emmet  
" ----------------------------------------------------------------------------------------------
let g:user_emmet_leader_key='<A-c>' " set emmet key to alt+c

" ----------------------------------------------------------------------------------------------
" CLOSED TAG 
" ----------------------------------------------------------------------------------------------

" filenames like *.xml, *.html, *.xhtml, ...
" These are the file extensions where this plugin is enabled.
"
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.js,*.jsx,*.ts,*.tsx'

" filenames like *.xml, *.xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx,*.js,*.ts,*.tsx'

" filetypes like xml, html, xhtml, ...
" These are the file types where this plugin is enabled.
"
let g:closetag_filetypes = 'html,xhtml,phtml,js,jsx,ts,tsx'

" filetypes like xml, xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filetypes = 'xhtml,jsx,ts,tsx,js,jsx'

" integer value [0|1]
" This will make the list of non-closing tags case-sensitive (e.g. `<Link>` will be closed while `<link>` won't.)
"
let g:closetag_emptyTags_caseSensitive = 1

" dict
" Disables auto-close if not in a "valid" region (based on filetype)
"
let g:closetag_regions = {
      \ 'typescript.tsx': 'jsxRegion,tsxRegion',
      \ 'javascript.jsx': 'jsxRegion',
      \ 'typescriptreact': 'jsxRegion,tsxRegion',
      \ 'javascriptreact': 'jsxRegion',
      \ }

" Shortcut for closing tags, default is '>'
"
let g:closetag_shortcut = '>'

" Add > at current position without closing the current tag, default is ''
"
let g:closetag_close_shortcut = '<leader>>'
" ----------------------------------------------------------------------------------------------
" General Settings 
" ----------------------------------------------------------------------------------------------

syntax enable
set smartcase
set ignorecase
set relativenumber
set nu
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
set mouse=a                             " Enable your mouse
set splitbelow                          " Horizontal splits will automatically be below
set splitright                          " Vertical splits will automatically be to the right
set updatetime=300                      " Faster completion
set timeoutlen=500                      " By default timeoutlen is 1000 ms
set formatoptions-=cro                  " Stop newline continution of comments
set formatoptions-=ro        "disbales next line auto comment
set noswapfile                "set no swap file
set nowrap
" maximize minimize splits using cltr+W M/m
nnoremap <C-W>M <C-W>\| <C-W>_
nnoremap <C-W>m <C-W>=

" copy paste system clipboard
set clipboard+=unnamedplus
" Copy to clipboard
vnoremap  <leader>y  "+y
nnoremap  <leader>Y  "+yg_
nnoremap  <leader>y  "+y
nnoremap  <leader>yy  "+yy

" " Paste from clipboard
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P
" ----------------------------------------------------------------------------------------------
" CSS auto complete 
" ----------------------------------------------------------------------------------------------
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType jsx set omnifunc=csscomplete#CompleteCSS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType jsx set omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType jsx set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType php set omnifunc=phpcomplete#CompletePHP

" ----------------------------------------------------------------------------------------------
" :find inbuilt find search in vim 
" ----------------------------------------------------------------------------------------------
set path+=**
set wildmenu
" nnoremap <C-p> :find *
nnoremap <C-p> :vs *

" ----------------------------------------------------------------------------------------------
" => Text, tab and indent related
" ----------------------------------------------------------------------------------------------

set expandtab                   " Use spaces instead of tabs.
set smarttab                    " Be smart using tabs ;)
set shiftwidth=2                " One tab == four spaces.
set tabstop=2                   " One tab == four spaces.

"" ----------------------------------------------------------------------------------------------
" NEOVIM KEYBINDINGS
" ----------------------------------------------------------------------------------------------

" Setting <Leader> to Spacebar button
set timeoutlen=500
" let g:mapleader = "\<Space>"
nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>

" " Better nav for omnicomplete
inoremap <expr> <c-j> ("\<C-n>")
inoremap <expr> <c-k> ("\<C-p>")

" Use alt + hjkl to resize windows
nnoremap <M-j>    :resize -2<CR>
nnoremap <M-k>    :resize +2<CR>
nnoremap <M-l>    :vertical resize -2<CR>
nnoremap <M-h>    :vertical resize +2<CR>

" I hate escape more than anything else
inoremap jk <Esc>
inoremap kj <Esc>

" Easy CAPS
" inoremap <c-u> <ESC>viwUi
" nnoremap <c-u> viwU<Esc>

" Better tabbing
vnoremap < <gv
vnoremap > >gv

" Better window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Alternate way to save
nnoremap <C-s> :w<CR>
" Alternate way to quit
nnoremap <C-Q> :wq!<CR>
" Use control-c instead of escape
nnoremap <C-c> <Esc> Keybinds

" Searched word will appear in middle of screen
nnoremap n nzzzv
nnoremap N Nzzzv
