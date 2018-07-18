filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
if filereadable(expand("~/.vimrc.bundles"))
source ~/.vimrc.bundles
endif
nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
let $LANG="zh_CN.UTF-8"
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8
map <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>  
set tags=tags;
"set autochdir
set hlsearch
set number
set relativenumber
set laststatus=2
hi Comment ctermfg =blue
set clipboard=unnamed
behave mswin

filetype plugin indent on
set expandtab
set shiftwidth=4
set tabstop=4

let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 0
let g:indent_guides_guide_size = 1 
let g:indent_guides_start_level = 2
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=3
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4
hi IndentGuidesOdd guibg=red ctermbg=3
hi IndentGuidesEven guibg=green ctermbg=4

let g:Powerline_symbols = 'fancy'
let g:Powerline_symbols = 'unicode'
set t_Co=256

"let g:winManagerWindowLayout="NERDTree|BufExplorer|Tagbar"
let g:winManagerWindowLayout="NERDTree|Tagbar"
let g:winManagerWidth = 30
let g:AutoOpenWinManager =  1
let g:defaultExplorer = 0
nmap <C-W><C-F> :FirstExplorerWindow<cr>
nmap <C-W><C-B> :BottomExplorerWindow<cr>


"taglist{
let Tlist_Show_One_File = 1
let Tlist_Exit_OnlyWindow = 1
let Tlist_Use_Right_Window = 1
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_Ctags_Cmd='/usr/bin/ctags'
nnoremap <leader>tl : Tlist<CR>
"}

let g:NERDTree_title="[NERDTree]"
function! NERDTree_Start()
exe 'q'
exe 'NERDTree'
endfunction
"exec 'NERDTree'
"endfunction
function! NERDTree_IsValid()
return 1
endfunction


noremap <f5> :NERDTreeFind<cr>


let g:Tagbar_title = "[Tagbar]"
function! Tagbar_Start()
exe 'q' 
exe 'TagbarOpen'
endfunction
function! Tagbar_IsValid()
return 1
endfunction
let g:tagbar_vertical = 30

"nnoremap yw  :<C-U>YRYankCount 'yw'<CR>    
"nnoremap fz  :<C-U>YRYankCount 'yw'<CR>    
let g:yankring_window_auto_close = 0
let g:yankring_manage_numbered_reg = 1
let g:yankring_window_use_horiz = 0  " Use vertical split
let g:yankring_window_use_right = 1
let g:yankring_window_width = 30
let g:yankring_enabled = 0  " Disables the yankring
let g:yankring_map_dot = 1
let g:yankring_min_element_length = 4
let g:yankring_max_element_length = 15
nmap <leader>yr :YRGetElem<CR>
nnoremap <silent> <F11> :YRShow<CR>
" 窗口切换  
nnoremap <c-h> <c-w>h  
nnoremap <c-l> <c-w>l  
nnoremap <c-j> <c-w>j  
nnoremap <c-k> <c-w>k  

nmap <leader>cs :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <leader>cg :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <leader>cc :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <leader>ct :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <leader>ce :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <leader>cf :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <leader>ci :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <leader>cd :cs find d <C-R>=expand("<cword>")<CR><CR>
set cscopequickfix=s-,c-,d-,i-,t-,e-
cs add /home/vagrant/emup/src/path/emup.out /home/vagrant/emup/src
"let g:vimshell_prompt_pattern ='^ \％（\ f \ | \\。\）\ +>'

vnoremap <silent> <C-T> <Esc>:Ydv<CR> 
nnoremap <silent> <C-T> <Esc>:Ydc<CR> 
noremap <leader>yd :Yde<CR> 

"set keywordprg=sdcv
map \ft :r!sdcv <c-r><c-w> <CR>
"
function! Mydict()
    let expl=system('sdcv -n ' .
        \ expand("<cword>"))
    windo if
        \ expand("%")=="diCt-tmp" |
        \ q!|endif
    25sp diCt-tmp
    setlocal buftype=nofile bufhidden=hide noswapfile
    1s/^/\=expl/
    1   
endfunction
nmap F :call Mydict()<CR>



"function! Mymake()
" """   let expl=system('cmake -DCORTEX-A8=ON -DEMUP=ON -DCMAKE_BUILD_TYPE=Release ../../&&make ' .
"""     let expl=system('cd /home/vagrant/emup/build/Release')
"     let expl=system(' cmake -DCORTEX-A8=ON -DEMUP=ON -DCMAKE_BUILD_TYPE=Release ../../ ') 
"     let expl=system('make ')
"""       \ expand("<cword>"))
"    windo if
"        \ expand("%")=="make-tmp" |
"        \ q!|endif
"    25sp make-tmp
"    setlocal buftype=nofile bufhidden=hide noswapfile
"    1s/^/\=expl/
"    1   
"endfunction
"nmap M :call Mymake()<CR>

"nmap F :r!sdcv


"let g:vimshell_vimshrc_path =
"      \ substitute(fnamemodify(get(
"      \   g:, 'vimshell_vimshrc_path', '~/.vimshrc'),
"      \  ':p'), '\\', '/', 'g')
"let g:vimshell_escape_colors =
"      \ get(g:, 'vimshell_escape_colors', [
"        \ '#6c6c6c', '#ff6666', '#66ff66', '#ffd30a',
"        \ '#1e95fd', '#ff13ff', '#1bc8c8', '#c0c0c0',
"        \ '#383838', '#ff4444', '#44ff44', '#ffb30a',
"        \ '#6699ff', '#f820ff', '#4ae2e2', '#ffffff',
"        \])
"

syntax enable
syntax on
"colorscheme koehler
colorscheme morning

"highlight aa ctermfg=130 ctermbg=1 cterm=bold guifg=#c0c000 gui=bold
"highlight bb ctermfg=130 ctermbg=12 cterm=bold guifg=#c0c000 gui=bold
"highlight cc ctermfg=130 ctermbg=81 cterm=bold guifg=#c0c000 gui=bold
"highlight dd ctermfg=130 ctermbg=242 cterm=bold guifg=#c0c000 gui=bold
"highlight ee ctermfg=130 ctermbg=13 cterm=bold guifg=#c0c000 gui=bold

 highlight aa ctermfg=7 ctermbg=242 guifg=LightGrey guibg=DarkGrey
 highlight bb term=reverse ctermbg=224 gui=undercurl guisp=Red
 highlight cc term=reverse ctermbg=81 gui=undercurl guisp=Blue
 highlight dd term=reverse ctermbg=225 gui=undercurl guisp=Magenta
 highlight ee term=underline ctermbg=14 gui=undercurl guisp=DarkCyan

highlight Search term=standout ctermfg=0 ctermbg=151 guifg=Blue guibg=Yellow

nmap <leader>cma :syntax match aa /<C-R>=expand("<cword>")<CR>/<CR>
nmap <leader>cmb :syntax match bb /<C-R>=expand("<cword>")<CR>/<CR>
nmap <leader>cmc :syntax match cc /<C-R>=expand("<cword>")<CR>/<CR>
nmap <leader>cmd :syntax match dd /<C-R>=expand("<cword>")<CR>/<CR>
nmap <leader>cme :syntax match ee /<C-R>=expand("<cword>")<CR>/<CR>

autocmd InsertLeave * se cul "行高亮"
"highlight CurrentLine term=reverse ctermbg=224 gui=undercurl guisp=NONE guifg=LightGrey guibg=Blue
"highlight CurrentLine term=reverse ctermbg=224 gui=undercurl guisp=NONE guifg=LightGrey guibg=NONE
highlight CursorLine  term=reverse ctermbg=3 gui=undercurl guisp=Blue guifg=LightGrey guibg=Blue
highlight CursorColumn term=reverse ctermbg=3 gui=undercurl guisp=Red guifg=c0c000 guibg=Red
set cursorline "行高亮生效"
set cursorcolumn "列高亮生效"


