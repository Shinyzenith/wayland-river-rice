syntax on
call plug#begin('~/.config/nvim/plugged')
Plug 'ap/vim-css-color'
Plug 'christoomey/vim-tmux-navigator'
Plug 'editorconfig/editorconfig-vim'
Plug 'farmergreg/vim-lastplace'
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'nvim-lua/plenary.nvim' " needed for telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'rust-lang/rust.vim'
Plug 'sbdchd/neoformat'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ziglang/zig.vim'
call plug#end()

let mapleader=" " " Leader key
colorscheme tokyonight " Colorscheme

" Set background to transparent.
highlight Normal guibg=none
highlight NonText guibg=none

" Set commands.
set guifont=Iosevka\ Term:h15 "  This is for neovide.
set wildmode=longest,list,full
set wildmenu
set cindent
set colorcolumn=150
set completeopt=menuone,noselect
set encoding=UTF-8
set hidden
set incsearch
set linebreak
set mouse=a
set nobackup
set noerrorbells
set nofoldenable
set noswapfile
set nowrap
set nu
set relativenumber
"set scrolloff=999
set shiftwidth=4
set shortmess+=c
set signcolumn=yes
set smartcase
set smartindent
set smarttab
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
set tabstop=4 softtabstop=4
set title
set ttyfast
set undodir=~/.config/nvim/undodir
set undofile
set updatetime=300
set window title

" Functions.
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Auto-commands.
augroup fmt
  autocmd!
  autocmd BufWritePre * undojoin | Neoformat
augroup END

" Auto compilations.
autocmd BufWritePost *.tex silent! !pdflatex %
autocmd BufWritePost *.rs !make check
autocmd BufWritePost *.c !make
autocmd BufWritePost *.cpp !make
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

" Normal mode remaps.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gt <Plug>(coc-type-definition)
nmap <silent> rn <Plug>(coc-rename)
nmap cc <Plug>NERDCommenterToggle
nnoremap / /\v
nnoremap <C-G> <cmd>Telescope live_grep<cr>
nnoremap <C-b> <cmd>Telescope buffers<cr>
nnoremap <C-n> <cmd>Telescope file_browser<CR>
nnoremap <C-p> <cmd>Telescope find_files<cr>
nnoremap <C-s> :w<CR>
nnoremap <esc> :noh<CR>
nnoremap <leader>0 :tablast<cr>
nnoremap <leader>1 1gt
nnoremap <leader>2 2gt
nnoremap <leader>3 3gt
nnoremap <leader>4 4gt
nnoremap <leader>5 5gt
nnoremap <leader>6 6gt
nnoremap <leader>7 7gt
nnoremap <leader>8 8gt
nnoremap <leader>9 9gt
nnoremap <leader>gc :Git commit<CR>
nnoremap <leader>gh :diffget //3<CR>
nnoremap <leader>gp :Git push<CR>
nnoremap <leader>gs :G<CR>
nnoremap <leader>gu :diffget //2<CR>
nnoremap <leader>p "*yy
nnoremap <leader>t :terminal<CR>
nnoremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
nnoremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')
nnoremap <silent> <leader>+ :vertical resize +5<CR>
nnoremap <silent> <leader>- :vertical resize -5<CR>
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
nnoremap <silent> K :call <SID>show_documentation()<CR>
nnoremap Q <Nop>
nnoremap Y y$

" Visual select remaps.
vnoremap / /\v
vnoremap < <gv
vnoremap > >gv
vnoremap <leader>p "*y
vmap cc <Plug>NERDCommenterToggle

" Terminal remaps.
tnoremap <C-b> <cmd>Telescope buffers<cr>
tnoremap <C-h> <C-\><C-n>

" Insert mode remaps.
inoremap <silent><expr> <C-Space> coc#refresh() " Trigger autocomplete
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
			\: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
"inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"  " Use this to cycle through the autocomplete list with tab
inoremap <expr> <Tab> pumvisible() ? "\<C-y>" : "\<Tab>"

" Let commands.
let g:neovide_transparency=0.8 " this is for neovide
let g:neovide_cursor_vfx_mode = "sonicboom" " This is for neovide
let g:airline_powerline_fonts=1 " set this to 0 for straight edges and 1 for angled edges.
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme = 'base16'
let g:airline#extensions#wordcount#enabled = 1
let g:coc_global_extensions = [
  \ 'coc-clangd',
  \ 'coc-discord-rpc',
  \ 'coc-go',
  \ 'coc-json', 
  \ 'coc-pairs',
  \ 'coc-rust-analyzer',
  \ 'coc-zig',
  \ 'coc-snippets'
  \ ]


" Functions to alias inbuilt commands.
fu! Single_quote(str)
  return "'" . substitute(copy(a:str), "'", "''", 'g') . "'"
endfu
fu! Cabbrev(key, value)
  exe printf('cabbrev <expr> %s (getcmdtype() == ":" && getcmdpos() <= %d) ? %s : %s',
    \ a:key, 1+len(a:key), Single_quote(a:value), Single_quote(a:key))
endfu

" Aliasing some common pain points
call Cabbrev('W', 'w')
call Cabbrev('Wq', 'wq')
call Cabbrev('wQ', 'wq')
call Cabbrev('WQ', 'wq')
call Cabbrev('Q', 'q')
