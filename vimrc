" @copyleft, let me know if you find anything bad
set nocompatible
filetype off " required for Vundle management plugin

" in order to use the plugin/vundle, do this first!!!!!
"
" git clone https://github.com/VundleVim/Vundle.vim.git  ~/.vim/bundle/Vundle.vim

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim   "required
call vundle#begin() "required
" Pluginclean will delete unactived plugin and delete directory
Plugin 'VundleVim/Vundle.vim' " let Vundle manage Vundle, required

Plugin 'AutoComplPop'   " auto completion
Plugin 'OmniCppcomplete'   " auto completion
Plugin 'Tagbar' " to list the invoke struction of current file/code
Plugin 'bling/vim-airline' " sugar for eyes -status line 
"Plugin 'flazz/vim-colorschemes' " use to change colorscheme but no use now
Plugin 'c.vim' " use to edit c file by inserting (){}comments, etc
Plugin 'snipMate' " to expand for to for(....)
Plugin 'scrooloose/syntastic' " use to check syntax error
Plugin 'Mark' " use to highlight marks, i.e., multiply keywords can be highlighted
"Plugin 'vim-scripts/Conque-GDB'
Plugin 'scrooloose/nerdcommenter'
Plugin 'yonchu/accelerated-smooth-scroll'
Plugin 'terryma/vim-multiple-cursors' "https://github.com/terryma/vim-multiple-cursors
"https://github.com/xuhdev/vim-latex-live-preview, :LLPStartPreview 
Plugin 'xuhdev/vim-latex-live-preview'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'rust-lang/rust.vim'

"front end
"Plugin 'jelera/vim-javascript-syntax'
"git clone https://github.com/vim-scripts/JavaScript-Indent.git
"description: https://github.com/ternjs/tern_for_vim
"git clone https://github.com/ternjs/tern_for_vim.git
"Plugin 'javascript-libraries-syntax'
"Plugin 'JulesWang/css.vim'

"color theme
Plug 'agude/vim-eldar'
" smooth motion, c-d, c-u
Plug 'yuttie/comfortable-motion.vim'
"show indent
Plug 'yuttie/comfortable-motion.vim'
"Whitespace highlighting is enabled by default, with a highlight color of red.
Plugin 'ntpeters/vim-better-whitespace'
"An always-on highlight for a unique character in every word on a line to help you use f, F and family.
Plugin 'unblevable/quick-scope'
"for Java
Plugin 'artur-shaik/vim-javacomplete2'
Plugin 'java.vim'
"Plugin 'mhizn/startify.vim'

" Keep Plugin commands between vundle#begin/end.
" All of your Plugins must be added before the following line
call vundle#end()            " required

" Besides using Vundle for pluins, there are some that being copied to "~/.vim/plugin/" directly
" find all plugins that cannot use Vundle in scsw.sh
" list here also: https://github.com/xuhdev/vim-latex-live-preview

filetype plugin indent on    " required


" To ignore plugin indent changes
filetype on
"  to use smart intent for languages.
filetype indent on

"colorscheme Chasing_Logic
" allow to using different color scheme to replace default settings
syntax on
" turn on syntax highlight function
syntax enable
silent! colorscheme eldar " Custom color scheme
set t_Co=256
set background=dark

set number
set relativenumber

set nobackup
set nowrap  " display long lines as just one line 
set nowrapscan "stop searching wrap around
set noswapfile
"to enable auto clipboard copy, need to "sudo apt-get install vim-gui-common"
set clipboard=unnamedplus
set wildmenu

set cursorline cursorcolumn
"hi cursorcolumn ctermfg=none ctermbg=69 cterm=none
hi Search ctermfg=none ctermbg=21 cterm=none

" change color settings for OmniCppcomplete
" selected highlight to red and options are green
highlight PmenuSel ctermfg=green ctermbg=black gui=bold

"change cursor color
if &term =~ "xterm\\|rxvt"
" use an orange cursor in insert mode
    let &t_SI = "\<Esc>]12;orange\x7"
" use a red cursor otherwise
    let &t_EI = "\<Esc>]12;red\x7"
    silent !echo -ne "\033]12;red\007"
" reset cursor when vim exits
    autocmd VimLeave * silent !echo -ne "\033]112\007"
" use \003]12;gray\007 for gnome-terminal and rxvt up to version 9.21
endif

"show tab number 
if exists("+showtabline")
     function MyTabLine()
         let s = ''
         let t = tabpagenr()
         let i = 1
         while i <= tabpagenr('$')
             let buflist = tabpagebuflist(i)
             let winnr = tabpagewinnr(i)
             let s .= '%' . i . 'T'
             let s .= (i == t ? '%1*' : '%2*')
             let s .= ' '
             let s .= i . ')'
             let s .= ' %*'
             let s .= (i == t ? '%#TabLineSel#' : '%#TabLine#')
             let file = bufname(buflist[winnr - 1])
             let file = fnamemodify(file, ':p:t')
             if file == ''
                 let file = '[No Name]'
             endif
             let s .= file
             let i = i + 1
         endwhile
         let s .= '%T%#TabLineFill#%='
         let s .= (tabpagenr('$') > 1 ? '%999XX' : 'X')
         return s
     endfunction
     set stal=2
     set tabline=%!MyTabLine()
endif
      
set encoding=utf8
set fileformat=unix

set hlsearch   "search highlighting
set incsearch  "show match as search proceeds
set ignorecase  "case insensitive

set mouse=a

set expandtab
set tabstop=4
set shiftwidth=4
set smartcase  "use case if any caps used 

set autoindent
"set cindent
set smartindent


set lazyredraw
set showmatch  "show matching bracket
set mat=2

" Always show the status line
set laststatus=2

" Return to last edit position when opening files
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif


" ---- > configuration for plugins 
"tagbar.vim
let g:tagbar_left=1
let g:tagbar_autofocus=1
let g:tagbar_autoclose=1

"mark.vim
let g:mwDefaultHighlightingNum=18
let g:mwDefaultHighlightingPalette = 'maximum'
let g:mwAutoSaveMarks=0
let g:mwIgnoreCase=0

"Syntastic.vim
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_loc_list_height=5

"Plugin 'octol/vim-cpp-enhanced-highlight'
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_experimental_simple_template_highlight = 1
let g:cpp_experimental_template_highlight = 1
let g:cpp_concepts_highlight = 1

"have indent guides enabled by default
let g:indent_guides_enable_on_vim_startup = 1
" for startify.vim to disable the cowboy quote
"let g:startify_custom_header = []

" for nerdcommenter: allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
"commands:　"，cu": uncomment, ",cc":comment, ",cm":comment only use one set multipart delimiters 
" more ",cs": comment with pretty block formatted layout, ",cy": Same as cc except that the commented line(s) are yanked first.
" more: https://github.com/scrooloose/nerdcommenter
" for quick-scope
" Trigger a highlight in the appropriate direction when pressing these keys:
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
" Trigger a highlight only when pressing f and F.
let g:qs_highlight_on_keys = ['f', 'F']
"for syntax
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" cscope.vim, without this, quickfix windown won't show all reference function positions/calls/files
if has("cscope")
	set csprg=/usr/bin/cscope
    set csto=1
    set cst
    set nocsverb
    if filereadable("cscope.out")
		cs add $PWD/cscope.out
" else add database pointed to by environment
	elseif $CSCOPE_DB != ""
"		echom $CSCOPE_DB
"		sleep 500
"		cs add $CSCOPE_DB
    endif
"	cs add /home/user/cscope/mib2v7_fw5.31.22/cscope.out /home/user/
"	if (set csverb) is enabled, then the search results will be displayed twice
"	in quickfix window!!!!!
"    set csverb
endif
" --------> set map leader etc
let mapleader=","

nnoremap <space> :
vnoremap <space> :

" <F8> is used as "Enter"
map <F8> o<ESC>
" show function name in normal mode only
" use current directory
set tags=$PWD/tags
set autochdir

" --- > shortkeys for plugins
""mark.vim
nmap <silent> <leader>hl <Plug>MarkSet
vmap <silent> <leader>hl <Plug>MarkSet
nmap <silent> <leader>hh <Plug>MarkClear
vmap <silent> <leader>hh <Plug>MarkClear


nnoremap <silent> <F2> :TagbarToggle<CR>  
" switch between header/source with F4
nnoremap <silent> <F4> :e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>
" " recreate tags file with F5
"map <F5> :!ctags -R –c++-kinds=+p –fields=+liaS –extra=+q --language-force=c++ .<CR>

"cscope
function! LoadCscope()
    let db = findfile("cscope.out", ".;")
    :echom db
    if (!empty(db))
        let path = strpart(db, 0, match(db, "/cscope.out$"))
        :echom path
        set nocscopeverbose " suppress 'duplicate connection' error
        exe "cs add " . db . " " . path
        set cscopeverbose
    endif
endfunction
au BufEnter /* call LoadCscope()
""tags
"set autochdir
"set tags=tags; "use the other one
"
nmap <leader>cs : cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <leader>cg : cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <leader>cc : cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <leader>cd : cs find d <C-R>=expand("<cword>")<CR><CR>
nmap <leader>ct : cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <leader>ce : cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <leader>cf : cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <leader>ci : cs find i ^<C-R>=expand("<cfile>")<CR>$<CR> 
