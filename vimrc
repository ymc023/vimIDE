"去掉讨厌的有关vi一致性模式
set nocompatible 
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle
" required! 
Plugin 'VundleVim/Vundle.vim'
Plugin 'w0rp/ale'
Plugin 'sheerun/vim-polyglot'

Plugin 'altercation/vim-colors-solarized'
Plugin 'sickill/vim-monokai'
Plugin 'jnurmine/Zenburn'
Plugin 'vim-scripts/indentpython.vim' 
Plugin 'python-imports.vim'

"python
Plugin 'vim-scripts/Pydiction'
Plugin 'davidhalter/jedi-vim'
" Plugin 'heavenshell/vim-pydocstring'
Plugin 'pydoc.vim'
Plugin 'vim-flake8'
" 使用vim-syntastic需要flake8
" 在打开文件的时候检查
let g:syntastic_check_on_open=1
let g:syntastic_python_flake8_post_args='--ignore=E501,F403,W503'
let g:syntastic_python_flake8_exec = 'python3'
let g:syntastic_python_flake8_args = ['-m', 'flake8']
let g:syntastic_javascript_checkers = ['eslint']
Plugin 'tell-k/vim-autopep8'

"js
Plugin 'mattn/emmet-vim'
Plugin 'marijnh/tern_for_vim'
Plugin 'pangloss/vim-javascript'
Plugin 'othree/xml.vim'
Plugin 'KohPoll/vim-less'
Plugin 'lepture/vim-css'
Plugin 'darthmall/vim-vue'
Plugin 'mxw/vim-jsx'
Plugin 'justinj/vim-react-snippets'

"
Plugin 'Lokaltog/vim-powerline'
Plugin 'delimitMate.vim'
Plugin 'Mark--Karkat'
Plugin 'scrooloose/nerdtree'
Plugin 'majutsushi/tagbar'
Plugin 'tmhedberg/SimpylFold'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'vim-syntastic/syntastic'
Plugin 'honza/vim-snippets'
Plugin 'ybian/smartim'
Plugin 'godlygeek/tabular'
" Plugin 'SirVer/ultisnips'

Plugin 'taglist.vim'
let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1
" always use mouse 
" set mouse=a 

" 启动vim自动打开taglist
let Tlist_Auto_Open=1 
" 不同时显示多个文件的tag，只显示当前文件的
let Tlist_Show_One_File=1   
" 如果taglist窗口是最后一个窗口，则退出vim 
let Tlist_Exit_OnlyWindow=1   

Plugin 'fatih/vim-go'
Plugin 'Blackrush/vim-gocode'

let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1

Plugin 'plasticboy/vim-markdown'
Plugin 'Valloric/YouCompleteMe'  
call vundle#end()

" required

" 设置tab：
set tabstop=4
" 行宽
set textwidth=90
" set et "将ＴＡＢ替换成空格
setlocal et sta sw=4 sts=4
au BufNewFile,BufRead  *.py set tabstop=4 softtabstop=4 textwidth=79  fileformat=unix

syntax on
filetype plugin indent on 

" 自动、智能缩进
autocmd FileType python setlocal ts=4 sts=4 sw=4 expandtab
autocmd FileType javascript setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType html setlocal ts=2 sts=2 sw=2 expandtab
autocmd BufRead *.css setlocal ts=2 sts=2 sw=2 expandtab
autocmd BufRead *.json setlocal ts=2 sts=2 sw=2 expandtab
autocmd BufRead *.vue setlocal ts=2 sts=2 sw=2 expandtab
autocmd BufRead *.wxml setlocal ts=2 sts=2 sw=2 expandtab
autocmd BufRead *.wxss setlocal ts=2 sts=2 sw=2 expandtab
autocmd BufRead *.yaml setlocal ts=2 sts=2 sw=2 expandtab

" 设置主题  
if has('gui_running')
    set background=dark colorscheme solarized
    else
        " colorscheme zenburn
         colorscheme desert
        " colorscheme monokai
endif

" set autoindent
set fileformat=unix

" paste toggle
set pastetoggle=<F11>

" 编码
set encoding=utf-8
let &termencoding=&encoding
set fileencodings=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936,iso-8859-6

" 高亮光标所在行
" set cul

" 启动的时候不显示那个援助乌干达儿童的提示  
set shortmess=atI
" 不要图形按钮  
set go= 
" 设置字体  
set guifont=Courier_New:h10:cANSI   
" 显示标尺  
set ruler 
" 输入的命令显示出来，看的清楚些  
set showcmd   

" 状态行显示的内容  
"set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}  
" 启动显示状态行(1),总是显示状态行(2)  
"
set laststatus=2    
" 允许折叠 
set foldenable     
set fdm=indent

" 空格折叠
nnoremap <space> za
nnoremap <C-j> zR


" 显示中文帮助
if version >= 603
	set helplang=cn
	set encoding=utf-8
endif

" 显示行号
set number
" 历史记录数
set history=1000

" 搜索逐字符高亮
set hlsearch
set incsearch

" 自动折行
" set nowrap
 set wrap

" 在html标签之间跳转(%)
runtime macros/matchit.vim

autocmd BufNewFile * normal G

" 共享剪贴板  
set clipboard+=unnamed 
" 自动保存
set autowrite

" 设置当文件被改动时自动载入
set autoread


" 注释的时候自动加个空格, 强迫症必配
let g:NERDSpaceDelims=1



" 将tab替换为空格
nmap tt :%s/\t/    /g<CR>

" map
imap <C-l> if __name__ == '__main__': <CR>

imap <C-k> <Esc>

" 打开树状文件目录  
map <F3> :NERDTreeToggle<CR>
imap <F3> <ESC> :NERDTreeToggle<CR>
map <C-F3> \be  
" Tlist
map <F2> :Tlist<CR>
imap <F2> <ESC> :Tlist<CR>

" 不显示帮助信息
let NERDTreeMinimalUI=1
" 鼠标点击                            
let NERDTreeMouseMode = 2
" 宽度
let g:NERDTreeWinSize = 28
" 忽略文件、隐藏文件
let NERDTreeIgnore = ['\.pyc$','\.pyo$', '__pycache__']
let NERDTreeSortOrder=['\/$', 'Makefile', 'makefile', '*', '\~$']

" jedi
let g:jedi#goto_assignments_command = "<C-]>"
let g:jedi#usages_command = "<C-u>"
let g:jedi#documentation_command = "<C-g>"

" pydiction
let g:pydiction_location = '~/.vim/bundle/pydiction/complete-dict'
let g:pydiction_menu_height = 30

" power-line
set nocompatible   " Disable vi-compatibility
set laststatus=2   " Always show the statusline
set encoding=utf-8 " Necessary to show Unicode glyphs"

" ycm
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/.ycm_extra_conf.py'
" 让Vim的补全菜单行为与一般IDE一致
set completeopt=longest,menu                
" 不用每次提示加载.ycm_extra_conf.py文件
let g:ycm_confirm_extra_conf = 0              
" 关闭ycm的syntastic
let g:ycm_show_diagnostics_ui = 0

" 评论中也应用补全
let g:ycm_complete_in_comments = 1        
" 两个字开始补全
let g:ycm_min_num_of_chars_for_completion = 2   
" 开启 YCM 基于标签引擎
let g:ycm_collect_identifiers_from_tags_files=1
let g:ycm_filetype_specific_completion_to_disable = {"python":1}
" 禁止缓存匹配项,每次都重新生成匹配项
let g:ycm_cache_omnifunc=0
" 关键字补全  
let g:ycm_seed_identifiers_with_syntax = 1
" 上下左右键的行为 会显示其他信息
inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-k>\<C-j>" : "\<PageDown>"
inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-k>\<C-j>" : "\<PageUp>"
" set YouCompleteMe trigger key 
let g:ycm_key_list_select_completion = ['<C-j>', '<Down>']
let g:ycm_key_list_select_completion = ['<Down>']
let g:ycm_key_list_previous_completion = ['<C-k>', '<Up>']
let g:ycm_key_list_previous_completion = ['<Up>']
let g:ycm_server_keep_logfiles = 1
let g:ycm_server_log_level = 'debug'
"离开插入模式后自动关闭预览窗口
 autocmd InsertLeave * if pumvisible() == 0|pclose|endif   
"回车即选中当前项
inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"  

let g:ycm_key_invoke_completion = '<Enter>'
let g:ycm_semantic_triggers =  {'c' : ['->', '.'], 'objc' : ['->', '.'], 'ocaml' : ['.', '#'], 'cpp,objcpp' : ['->', '.', '::'], 'php' : ['->', '::'], 'cs,java,javascript,vim,coffee,python,scala,go' : ['.'], 'ruby' : ['.', '::']}

autocmd BufRead *.py nnoremap <C-]> :YcmCompleter GoTo<CR>
autocmd BufRead *.js nnoremap <C-]> :TernDef<CR>


" 离开插入模式后自动关闭预览窗口
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
" 回车即选中当前项
inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"

" 当前目录查找
let g:ctrlp_working_path_mode = 'ra'

"markdown
let g:vim_markdown_folding_style_pythonic = 1
let g:vim_markdown_toc_autofit = 1
" autocmd BufRead *.md nmap tb :Toc<cr>


"Asynchronous Lint Engine configuration
let g:ale_sign_column_always = 1
"define the ale coin
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚡'
"let vim statusline combine ale
let g:ale_statusline_format = ['✗ %d', '⚡ %d', '✔ OK']
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_lint_on_enter = 1
let g:ale_set_highlights = 0
" Show 5 lines of errors (default: 10)
let g:ale_list_window_size = 10
" Set this. Airline will handle the rest.
let g:airline#extensions#ale#enabled = 1
"普通模式下，sp前往上一个错误或警告，sn前往下一个错误或警告
nmap sp <Plug>(ale_previous_wrap)
nmap sn <Plug>(ale_next_wrap)
""<Leader>s触发/关闭语法检查
nmap <Leader>s :ALEToggle<CR>
"<Leader>d查看错误或警告的详细信息
nmap <Leader>d :ALEDetail<CR>
let g:ale_linters = {
\   'python': ['pylint'],
\   'ansible': ['ansible'],
\}



" let g:ycm_key_invoke_completion = '<Enter>'
" let g:ycm_semantic_triggers =  {'c' : ['->', '.'], 'objc' : ['->', '.'], 'ocaml' : ['.', '#'], 'cpp,objcpp' : ['->', '.', '::'], 'php' : ['->', '::'], 'cs,java,javascript,vim,coffee,python,scala,go' : ['.'], 'ruby' : ['.', '::']}
" 
" autocmd BufRead *.py nnoremap <C-]> :YcmCompleter GoTo<CR>
" autocmd BufRead *.js nnoremap <C-]> :TernDef<CR>




:autocmd BufRead,BufNewFile *.dot map <F5> :w<CR>:!dot -Tjpg -o %<.jpg % && eog %<.jpg  <CR><CR> && exec "redr!"
"C，C++,python,golang,java,sh 按F5编译运行
map <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
	exec "w"
	if &filetype == 'c'
		exec "!g++ % -o %<"
		exec "!time ./%<"
	elseif &filetype == 'cpp'
		exec "!g++ % -o %<"
		exec "!time ./%<"
	elseif &filetype == 'java' 
		exec "!javac %" 
		exec "!time java %<"
	elseif &filetype == 'sh'
		:!time bash %
	elseif &filetype == 'python'
		exec "!time python3 %"
    elseif &filetype == 'html'
        exec "!firefox % &"
    elseif &filetype == 'go'
"        exec "!go build %<"
         exec "!time go run %"
    elseif &filetype == 'mkd'
        exec "!~/.vim/markdown.pl % > %.html &"
        exec "!firefox %.html &"
	endif
endfunc

"代码格式优化
"
map <F6> :call FormartSrc()<CR><CR>
func FormartSrc()
    exec "w"
    if &filetype == 'c'
        exec "!astyle --style=ansi -a --suffix=none %"
    elseif &filetype == 'cpp' || &filetype == 'hpp'
        exec "r !astyle --style=ansi --one-line=keep-statements -a --suffix=none %> /dev/null 2>&1"
    elseif &filetype == 'perl'
        exec "!astyle --style=gnu --suffix=none %"
    elseif &filetype == 'py'||&filetype == 'python'
        exec "r !autopep8 -i --aggressive %"
    elseif &filetype == 'java'
        exec "!astyle --style=java --suffix=none %"
    elseif &filetype == 'jsp'
        exec "!astyle --style=gnu --suffix=none %"
    elseif &filetype == 'xml'
        exec "!astyle --style=gnu --suffix=none %"
    else
        exec "normal gg=G"
        return
    endif
    exec "e! %"
endfunc
"结束定义FormartSrc

" macos
set backspace=indent,eol,start
if has('mac') && ($TERM == 'xterm-256color' || $TERM == 'screen-256color')
		map <Esc>OP <F1>
		map <Esc>OR <F3>
		map <Esc>OS <F4>
		map <Esc>[16~ <F5>
		map <Esc>[17~ <F6>
		map <Esc>[18~ <F7>
		map <Esc>[19~ <F8>
		map <Esc>[20~ <F9>
		map <Esc>[21~ <F10>
		map <Esc>[23~ <F11>
		map <Esc>[24~ <F12>
endif

" 设置根据后缀名添加不同文件内容
autocmd BufNewFile *.cpp,*.[ch],*.sh,*.java,*.py exec ":call SetTitle()" 
func SetTitle() 
      if &filetype == 'sh' 
        call setline(1,"\#!/bin/bash") 
        call append(line("."), "")
        call append(line(".")+1, "# Author:")
        call append(line(".")+2, "# Mail: ")
        call append(line(".")+3, "# Platform:") 
     	call append(line(".")+4, "# Date:".strftime("%c"))
        call append(line(".")+5, "")
      elseif &filetype == 'python'
        call setline(1,"#!/usr/bin/env python")
        call append(line("."),"# coding=utf-8")
	    call append(line(".")+1, "")
        call append(line(".")+2, "# Author:ymc023")
        call append(line(".")+3, "# Mail: ")
        call append(line(".")+4, "# Platform:") 
	    call append(line(".")+5, "# Date:".strftime("%c"))
        call append(line(".")+6, "")
      else
		call setline(1, "/*************************************************************************") 
        call append(line("."), "      > File Name: ".expand("%"))
        call append(line(".")+1, "	 > Author: ") 
		call append(line(".")+2, "	 > Mail: ") 
        call append(line(".")+3, "	 > Platform:")
		call append(line(".")+4, "	 > Date: ".strftime("%c"))
		call append(line(".")+5, " ************************************************************************/") 
		call append(line(".")+6, "")
      endif
      if expand("%:e") == 'cpp'
		call append(line(".")+6, "#include<iostream>")
		call append(line(".")+7, "using namespace std;")
		call append(line(".")+8, "")
  	  endif
	  if &filetype == 'c'
		call append(line(".")+6, "#include<stdio.h>")
		call append(line(".")+7, "")
	  endif
	  if expand("%:e") == 'h'
		call append(line(".")+6, "#ifndef _".toupper(expand("%:r"))."_H")
		call append(line(".")+7, "#define _".toupper(expand("%:r"))."_H")
		call append(line(".")+8, "#endif")
      endif
      if &filetype == 'java'
		call append(line(".")+6,"public class ".expand("%:r"))
		call append(line(".")+7,"")
	  endif

endfunc 




let Tlist_Ctags_Cmd='/usr/local/bin/ctags'
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1
let python_highlight_all=1
let g:SimpylFold_docstring_prview=1
let g:indentLine_char = '|'




" 映射全选+复制 ctrl+a
map <C-A> ggVGY
map! <C-A> <Esc>ggVGY



"去空行  
nnoremap <F4> :g/^\s*$/d<CR> 

"比较文件  
" nnoremap <F8> :vert diffsplit <CR>

" 去掉输入错误的提示声音
set noeb
" 自动缩进
set autoindent
set cindent
"map <F12> gg=G

"搜索忽略大小写
set ignorecase
" 使回格键（backspace）正常处理indent, eol, start等
set backspace=2
" 在被分割的窗口间显示空白，便于阅读
set fillchars=vert:\ ,stl:\ ,stlnc:\

" 高亮显示匹配的括号
" hi MatchParen ctermbg=Yellow guibg=lightblue
set showmatch
" 匹配括号高亮的时间（单位是十分之一秒）
set matchtime=15


" 建立文件浏览explorer和tagsexplorer
let g:winManagerWindowLayout='FileExplorer|TagsExplorer'
map wm :WMToggle<cr>

" 快速注释：选中代码块后F9注释， 取消注释F10
map <F9> <leader>cc
map <F10> <leader>cu

" 转大写
vmap <F8> gUU <CR>


"粘贴,需要vim  clipboard 支持，通过vim --version|grep clipboard查看 
nmap <C-t> "+p
" 选中状态下 Ctrl+c 复制
vmap <C-c> "+y

" golang
imap <F12> <ESC> :Tagbar <CR> 
nmap <F12> :Tagbar <CR>






" vimrc文件定义快捷键备注
" F2 Tlist 
" F3 NERDTreeToggle 
" F4 去掉全文空格 
" F5 编译运行,会自动根据扩展名调用
" F6 代码格式化
"
" F8 转大写 
" F9 选中代码块后注释 
" F10 选中代码块后取消注释 
" F11 pastetoggle,set paste模式,开启后粘贴内容不变形 
" F12 Tagbar,golang 
" ctrl+j  展开折叠代码 
" space   折叠代码 
" ctrl+l  输入python的if __name__ == '__main__': 
"



