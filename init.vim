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
  " maintain consistent coding style for multiple developers working on the
  " same project across various editors
  Plug 'editorconfig/editorconfig-vim'
  " statusline/tabline configuration
  Plug 'itchyny/lightline.vim'
  Plug 'mengelbrecht/lightline-bufferline'
  " fuzzy-finder
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  " Plug 'junegunn/fzf.vim'
  " gruvbox theme
  Plug 'lifepillar/vim-gruvbox8'
  " coc
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
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
call plug#end()
" Plugins END
"------------------------------------------------


"------------------------------------------------
" Settings START
" map <leader> key to Space
let mapleader = "\<Space>"
filetype plugin on
set completeopt=menuone
set mouse=a
set nobackup
set nocompatible
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
"set termguicolors
colorscheme gruvbox8_hard
"set background=dark
set cursorline
set hidden
set cmdheight=1
set laststatus=2
"let g:gruvbox_transp_bg = 1
"let g:gruvbox_italicize_strings = 0
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
" Theme END
"------------------------------------------------


"------------------------------------------------
" Remaps START
" Automatically append closing brackets
inoremap [		[]<Left>
inoremap {<CR>	{<CR><CR>}<Up><Tab>

" Enter normal mode with 'kj'
inoremap kj 	<Esc>

" Navigate between splits disabled in favor for navigating tmux panes
" `ctrl-w [direction]` becomes `ctrl-[direction]
"nnoremap <C-J> <C-W><C-J>
"nnoremap <C-K> <C-W><C-K>
"nnoremap <C-L> <C-W><C-L>
"nnoremap <C-H> <C-W><C-H>

" Toggle between buffers
nmap <Leader>bn :bn<CR>
nmap <Leader>bp :bp<CR>

" List buffers
nmap <Leader>bl :Buffers<CR>

"nnoremap <C-p> :Rg<Cr>
"nnoremap <C-e> :Files<Cr>
"nmap <Leader>g :GFiles<CR>
"nmap <Leader>e :Files<CR>
"nmap <Leader>p :Rg<CR>
"nmap <Leader>g? :GFiles?<CR>
"nmap <Leader>h :History<CR>
" Remaps END
"------------------------------------------------


"------------------------------------------------
" Coc START
" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
"set updatetime=300

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
" Remap for do codeAction of selected region for coc-spell
vmap <leader>a <Plug>(coc-codeaction-selected)
nmap <leader>a <Plug>(coc-codeaction-selected)

" Use <c-space> to trigger completion.
"if has('nvim')
"  inoremap <silent><expr> <c-space> coc#refresh()
"else
"  inoremap <silent><expr> <c-@> coc#refresh()
"endif

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional eit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
"if exists('*complete_info')
"  inoremap <expr> <cr> complete_info()['selected'] != '-1' ? '\<C-y>' : '\<C-g>u\<CR>'
"else
"  inoremap <expr> <cr> pumvisible() ? '\<C-y>' : '\<C-g>u\<CR>'
"endif

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
nnoremap <C-f> :NERDTreeFind<CR>
" NerdTREE END
"-----------------------------------------------
