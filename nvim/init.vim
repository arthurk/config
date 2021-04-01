colorscheme iceberg

"  set leader to space
let mapleader = "\<Space>"

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

" switch buffers without having to save their changes before
set hidden

" highlight selection on yank
au TextYankPost * silent! lua vim.highlight.on_yank {on_visual=false}

" case insensitive search
set ignorecase

" completion
" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Set completeopt to have a better completion experience
set completeopt=menuone,noselect
"set completeopt=menu,menuone,noselect

" - 'a' -- Auto formatting is BAD.
" - 't' -- Don't auto format my code. I got linters for that.
" + 'c' -- In general, I like it when comments respect textwidth
" + 'q' -- Allow formatting comments w/ gq
" - 'o' -- O and o, don't continue comments
" + 'r' -- But do continue when pressing enter.
" + 'n' -- Indent past the formatlistpat, not underneath it.
" + 'j' -- Auto-remove comments if possible.
" - '2' -- I'm not in gradeschool anymore
set fo-=a fo-=t fo+=c fo+=q fo-=o fo+=r fo+=n fo+=j fo-=2


" Avoid showing message extra message when using completion
"set shortmess+=c

" neovim 0.5 lsp and treesitter
lua require('init')

inoremap <silent><expr> <C-Space> compe#complete()
inoremap <silent><expr> <CR>      compe#confirm('<CR>')
inoremap <silent><expr> <C-e>     compe#close('<C-e>')

" Telescope
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
" map_tele('<space>ft', 'git_files')
" map_tele('<space>fd', 'fd')

" nvim-bufferline.lua
nmap <leader>p :BufferLineCyclePrev<CR>
nmap <leader>n :BufferLineCycleNext<CR>

" custom indent settings
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType html setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType template setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType markdown setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType lua setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType hcl setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType objc setlocal ts=4 sts=4 sw=4 expandtab

" split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

nnoremap <C-n> :NvimTreeToggle<CR>

" enable indent guides only for specific filetypes
let g:indent_blankline_filetype = ['yaml']
let g:indentLine_char = '⦙'

" unfold everything when opening a file
set foldlevelstart=20

nnoremap <leader>ut :GundoToggle<cr>
