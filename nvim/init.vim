colorscheme iceberg

" keep undo history
set undofile

" open new split panes to right and bottom
set splitbelow
set splitright

" clear search highlight on return
nnoremap <silent> <CR> :noh<CR>

" enable mouse to resize windows
set mouse=a

" MacOS clipboard sharing
set clipboard=unnamed

" Enable truecolor
set termguicolors

" highlight selection on yank
au TextYankPost * silent! lua vim.highlight.on_yank {on_visual=false}

" completion
" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect

" Avoid showing message extra message when using completion
set shortmess+=c

" completion-nvim TODO move to lua on_attach
imap <silent> <c-p> <Plug>(completion_trigger)

" neovim 0.5 lsp and treesitter
lua require('init')
