runtime! debian.vim

call plug#begin(stdpath('config') . '/plugged')
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/deoplete-lsp'
Plug 'lifepillar/vim-solarized8'
Plug 'godlygeek/tabular'
Plug 'neovim/nvim-lsp'
call plug#end()

let g:deoplete#enable_at_startup = 1
" lua require'nvim_lsp'.bashls.setup{}
lua require'nvim_lsp'.cmake.setup{}
lua require'nvim_lsp'.clangd.setup{}

if (has("termguicolors"))
    set termguicolors
endif
set background=light
colorscheme solarized8

execute "nmap <Leader>v :vsplit term://" . &shell"<cr>"
execute "nmap <Leader>w :split term://" . &shell"<cr>"
execute "nmap <Leader>n :tabnew term://" . &shell"<cr>"

nmap <Leader>h :nohlsearch<cr>
nmap <Leader><space> :%s/\s\+$//g<cr>
nnoremap <silent> gd			<cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> gD    		<cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> K     		<cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gi    		<cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <c-k> 		<cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> 1gD   		<cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> gr    		<cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> g0    		<cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> gW    		<cmd>lua vim.lsp.buf.workspace_symbol()<CR>
nnoremap <silent> <Leader>f		<cmd>lua vim.lsp.buf.code_action()()<CR>

set laststatus=0
set showmatch
set softtabstop=4
set smarttab
" set expandtab
" 空格代替Tab"
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
