" Plugins
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Javascript/Typescript plugins
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }

" Other Languages
Plug 'rust-lang/rust.vim'
Plug 'toyamarinyon/vim-swift'

" Util
Plug 'preservim/nerdcommenter'
Plug 'tpope/vim-surround'
Plug 'airblade/vim-rooter'
Plug 'brooth/far.vim'
Plug 'justinmk/vim-sneak'
Plug 'jiangmiao/auto-pairs'

" Themes and Appearance
Plug 'morhetz/gruvbox'
Plug 'hzchirs/vim-material'
Plug 'ryanoasis/vim-devicons'
Plug 'itchyny/lightline.vim'
call plug#end()

" ------ Settings ------
let mapleader=","
filetype plugin on
set nocompatible

set termguicolors
colorscheme gruvbox
" colorscheme vim-material
" let g:material_style="oceanic"

highlight Normal guibg=NONE ctermbg=NONE

set clipboard+=unnamedplus
set mouse=a
set hidden
set omnifunc=syntaxcomplete#Complete
set path+=**
set wildmenu

set guicursor=n-v-c:block-Cursor
set guicursor+=n-v-c:blinkon100
set guicursor+=i:ver100-iCursor

set cursorline
set nobackup
set ignorecase
set smartcase
set foldmethod=indent
set nofoldenable

set autoindent
set expandtab
set softtabstop=2
set tabstop=2
set shiftwidth=2

set number
set relativenumber
" Sign Column
set signcolumn=yes:1
highlight clear SignColumn

" NerdTree
let NERDTreeShowHidden=1
let g:NERDTreeMouseMode = 3 
let g:NERDTreeIgnore = ['\.meta', '\.csproj$', '\.DS_Store']

" NerdCommentor
let g:NERDSpaceDelims = 1 "Add spaces after comment delimiters by default
let g:NERDCompactSexyComs = 1
let g:NERDCreateDefaultMappings = 1


" ------ AutoCmd ------ 
" Open NerdTree if no file arguments were passed
function! StartUp()
    if !argc() && !exists("s:std_in")
        NERDTree
    end
    if argc() && isdirectory(argv()[0]) && !exists("s:std_in")
        exe 'NERDTree' argv()[0]
        wincmd p
        ene
    end
endfunction


autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * call StartUp()
autocmd BufWritePre *.js,*.ts,*.jsx,*.tsx,*.html,*.css,*.vue,*.scss :PrettierAsync
autocmd BufNewFile,BufRead *.cs set formatprg=astyle\ --style=allman\ --break-blocks\ --pad-oper\ --attach-namespaces\ --break-one-line-headers\ --add-braces\ --indent-switches
autocmd BufWritePre *.cs :call FormatWithDefaultProgram()
"autocmd BufWinEnter * :lcd %:h

function! FormatWithDefaultProgram() abort
    :normal! mmgggqGgg`mzz
endfunction

" ------ KEYBINDINGS ------ 
" General
map <C-c> :q!<CR>
map <C-s> :w<CR>
map <C-x> :wq<CR>

" Window 
" Same mappings as ITerm2
nnoremap <leader>d :vsp %<CR> 
nnoremap <leader>D :sp %<CR>
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" COC
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> <F2> <Plug>(coc-rename)
nmap <silent> gy <Plug>(coc-type-definition)
inoremap <silent><expr> <c-space> coc#refresh()

" FZF
nnoremap <C-p> :FZF .<CR>

" NerdTree
nnoremap <leader>b :NERDTreeToggle<CR>

" Sneak commands
map f <Plug>Sneak_f
map F <Plug>Sneak_F
map t <Plug>Sneak_t
map T <Plug>Sneak_T

