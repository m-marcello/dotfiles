" ~/.config/nvim/init.vim
" automatic installs vim-plug if not there
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim' 
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

"------------------------------------------------
" Plugins START
call plug#begin()
  " show git diff in sign column
  Plug 'airblade/vim-gitgutter'
  " statusline/tabline configuration
  Plug 'itchyny/lightline.vim'
  Plug 'mengelbrecht/lightline-bufferline'
  " gruvbox theme
  Plug 'morhetz/gruvbox'
  " coc
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  " ale
  Plug 'dense-analysis/ale'
  " comment with 'gc'+movement or 'gcc'
  Plug 'tpope/vim-commentary'
  " show files in treeview with 'ctrl t'
  Plug 'scrooloose/nerdtree'
  " rust support
  Plug 'rust-lang/rust.vim'
  Plug 'cespare/vim-toml'
  " align text to pattern
  Plug 'godlygeek/tabular'
  " markdown support
  Plug 'plasticboy/vim-markdown'
  Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
  " move between splits and tmux panes with 'ctrl [dir]'
  Plug 'christoomey/vim-tmux-navigator'
  " add fuzzy finder
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
call plug#end()
" Plugins END
"------------------------------------------------


"------------------------------------------------
" Settings START
" map <leader> key to Space
let mapleader = "\<Space>"
filetype plugin on
" following two lines are for rust.vim
syntax enable
filetype plugin indent on
set completeopt=menuone
set mouse=a
set nobackup
set nocompatible
set ignorecase
set noswapfile
set nowritebackup
set number
set relativenumber
set signcolumn=yes
set title
set wrap
setlocal wrap
set clipboard+=unnamedplus
set noexpandtab
set tabstop=4
set shiftwidth=4
" using coc-spell-checker instead of build in
" setlocal spell spelllang=en_us,de_de
" Settings END
"------------------------------------------------


"------------------------------------------------
" persist START
set undofile " Maintain undo history between sessions
set undodir=~/.vim/undodir
" Persist cursor
autocmd BufReadPost *
  \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
  \ |   exe "normal! g`\""
  \ | endif
" persist END
"------------------------------------------------


"------------------------------------------------
" Theme START
syntax on
"set Gruvbox theme
set cursorline
set hidden
set cmdheight=1
set laststatus=2
"let g:gruvbox_transp_bg = 1
let g:gruvbox_italicize_strings=0
set list
set listchars=tab:»·,trail:·
" make buffers be clickable
let g:lightline#bufferline#clickable=1
let g:lightline#bufferline#shorten_path=1
let g:lightline#bufferline#min_buffer_count=1
let g:lightline = {
\  'colorscheme': 'jellybeans',
\  'active': {
\    'left': [ [], [], [ 'relativepath' ] ],
\    'right': [ [], [], [ 'lineinfo', 'percent' ] ]
\  },
\  'inactive': {
\    'left': [ [], [], [ 'relativepath' ] ],
\    'right': [ [], [], [ 'lineinfo', 'percent' ] ]
\  },
\  'subseparator': {
\    'left': '', 'right': ''
\  },
\  'tabline': {
\    'left': [ ['buffers'] ],
\    'right': [ [] ]
\  },
\  'tabline_separator': {
\    'left': "", 'right': ""
\  },
\  'tabline_subseparator': {
\    'left': "", 'right': ""
\  },
\  'component_expand': {
\    'buffers': 'lightline#bufferline#buffers'
\  },
\  'component_raw': {
\    'buffers': 1
\  },
\  'component_type': {
\    'buffers': 'tabsel'
\  }
\}
colorscheme gruvbox
" Theme END
"------------------------------------------------


"------------------------------------------------
" Remaps START
" source $MYVIMRC reloads the saved $MYVIMRC
:nmap <Leader>s :source $MYVIMRC<CR>
" opens $MYVIMRC for editing, or use :tabedit $MYVIMRC
:nmap <Leader>v :e $MYVIMRC<CR>

" Enter normal mode with 'kj'
inoremap kj 	<Esc>

" Automatically append closing brackets
" inoremap [		[]<Left>
inoremap {<CR>	{<CR>}<Esc>O

" Toggle between buffers
nmap <Leader>n :bn<CR>
nmap <Leader>p :bp<CR>
" Remaps END
"------------------------------------------------


"------------------------------------------------
" Coc START
" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Don't pass messages to |ins-completion-menu|.
" set shortmess+=c

" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
" inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
"                               \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Remap for do codeAction of selected region for coc-spell
" vmap <leader>a <Plug>(coc-codeaction-selected)
" nmap <leader>a <Plug>(coc-codeaction-selected)

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
"nmap <silent> [g <Plug>(coc-diagnostic-prev)
"nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')
" Symbol renaming.
"nmap <leader>rn <Plug>(coc-rename)

" Remap keys for applying codeAction to the current buffer.
"nmap <leader>ga  <Plug>(coc-codeaction)

" Add `:Fold` command to fold current buffer.
"command! -nargs=? Fold :call     CocAction('fold', <f-args>)
" Coc END
"------------------------------------------------


"------------------------------------------------
" Rust START
" Run rustfmt on save
let g:rustfmt_autosave = 1
" Rust END
"------------------------------------------------


"------------------------------------------------
" Markdown START
" Disable header folding
let g:vim_markdown_folding_disabled = 1

" Disable autoclose of preview
let g:mkdp_auto_close = 0
" Markdown END
"------------------------------------------------


"------------------------------------------------
" NerdTREE START
nnoremap <C-t> :NERDTreeToggle<CR>
" NerdTREE END
"-----------------------------------------------


"------------------------------------------------
" Fzf START
" Find files with fzf in the current dir (exclude the ones git ignores)
nnoremap <C-f> :GFiles<CR>
" Find files with fzf in the current dir (exclude the ones git ignores)
nnoremap <C-F> :Files<CR>
" Search files with ripgrep
nnoremap <C-g> :Rg<CR>
" List all open buffers with 'leader b'
nnoremap <silent><leader>b :Buffers<CR>
" Fzf END
"-----------------------------------------------
