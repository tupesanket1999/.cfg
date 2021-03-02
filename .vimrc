syntax on

set encoding=utf-8
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nu
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set colorcolumn=80
set showtabline=2
set noshowmode
set relativenumber
set hidden
set nobackup
set nowritebackup
set cmdheight=2
set updatetime=300
set shortmess+=c

"file shortcuts saving and !q
inoremap jj <esc>
nnoremap zz :w<CR>
nnoremap zzq :wq!<CR>
nnoremap zq :q!<CR>

"Plugin for vim  
call plug#begin('~/.vim/plugged')
Plug 'mlaursen/vim-react-snippets'
Plug 'honza/vim-snippets'
Plug 'ayu-theme/ayu-vim'
Plug 'morhetz/gruvbox'
Plug 'jremmen/vim-ripgrep'
Plug 'tpope/vim-fugitive'
Plug 'leafgarland/typescript-vim'
Plug 'vim-utils/vim-man'
Plug 'lyuts/vim-rtags'
Plug 'kien/ctrlp.vim'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/nerdtree'
Plug 'google/vim-maktaba'
Plug 'google/vim-codefmt'
Plug 'google/vim-glaive'
Plug 'NLKNguyen/papercolor-theme'
Plug 'mbbill/undotree'
Plug 'sheerun/vim-polyglot'

Plug 'prettier/vim-prettier', {
            \ 'do': 'npm install',
            \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }
augroup autoformat_settings
    autocmd FileType bzl AutoFormatBuffer buildifier
    autocmd FileType c,cpp,proto,arduino AutoFormatBuffer clang-format
    autocmd FileType dart AutoFormatBuffer dartfmt
    autocmd FileType go AutoFormatBuffer gofmt
    autocmd FileType gn AutoFormatBuffer gn
    autocmd FileType java AutoFormatBuffer google-java-format
    autocmd FileType python AutoFormatBuffer yapf
augroup END

let g:prettier#autoformat = 0
call plug#end()
"Plugin ended



autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync

"Colour scheme
let g:gruvbox_invert_selection='0'
let g:gruvbox_contrast_dark = 'hard'
set bg=dark
colorscheme gruvbox

"Themes
"set t_Co=256   " This is may or may not needed.
"set bg=dark
"set background=dark
"colorscheme PaperColor

"set termguicolors  
"let ayucolor="light"  " for light version of theme
"let ayucolor="mirage" " for mirage version of theme
"let ayucolor="dark"   " for dark version of theme
"colorscheme ayu

"Java formater
call glaive#Install()
Glaive codefmt plugin[mappings]
Glaive codefmt google_java_executable="java -jar ~/google-java-format-1.8-all-deps.jar --aosp"
Glaive codefmt clang_format_style="{IndentWidth: 4}"


if executable('rg')
    let g:rg_derive_root='true'
endif

set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows

let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
            \ 'dir':  '\v[\/]\.(git|hg|svn)$',
            \ 'file': '\v\.(exe|so|dll)$',
            \ 'link': 'some_bad_symbolic_links',
            \ }
let mapleader = " "

let g:ctrlp_use_caching = 0
if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif

"Some shortcut keys
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>u :UndotreeShow<CR>
map <C-n> :NERDTreeToggle<CR>
nnoremap <Leader>ps :Rg<SPACE>
nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gy <Plug>(coc-type-definition)
nmap <leader>gi <Plug>(coc-implementation)
nmap <leader>gr <Plug>(coc-references)
nmap <leader>rr <Plug>(coc-rename)
nnoremap <Leader>+ :vertical resize +5<CR>
nnoremap <Leader>- :vertical resize -5<CR>
nnoremap tl :tabn<CR>
nnoremap th :tabp<CR>

"status
python3 from powerline.vim import setup as powerline_setup
python3 powerline_setup()
python3 del powerline_setup
set laststatus=2

"Coc AutoCompleteh
if has("patch-8.1.1564")
  set signcolumn=number
else
  set signcolumn=yes
endif

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif
