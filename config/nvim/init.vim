" Plugins ------------------------------------------------ {{{
call plug#begin('~/.config/nvim/autoload/plugged')

" Nord Theme
Plug 'shaunsingh/nord.nvim'

" Gruvbox theme
Plug 'gruvbox-community/gruvbox'

" tree fern
Plug 'lambdalisue/fern.vim'
" fonts for fern tree
" Plug 'lambdalisue/nerdfont.vim'
" Plug 'lambdalisue/fern-renderer-nerdfont.vim'

" Emmet
Plug 'mattn/emmet-vim'

" css color
Plug 'ap/vim-css-color'

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

" go
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

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

"fzf
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Goyo
Plug 'junegunn/goyo.vim'

call plug#end()
" }}}

" Theme Setting --------------------- {{{
set termguicolors
colorscheme nord
" colorscheme gruvbox

" For Transparency
au ColorScheme * hi Normal ctermbg=none guibg=none
au ColorScheme myspecialcolors hi Normal ctermbg=red guibg=red
" }}}

" MarkdowmPreview Setting --------------------- {{{

" let g:mkdp_auto_start = 1 "1 : preview opens when mkdown buffer is opened in vim
let g:mkdp_refresh_slow = 1 "1 : will not live update 

" }}}

" Tree Setting --------------------- {{{

" .............................................................................
" lambdalisue/fern.vim
" .............................................................................

" Custom settings and mappings.

let g:fern#disable_default_mappings = 1

let g:fern#drawer_width = 40
let g:fern#default_hidden = 1
let g:fern#disable_drawer_auto_quit = 1

noremap <silent> <C-b> :Fern . -drawer -reveal=% -toggle -width=40<CR><C-w>=

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
	nmap <buffer> T <Plug>(fern-action-new-file)
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
  autocmd FileType fern call s:init_fern()
augroup END

" let g:fern#renderer = "nerdfont"

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

" netrw as tree settings
" " Netrw settings
" let g:netrw_keepdir = 0
" let g:netrw_winsize = 25
" let g:netrw_banner = 0
" let g:netrw_liststyle = 3
" let g:netrw_localcopydircmd = 'cp -r'
" let g:netrw_browse_split=4

" function! OpenToRight()
"   :normal v
"   let g:path=expand('%:p')
"   execute 'q!'
"   execute 'belowright vnew' g:path
"   :normal <C-w>l
" endfunction

" function! OpenBelow()
"   :normal v
"   let g:path=expand('%:p')
"   execute 'q!'
"   execute 'belowright new' g:path
"   :normal <C-w>l
" endfunction

" function! OpenTab()
"   :normal v
"   let g:path=expand('%:p')
"   execute 'q!'
"   execute 'tabedit' g:path
"   :normal <C-w>l
" endfunction

" function! NetrwMappings()
"   " Hack fix to make ctrl-l work properly
"   noremap <buffer> <A-l> <C-w>l
"   noremap <buffer> <C-l> <C-w>l
"   noremap <silent> <C-b> :Lexplore<CR>
"   noremap <silent> <A-f> :call ToggleNetrw()<CR>
"   noremap <buffer> V :call OpenToRight()<cr>
"   noremap <buffer> H :call OpenBelow()<cr>
"   noremap <buffer> T :call OpenTab()<cr>
" endfunction

" augroup netrw_mappings
"   autocmd!
"   autocmd filetype netrw call NetrwMappings()
" augroup END

" " Allow for netrw to be toggled
" function! ToggleNetrw()
"   if g:NetrwIsOpen
"     let i = bufnr("$")
"     while (i >= 1)
"       if (getbufvar(i, "&filetype") == "netrw")
"         silent exe "bwipeout " . i
"       endif
"       let i-=1
"     endwhile
"     let g:NetrwIsOpen=0
"   else
"     let g:NetrwIsOpen=1
"     silent Lexplore
"   endif
" endfunction

" " Check before opening buffer on any file
" function! NetrwOnBufferOpen()
"   if exists('b:noNetrw')
"     return
"   endif
"   call ToggleNetrw()
"   setlocal statusline=/
" endfun

" Close Netrw if it's the only buffer open
" autocmd WinEnter * if winnr('$') == 1 && getbufvar(winbufnr(winnr()), "&filetype") == "netrw" || &buftype == 'quickfix' |q|endif

" Make netrw act like a project Draw
" augroup ProjectDrawer
"   autocmd!
"   " Don't open Netrw
"   autocmd VimEnter ~/.config/joplin/tmp/*,/tmp/calcurse*,~/.calcurse/notes/*,~/vimwiki/*,*/.git/COMMIT_EDITMSG let b:noNetrw=1
"   autocmd VimEnter * :call NetrwOnBufferOpen()
" augroup END

" let g:NetrwIsOpen=0
" }}}

" Statusline --------------------- {{{

let g:currentmode={
      \ 'n'  : 'NORMAL ',
      \ 'v'  : 'VISUAL ',
      \ 'V'  : 'V·Line ',
      \ "\<C-V>" : 'V·Block ',
      \ 'i'  : 'INSERT ',
      \ 'R'  : 'R ',
      \ 'Rv' : 'V·Replace ',
      \ 'c'  : 'Command ',
      \ 't'  : 'TERMINAL ',
      \}

function! GitBranch()
  return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! StatuslineGit()
  let l:branchname = GitBranch()
  return strlen(l:branchname) > 0?'  '.l:branchname.' ':''
endfunction

set statusline=
set statusline+=%#DiffAdd#
set statusline+=\ %{toupper(g:currentmode[mode()])}
set statusline+=%#DiffChange#
" set statusline+=\ %{StatuslineGit()}
set statusline+=%{StatuslineGit()}
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

" }}}

" Emmet Setting --------------------- {{{
let g:user_emmet_leader_key='<A-c>' " set emmet key to alt+c
" }}}

" close tag Setting --------------------- {{{

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
" }}}

" General Setting --------------------- {{{

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

" fold for wrap in init.vim
augroup config_setting
  autocmd!
  autocmd FileType vim setlocal foldlevel=0 foldmethod=marker
augroup END

" }}}

" CSS Autocomplete using inbuilt omnicomplete --------------------- {{{

autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType jsx set omnifunc=csscomplete#CompleteCSS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType jsx set omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType jsx set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType php set omnifunc=phpcomplete#CompletePHP

" au filetype css inoremap <buffer> . .<C-x><C-o>

" }}}

" go-lang  --------------------- {{{

filetype plugin indent on

set autowrite

" Go syntax highlighting
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_operators = 1

" Auto formatting and importing
let g:go_fmt_autosave = 1
let g:go_fmt_command = "goimports"

" Status line types/signatures
let g:go_auto_type_info = 1

" Run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

" Map keys for most used commands.
" Ex: `\b` for building, `\r` for running and `\b` for running test.
autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>
autocmd FileType go nmap <leader>r  <Plug>(go-run)
autocmd FileType go nmap <leader>t  <Plug>(go-test)

" go-lang autocomplete omni
au filetype go inoremap <buffer> . .<C-x><C-o>

" }}}

" Find inbuilt find search in vim --------------------- {{{

" set path=.,,**
set path+=**                                                                    
set wildmenu
set wildignore+=*/min/*,*/vendor/*,*/node_modules/*,*/bower_components/*
set wildmode=longest:full,full

" }}}

" Text, Tabs and indenatation --------------------- {{{

set expandtab                   " Use spaces instead of tabs.
set smarttab                    " Be smart using tabs ;)
set shiftwidth=2                " One tab == four spaces.
set tabstop=2                   " One tab == four spaces.
" set cursorline

" }}}

" Keybindings and remaps --------------------- {{{

set timeoutlen=500
" Setting <Leader> to Spacebar button
" let g:mapleader = "\<Space>"
" nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>

" Better nav for omnicomplete
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

" Easy full word CAPS
inoremap <c-u> <ESC>viwUi
nnoremap <c-u> viwU<Esc>

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

" Searched word will appear in middle of screen
nnoremap n nzzzv
nnoremap N Nzzzv

" select and move up down shift + J/K
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" maximize minimize splits using cltr+W M/m
nnoremap <C-W>M <C-W>\| <C-W>_
nnoremap <C-W>m <C-W>=

" find file using leader + cltr + f
" nnoremap <leader><C-f> :find *
" find file and split open vertical using leader + cltr + f
" nnoremap <leader><C-v> :vert sf *
" find file and split open horizontal using leader + cltr + f
" nnoremap <leader><C-h> :sf *

" fzf ... cltr+p to search :Files
nnoremap <C-p> :Files<Cr>

" x will only cut but not keep in clipboard
noremap x "_x

" }}}

