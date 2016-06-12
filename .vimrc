"--------------------------------
"基本设置
"--------------------------------

"设置文件编码
set encoding=utf-8
set fileencoding=utf-8

"console乱码
language messages zh_CN.utf-8

"不兼容vi
set nocompatible

"运行宏时不重绘
set lazyredraw

"启动时不显示乌干达儿童提示
set shortmess=atI

"设置行号
set number

map <leader>nb :call Number()<CR>
function! Number()
    if(&relativenumber == &number)
        set relativenumber! number!
    elseif(&number)
        set number!
    else
        set relativenumber!
    endif
    set number?
endfunc
        
"突出显示当前行
set cursorline

"突出显示当前列
"set cursorcolumn

"显示当前的行号和列号
set ruler

"显示正在输入的命令
set showcmd

"Height of the command bar
"set cmdheight=2

"左下角显示当前模式
set showmode

"上下移动光标时上下至少保留行数
set scrolloff=7


"语法高亮
syntax on
syntax enable

"文件类型检测
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on

"括号配对情况
set showmatch
set matchtime=2

"设置标准正则语法
"set magic

"设置文内智能搜索提示
"高亮搜索文本
set hlsearch
"取消高亮
noremap <silent><leader>/ :nohls<CR>
"打开增量搜索
set incsearch
"搜索时忽略大小写
set ignorecase
"智能大小写
set smartcase

"Configure backspace so it acts as it should act
set backspace=eol,start,indent
"跨行有效
"set whichwrap+=<,>,h,l

"代码折叠
set foldenable
"折叠方法
"manual 手动
"indent 缩进
"expr 表达式
"syntax 语法定义
"diff 没有更改的文本折叠
"marker 使用标记进行折叠
set foldmethod=indent
set foldcolumn=5
set foldlevel=99
"定义代码折叠快捷键
let g:FoldMethod = 0
map <leader>zz :call ToggleFold()<CR>
fun! ToggleFold()
	if g:FoldMethod == 0
		exe "normal! zM"
		let g:FoldMethod = 1
	else
		exe "normal! zR"
		let g:FoldMethod = 0
	endif
endfun

"缩进配置
set smartindent
set autoindent

"tab设置
"tab宽度4字符
set tabstop=4
"缩进对应空格数
set shiftwidth=4
"按退格键时一次删掉4个空格
set softtabstop=4
"insert tabs on the start of a line according to shiftwidth, not tabstop
set smarttab
"将tab自动转换成空格，需要真正的tab时用Ctrl+V + Tab]
set expandtab
"缩进时取整use multiple of shiftwidth when indenting with '<' and '>'
set shiftround

"history存储容量
set history=2000

"文件修改后自动载入
set autoread

"取消备份
set nobackup
set nowb
"关闭交换文件
set noswapfile

"忽略文件
set wildignore=.*,.git

"退出后内容留在屏幕
"set t_ti=t_te=

"设置terminal标题
set title

"状态栏设置
set laststatus=2
set statusline=%<%f\ %h%m%r%=%k[%{(&fenc==\"\")?&enc:&fenc}%{(&bomb?\",BOM\":\"\")}]\ %-14.(%l,%c%V%)\ %P

"自动补全设置
set completeopt=longest,menu

"增强模式命令行自动完成操作
set wildmenu

"命令行增强
cnoremap <C-a> <Home>
cnoremap <C-e> <End>

"Ignore compiled files
set wildignore=*~

"离开插入模式后自动关闭预览窗口
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

"回车即选择当前项
inoremap <expr> <CR>    pumvisible() ? "\<C-y>" : "\<CR>"

"--------------------------------
"快捷设置
"--------------------------------

"Set mapleader
let mapleader = ','
let g:mapleader = ','

"快捷保存
nmap <leader>w :w!<CR>

"Fast reloading of the .vimrc
map <silent> <leader>ss :source $MYVIMRC<CR>

"Fast editing of .vimrc
map <silent> <leader>ee :e $MYVIMRC<CR>

"When .vimrc is edited, reload it
autocmd! bufwritepost $MYVIMRC source $MYVIMRC 



"--------------------------------
"插件设置
"--------------------------------

"加载Vundle
if has('win32')
    set rtp+=$HOME/vimfiles/bundle/Vundle.vim/
    call vundle#begin('$USERPROFILE/vimfiles/bundle/')
else
    set rtp+=$HOME/vimfiles/.vim/Vundle.vim/
    call vundle#begin('$HOME/.vim/bundle/')
endif

"插件需要
filetype off

if !exists('g:bundle_groups')
    let g:bundle_group=['javascript', 'html', 'css', 'markdown', 'xml']
endif

Bundle 'csExplorer'

