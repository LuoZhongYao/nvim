runtime! debian.vim
" 开启语法高亮"
if has("syntax")
  syntax on
endif

call plug#begin(stdpath('config') . '/plugged')
"Plug 'mrtazz/DoxygenToolkit.vim'
"Plug 'zchee/deoplete-jedi'
"Plug 'w0rp/ale'
"Plug 'junegunn/vim-easy-align'
"Plug 'sebastianmarkow/deoplete-rust', {'for': 'rust'}
"Plug 'rust-lang/rust.vim', {'for': 'rust'}
"Plug 'udalov/kotlin-vim'

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-clang', { 'for': 'cmake'}
Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'do': 'bash install.sh'}

Plug 'yianwillis/vimcdoc'
Plug 'morhetz/gruvbox'
Plug 'godlygeek/tabular'
call plug#end()

let g:LanguageClient_diagnosticsList='Location'
"let g:LanguageClient_serverStderr = '/tmp/clangd.stderr'
let g:LanguageClient_serverCommands = {
    \ 'c': ['/usr/bin/clangd'],
    \ 'cpp': ['/usr/bin/clangd'],
    \ }

set completefunc=LanguageClient#complete
set formatexpr=LanguageClient_textDocument_rangeFormatting()

let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#clang#libclang_path = '/usr/lib64/libclang.so.8'
"let g:deoplete#sources#clang#clang_header = '/usr/include'

if (has("termguicolors"))
    set termguicolors
endif
set background=dark
colorscheme gruvbox

" nvim 终端模拟器快进键
if has('nvim')
    " 不用<ESC> 键是因为要在终端里面调用vi/vim
    tnoremap <ESC>  <C-\><C-n>
    tnoremap <c-q>  <ESC>
    tnoremap <C-w>h <C-\><C-N><C-w>h
    tnoremap <C-w>j <C-\><C-N><C-w>j
    tnoremap <C-w>k <C-\><C-N><C-w>k
    tnoremap <C-w>l <C-\><C-N><C-w>l
    tnoremap <C-w><C-h> <C-\><C-N><C-w>h
    tnoremap <C-w><C-j> <C-\><C-N><C-w>j
    tnoremap <C-w><C-k> <C-\><C-N><C-w>k
    tnoremap <C-w><C-l> <C-\><C-N><C-w>l
    execute "nmap <Leader>v :vsplit term://" . &shell"<cr>"
    execute "nmap <Leader>w :split term://" . &shell"<cr>"
    execute "nmap <Leader>n :tabnew term://" . &shell"<cr>"
    " autocmd BufWinEnter,WinEnter term://* startinsert
    " autocmd BufLeave term://* stopinsert
endif

" easy-align 配置
nmap <Leader>h :nohlsearch<cr>
nmap <Leader><space> :%s/\s\+$//g<cr>
nmap <Leader>2 : call LanguageClient#textDocument_rename()<cr>
" 开启文件类型检测，主要是makefile文件中的Tab"
filetype plugin indent on
set laststatus=0
set showmatch
set softtabstop=4
set smarttab
" 空格代替Tab"
" set expandtab
" 自动缩进"
set cindent
" Tab宽度"
set tabstop=4
" 匹配括号"
set showmatch
" 缩进格数"
set softtabstop=4
set shiftwidth=4
" 编码设置"
set enc=utf-8
set fencs=utf-8,gb18030,gdk,gdk2312
set fenc=utf-8
set tenc=utf-8
" set noexpandtab"
" 搜索忽略大小写
set ignorecase smartcase
" 关闭预览
set completeopt=longest,menu
" vimdiff 忽略空格
set diffopt+=iwhite
set diffexpr=""

set colorcolumn=81

set mouse=a

call gtags#load()
exec 'source ' . stdpath('config') . '/template.vim'
