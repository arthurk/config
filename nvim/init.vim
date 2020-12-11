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

" Snippets - Reduce startup time TODO
" let g:snips_author = 'xxx'
" let g:snips_email  = 'xxx'
"
let g:completion_enable_auto_paren = 1
let g:completion_matching_smart_case = 1
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
let g:completion_sorting = 'strategy'
let g:completion_chain_complete_list = [
    \{'complete_items': ['lsp', 'snippet']},
    \{'mode': '<c-p>'},
    \{'mode': '<c-n>'},
    \]

" neovim 0.5 lsp and treesitter
lua require('init')
