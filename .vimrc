"color scheme 
set t_Co=256   "这一步很关键决定了你配色结果是不是很漂亮
"color molokai
"highlighe function name
"autocmd BufNewFile,BufRead * :syntax match cfunctions "\<[a-zA-Z_][a-zA-Z_0-9]*\>[^()]*)("me=e-2
"autocmd BufNewFile,BufRead * :syntax match cfunctions "\<[a-zA-Z_][a-zA-Z_0-9]*\>\s*("me=e-1

"hi CTagsGlobalVariable ctermfg=5 " 修改全局变量 红色
"hi CTagsMember ctermfg=8 " 修改结构体成员



" molokai
syntax enable
set background=dark
colorscheme molokai
"colorscheme bandit

filetype on           " 开启文件类型检测
filetype plugin on    " 设置加载对应文件类型的插件
syntax on             " 开启语法高亮
set number            " 显示行号
set noerrorbells      " 关闭出错响铃
set autoindent        " 自动缩进
set cindent           " 使用C/C++的自动缩进方式
set tabstop=8         " 将tab设置为8个空格

" 设置高亮行
set cursorline

" 高亮显示搜索结果
set hlsearch

" 总是显示状态栏
set laststatus=2
" 显示光标当前位置
set ruler

" 基于缩进或语法进行代码折叠
"set foldmethod=indent
set foldmethod=syntax
" 启动 vim 时关闭折叠代码
set nofoldenable

" rainbow 
let g:rainbow_active = 1 "set to 0 if you want to enable it later via :RainbowToggle

" nerdtree
nnoremap <silent><leader>n :NERDTreeToggle<cr>
let g:NERDTreeFileExtensionHighlightFullName    = 1
let g:NERDTreeExactMatchHighlightFullName       = 1
let g:NERDTreePatternMatchHighlightFullName     = 1
let g:NERDTreeHighlightFolders                  = 1
let g:NERDTreeHighlightFoldersFullName          = 1
let g:NERDTreeDirArrowExpandable                = '▷'
let g:NERDTreeDirArrowCollapsible               = '▼'

" nerdtree-git-plugin
let g:NERDTreeIndicatorMapCustom = {
            \ "Modified"  : "✹",
            \ "Staged"    : "✚",
            \ "Untracked" : "✭",
            \ "Renamed"   : "➜",
            \ "Unmerged"  : "═",
            \ "Deleted"   : "✖",
            \ "Dirty"     : "✗",
            \ "Clean"     : "✔︎",
            \ 'Ignored'   : '☒',
            \ "Unknown"   : "?"
            \ }


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" cscope setting


if has("cscope") && filereadable("/usr/bin/cscope")
   set csprg=/usr/bin/cscope
   set csto=0
   set cst
   set nocsverb
   " add any database in current directory
   if filereadable("cscope.out")
      cs add cscope.out
   " else add database pointed to by environment
   elseif $CSCOPE_DB != ""
      cs add $CSCOPE_DB
   endif
   set csverb
endif

nmap <C-@>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-@>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-@>d :cs find d <C-R>=expand("<cword>")<CR><CR>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ctags setting
set tags=./tags;,tags;

" Tag list (ctags)

filetype on                            "文件类型自动检测

let Tlist_Ctags_Cmd = '/usr/bin/ctags'

let Tlist_Show_One_File = 1            "不同时显示多个文件的tag，只显示当前文件的
let Tlist_Exit_OnlyWindow = 1          "如果taglist窗口是最后一个窗口，则退出vim
let Tlist_Use_Right_Window = 1         "在右侧窗口中显示taglist窗口 
  
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

Plug 'https://github.com/luochen1990/rainbow'

Plug 'tomasr/molokai'

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

" Any valid git URL is allowed
Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Multiple Plug commands can be written in a single line using | separators
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

Plug 'https://github.com/tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'https://github.com/Xuyuanp/nerdtree-git-plugin'

Plug 'https://github.com/kendling/taghighlight'

" Using a non-master branch
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Unmanaged plugin (manually installed and updated)
Plug '~/my-prototype-plugin'


" Initialize plugin system
call plug#end()


