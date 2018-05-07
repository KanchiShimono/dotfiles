"*********************************************************************
"        _                    
" __   _(_)_ __ ___  _ __ ___ 
" \ \ / / | '_ ` _ \| '__/ __|
"  \ V /| | | | | | | | | (__ 
"   \_/ |_|_| |_| |_|_|  \___|
"
"*********************************************************************

" Neovim or Vim detection {{{1
let is_nvim = has('nvim')
" }}}

" Installed Plugins by vim-plug {{{1
if has('vim_starting')
  if is_nvim
	  if !filereadable(expand('~/.local/share/nvim/site/autoload/plug.vim'))
		  echo 'install vim-plug for Neovim...'
		  call system('curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim')
	  end
  else
	  if !filereadable(expand('~/.vim/autoload/plug.vim'))
		  echo 'install vim-plug...'
		  call system('curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim')
	  end
  endif
endif

if is_nvim
	call plug#begin('~/.config/nvim/plugged')
else
	call plug#begin('~/.vim/plugged')
endif
" Plug 'junegunn/vim-plug',
"         \ {'dir': '~/.vim/plugged/vim-plug/autoload'}

" Add plugin from here {{{2

"< Help in Japanese >
Plug 'vim-jp/vimdoc-ja'

"< Color scheme (:Unite colorscheme -auto-preview) > {{{3
" Plug 'altercation/vim-colors-solarized' " solarized
Plug 'jwhitley/vim-colors-solarized'    " solarized for syntastic
Plug 'croaker/mustang-vim'              " mustang
Plug 'jeffreyiacono/vim-colors-wombat'  " wombat
Plug 'nanotech/jellybeans.vim'          " jellybeans
Plug 'vim-scripts/Lucius'               " lucius
Plug 'vim-scripts/Zenburn'              " zenburn
Plug 'mrkn/mrkn256.vim'                 " mrkn256
" Plug 'jpo/vim-railscasts-theme'         " railscasts
Plug 'therubymug/vim-pyte'              " pyte
Plug 'tomasr/molokai'                   " molokai
Plug 'chriskempson/vim-tomorrow-theme'  " tomorrow night
Plug 'vim-scripts/twilight'             " twilight
Plug 'w0ng/vim-hybrid'                  " hybrid
Plug 'KeitaNakamura/railscasts.vim'		" railscasts
Plug 'joshdick/onedark.vim'				" onedark
Plug 'KeitaNakamura/neodark.vim'		" neodark
" }}}

Plug 'equalsraf/neovim-gui-shim'

"< Auto complete > {{{3
if is_nvim "For Neovim
	Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
	Plug 'Shougo/neoinclude.vim' "| Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins'}
	" Plug 'zchee/deoplete-clang', { 'for': ['c', 'cpp'] }
	Plug 'zchee/deoplete-jedi', { 'for': 'python' }
	Plug 'JuliaEditorSupport/deoplete-julia', { 'for': 'julia' }
	Plug 'landaire/deoplete-d', { 'for': 'd' }
	Plug 'mitsuse/autocomplete-swift', { 'for': 'swift' }
	Plug 'zchee/deoplete-go', { 'do': 'make', 'for': 'go' }
	Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern', 'for': 'javascript' }
	Plug 'poppyschmo/deoplete-latex', { 'for': 'tex' }
	Plug 'Shougo/neco-vim', { 'for': 'vim' }
	Plug 'autozimu/LanguageClient-neovim', {
	            \ 'branch': 'next',
	            \ 'do': 'bash install.sh'
	\ }
else "For Vim
	Plug 'Shougo/deoplete.nvim'
	Plug 'roxma/nvim-yarp'
	Plug 'roxma/vim-hug-neovim-rpc'
	Plug 'zchee/deoplete-jedi', { 'for': 'python' }
	Plug 'zchee/deoplete-go', { 'for': 'go' }
	" Plug 'Shougo/neocomplete'
	Plug 'Omnisharp/omnisharp-vim', { 'for': 'cs' }
	" Plug 'davidhalter/jedi-vim', { 'for': 'python' }
endif
"For common
" You need to compile YCM with semantic support for C-family languages:
" cd ~/.vim/bundle/YouCompleteMe
" ./install.sh --clang-completer
Plug 'Valloric/YouCompleteMe', { 'for': ['c', 'cpp'], 'do': './install.py --clang-completer --gocode-completer' }
Plug 'artur-shaik/vim-javacomplete2', { 'for': 'java' }
" }}}

"< Syntax > {{{3
"< Syntax check >
Plug 'w0rp/ale'

"< Syntax each language >
" julia-vim is not only for julia but also
" for other filetypes. Bacause julia-vim support unicode strings by Latex style
Plug 'JuliaEditorSupport/julia-vim'
Plug 'zyedidia/julialint.vim', { 'for': 'julia' }
Plug 'vim-jp/cpp-vim', { 'for': 'cpp' }
Plug 'JesseKPhillips/d.vim', { 'for': 'd' }
" If you wrote Plug 'apple-swift' before vim-swift, apple-swift's syntax highlight is used
" Instoll to custom directory '~/.vim/custom/apple-swift' for syntax highlight
"Plug 'apple-swift', { 'dir': '~/.vim/custom/apple-swift', 'for': 'swift', 'frozen': 1}
Plug 'kballard/vim-swift', { 'for': 'swift' }
Plug 'fatih/vim-go', { 'for': 'go' }
Plug 'lervag/vimtex', { 'for': 'tex' }
Plug 'tpope/vim-markdown', { 'for': 'markdown' }

"< Highlight >
Plug 'skroll/vim-taghighlight'
if is_nvim
	Plug 'arakashic/chromatica.nvim', { 'do': ':UpdateRemotePlugins' }
	Plug 'billyvg/tigris.nvim', { 'do': './install.sh' }
	Plug 'KeitaNakamura/highlighter.nvim', { 'do': ':UpdateRemotePlugins' }
else
	Plug 'jeaye/color_coded'
endif
" }}}

"< tex conceal >
" Plug 'KeitaNakamura/tex-conceal.vim', {'for': 'tex'}

"< File explorer >
Plug 'scrooloose/nerdtree'
Plug 'kien/ctrlp.vim'
Plug 'rking/ag.vim'
" Plug 'Shougo/unite.vim'
" Plug 'Shougo/vimfiler.vim'
" Plug 'ujihisa/unite-colorscheme'

"< Git wrapper >
Plug 'tpope/vim-fugitive'

"< vim-surround >
Plug 'tpope/vim-surround'

"< Auto close brackets >
Plug 'jiangmiao/auto-pairs'

"< Ctags >
Plug 'soramugi/auto-ctags.vim'

"< Tagbar >
Plug 'majutsushi/tagbar', {'on': 'TagbarToggle'}

"< Status line >
Plug 'itchyny/lightline.vim'
"Plug 'cocopon/lightline-hybrid.vim'
" Plug 'bling/vim-airline'

"< For using gdb debugger >
" Plug 'vim-scripts/Conque-GDB'

"< Comment out >
Plug 'tyru/caw.vim'

"< UltiSnips >
" Plug 'SirVer/ultisnips'

"< Snippets >
" Plug 'honza/vim-snippets'

"< Supertab >
" Plug 'ervandew/supertab'

"< Align >
Plug 'vim-scripts/Align'

"< Indent line >
"Plug 'Yggdroot/indentLine'

"< Indent guides >
Plug 'nathanaelkane/vim-indent-guides'

"< Template >
Plug 'aperezdc/vim-template'

"< Markdown preview >
Plug 'kannokanno/previm'

"< Tmux Navigator >
" Plug 'christoomey/vim-tmux-navigator'

"< Tmux Navigator >
" Plug 'Shougo/vimshell.vim'

"< easymotion >
Plug 'easymotion/vim-easymotion'

" }}}
call plug#end()
" }}}

"  GLOBAL SETTING {{{1

" About me {{{2
let g:user  = "K.Shimono"
let g:email = "shimono-kanchi-yc@ynu.jp"
" }}}

" color setting {{{2
syntax on
" set t_Co=256
" set termguicolors
set background=dark
let g:neodark#use_custom_terminal_theme = 1
" let g:neodark#background = 'gray'
" let g:neodark#use_256color = 1
colorscheme neodark
" let g:molokai_original = 1
" if has("termguicolors")
" 	set termguicolors
" endif
" hi Visual ctermbg=236
" hi CursorLine cterm=underline ctermfg=None ctermbg=None
" hi clear cursorLine
" }}}

" general settig {{{2
set number
set hlsearch
set ignorecase
set smartcase
set tabstop=4
set shiftwidth=4
set incsearch
set whichwrap=b,s,h,l,<,>,[,]
set colorcolumn=80
set laststatus=2
set synmaxcol=350
set nowrap
set noshowmode
set scrolloff=2
set cursorline
set foldmethod=marker
set mouse=a
set encoding=utf-8
set fileencodings=utf-8,sjis
set fileformats=unix,dos,mac
set spelllang=en,cjk
set backspace=indent,eol,start
set clipboard+=unnamed
" set noswapfile
" set guicursor+=i:blinkwait0
" set ambiwidth=double
" set iskeyword=@,48-57,_,-,:,192-255
" }}}

" key mapping {{{2
nnoremap <silent> <C-n> :set cursorline!<CR>
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h
vnoremap <silent> <C-p> "0p<CR>
nnoremap <ESC><ESC> :nohlsearch<CR>
noremap <expr> <F7> LaTeXtoUnicode#Toggle()
inoremap <expr> <F7> LaTeXtoUnicode#Toggle()
inoremap <special> <Esc> <Esc>hl
" nnoremap <C-n> gt
" nnoremap <C-p> gT
" nnoremap j gj
" nnoremap k gk
" }}}

" others setting {{{2
au QuickfixCmdPost make,grep,grepadd,vimgrep copen
let g:tex_conceal = ''
let g:tex_flavor = 'latex'
let g:templates_no_builtin_templates = 1
let g:templates_directory = '~/.vim/template'
let tlist_tex_settings='latex;l:labels;c:chapter;s:sections;t:subsections;u:subsubsections'

if exists('$TMUX')
 let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
 let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
 let &t_SI = "\<Esc>]50;CursorShape=1\x7"
 let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif
" }}}
" }}}

" LOCAL SETTING {{{1
" c++ {{{2
function! s:cpp()
	setlocal path+=./include,../include,/usr/local/include
    setlocal expandtab
    setlocal autoindent
    setlocal smartindent
    setlocal cinoptions+=:0,g0
	" setlocal foldmethod=syntax
	" setlocal foldcolumn=1
    " nnoremap <F5> :make build_run<cr>
    " nnoremap <F6> :make run<cr>
    nnoremap <buffer> <F7> :make<cr>
endfunction

augroup vimrc-cpp
    autocmd!
    autocmd FileType cpp call s:cpp()
augroup END
"}}}
" tex {{{2
function! s:tex()
    setlocal expandtab
	setlocal nocursorline
    " setlocal autoindent
    setlocal spell
	" setlocal wrap
	" setlocal conceallevel=2
	" setlocal concealcursor=""
	" setlocal linebreak
endfunction

augroup vimrc-tex
    autocmd!
    autocmd FileType tex call s:tex()
augroup END
"}}}
" python {{{2
function! s:python()
    setlocal autoindent
    " setlocal smartindent
	setlocal indentkeys+=0#
endfunction

augroup vimrc-phthon
    autocmd!
    autocmd FileType python call s:python()
augroup END
"}}}
" julia {{{2
function! s:julia()
    setlocal expandtab
	setlocal foldmethod=indent
endfunction

augroup vimrc-julia
    autocmd!
    autocmd FileType julia call s:julia()
augroup END
"}}}
" java {{{2
function! s:java()
	setlocal omnifunc=javacomplete#Complete
endfunction

augroup vimrc-java
    autocmd!
    autocmd FileType java call s:java()
augroup END
"}}}
"}}}

" SETTING FOR PLUGINS {{{1
" vim-plug {{{2
let g:plug_shallow = 0
" }}}
" deoplete {{{2
let g:deoplete#enable_at_startup = 1
" Enable pressing TAB key to select completion in popup window -----------------
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<S-TAB>"
" ------------------------------------------------------------------------------
" Insert new line when press enter
" Neovim default behavior is close popup instead of inserting new line
if is_nvim
	inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
	function! s:my_cr_function() abort
		return pumvisible() ? deoplete#close_popup() : "\<CR>"
	endfunction
endif
" ------------------------------------------------------------------------------
if !exists('g:deoplete#omni#input_patterns')
  let g:deoplete#omni#input_patterns = {}
endif
let g:deoplete#omni#input_patterns.java = '[^. *\t]\.\w*'
let g:deoplete#omni#input_patterns.tex = '\\(?:'
	\ .  '\w*cite\w*(?:\s*\[[^]]*\]){0,2}\s*{[^}]*'
	\ . '|\w*ref(?:\s*\{[^}]*|range\s*\{[^,}]*(?:}{)?)'
	\ . '|hyperref\s*\[[^]]*'
	\ . '|includegraphics\*?(?:\s*\[[^]]*\]){0,2}\s*\{[^}]*'
	\ . '|(?:include(?:only)?|input)\s*\{[^}]*'
	\ . '|\w*(gls|Gls|GLS)(pl)?\w*(\s*\[[^]]*\]){0,2}\s*\{[^}]*'
	\ . '|includepdf(\s*\[[^]]*\])?\s*\{[^}]*'
	\ . '|includestandalone(\s*\[[^]]*\])?\s*\{[^}]*'
	\ .')'
" Close the preview window after completion is done ----------------------------
autocmd CompleteDone * pclose!
" ------------------------------------------------------------------------------
"}}}
" deoplete-clang {{{2
let g:deoplete#sources#clang#libclang_path = '/usr/local/Cellar/llvm/4.0.0_1/lib/libclang.dylib'
let g:deoplete#sources#clang#clang_header = '/usr/local/Cellar/llvm/4.0.0_1/lib/clang'
" }}}
" deoplete-jedi {{{2
let g:deoplete#sources#jedi#python_path = '/usr/local/bin/python3'
let g:deoplete#sources#jedi#enable_cache = 1
let g:deoplete#sources#jedi#show_docstring = 1
let g:deoplete#sources#jedi#server_timeout = 60
" }}}
" deoplete-go {{{2
let g:deoplete#sources#go#gocode_binary = '$GOPATH/bin/gocode'
let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']
let g:deoplete#sources#go#pointer = 1
let g:deoplete#sources#go#use_cache = 1
let g:deoplete#sources#go#json_directory = '~/.cache/deoplete/go/${GOOS}_${GOARCH}'
" }}}
" deoplete-ternjs {{{2
" Set bin if you have many instalations
let g:deoplete#sources#ternjs#tern_bin = '/usr/local/bin/tern'
let g:deoplete#sources#ternjs#timeout = 1

" Whether to include the types of the completions in the result data. Default: 0
let g:deoplete#sources#ternjs#types = 1

" Whether to include the distance (in scopes for variables, in prototypes for
" properties) between the completions and the origin position in the result
" data. Default: 0
let g:deoplete#sources#ternjs#depths = 1

" Whether to include documentation strings (if found) in the result data.
" Default: 0
let g:deoplete#sources#ternjs#docs = 1

" When on, only completions that match the current word at the given point will
" be returned. Turn this off to get all results, so that you can filter on the
" client side. Default: 1
let g:deoplete#sources#ternjs#filter = 0

" Whether to use a case-insensitive compare between the current word and
" potential completions. Default 0
let g:deoplete#sources#ternjs#case_insensitive = 1

" When completing a property and no completions are found, Tern will use some
" heuristics to try and return some properties anyway. Set this to 0 to
" turn that off. Default: 1
let g:deoplete#sources#ternjs#guess = 0

" Determines whether the result set will be sorted. Default: 1
let g:deoplete#sources#ternjs#sort = 0

" When disabled, only the text before the given position is considered part of
" the word. When enabled (the default), the whole variable name that the cursor
" is on will be included. Default: 1
let g:deoplete#sources#ternjs#expand_word_forward = 0

" Whether to ignore the properties of Object.prototype unless they have been
" spelled out by at least to characters. Default: 1
let g:deoplete#sources#ternjs#omit_object_prototype = 0

" Whether to include JavaScript keywords when completing something that is not
" a property. Default: 0
let g:deoplete#sources#ternjs#include_keywords = 1

" If completions should be returned when inside a literal. Default: 1
let g:deoplete#sources#ternjs#in_literal = 0


"Add extra filetypes
let g:deoplete#sources#ternjs#filetypes = [
                \ 'jsx',
                \ 'javascript.jsx',
                \ 'vue',
                \ '...'
                \ ]
" }}}
" neocomplete {{{2
let g:acp_enableAtStartup = 0
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
let g:neocomplete#enable_underbar_completion = 1
let g:neocomplete#enable_camel_case_completion = 1
let g:neocomplete#max_list = 20
let g:neocomplete#auto_completin_start_length = 2
" let g:neocomplete#enable_auto_close_preview = 0
" Auto Cmd InsertLeave * silent! pclose!
" inoremap <expr><C-g>     neocomplete#undo_completion()
" inoremap <expr><C-l>     neocomplete#complete_common_string()
" inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<S-TAB>"
" inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
" inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" inoremap <expr><C-y>  neocomplete#close_popup()
" inoremap <expr><C-e>  neocomplete#cancel_popup()
inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() :"\<Space>"
if !is_nvim
	inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
	function! s:my_cr_function()
		" return neocomplete#close_popup() . "\<CR>"
		" For no inserting <CR> key.
		return pumvisible() ? neocomplete#close_popup() : "\<CR>"
	endfunction
endif
autocmd FileType python setlocal omnifunc=jedi#completions
let g:jedi#completions_enabled = 0
let g:jedi#auto_vim_configuration = 0
if !exists('g:neocomplete#force_omni_input_patterns')
	let g:neocomplete#force_omni_input_patterns = {}
endif
let g:neocomplete#force_omni_input_patterns.python = '\h\w*\|[^. \t]\.\w*'
" }}}
" LanguageClient-neovim {{{2
let g:LanguageClient_serverCommands = {
\ 'haskell': ['hie', '--lsp'],
\ }
" }}}
" Jedi {{{2
let g:jedi#show_call_signatures = 2
" let g:jedi#completions_enabled = 0
" }}}
" YouCompleteMe {{{2
" set completeopt=menuone
" let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_global_ycm_extra_conf = '~/.vim/plugged/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
" let g:ycm_global_ycm_extra_conf = '~/dotfiles/_ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 1
let g:ycm_key_list_select_completion = ['<TAB>', '<Down>']
let g:ycm_key_list_previous_completion = ['<S-TAB>', '<Up>']
if is_nvim " For Neovim
	let g:ycm_filetype_specific_completion_to_disable = {
		\ 'python': 1,
		\ 'java': 1,
		\ 'go': 1
		\ }
else " For Vim
	let g:ycm_filetype_specific_completion_to_disable = {
		\ 'python': 1,
		\ 'java': 1,
		\ }
endif
let g:ycm_show_diagnostics_ui = 0
" }}}
" ale {{{2
let g:ale_linters = {
	\ 'cpp': ['clang'],
	\ 'python': ['flake8'],
	\ 'go': ['go build', 'gofmt', 'golint', 'go vet'],
	\ 'java': [],
	\ }
let g:ale_cpp_clang_options = '-std=c++1z -Wextra -Wall -fsanitize=undefined -g'
" }}}
" Syntastic {{{2
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_enable_signs=1
" let g:syntastic_always_populate_loc_list=1
let g:syntastic_auto_loc_list=2
let g:syntastic_check_on_open=1
let g:syntastic_check_on_wq=0
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠︎'
let g:syntastic_c_check_header=1
let g:syntastic_cpp_check_header=1
let g:syntastic_cpp_compiler='clang++'
let g:syntastic_cpp_compiler_options='-std=c++1y -stdlib=libc++'
let g:syntastic_cpp_checkers = ['gcc', 'clang_check', 'clang_tidy', 'cppcheck']
" }}}
" Neomake {{{2
" autocmd! BufWritePost * Neomake
let g:neomake_cpp_enabled_makers = ['clang']
let g:neomake_cpp_clang_args = ["-std=c++1z", "-Wextra", "-Wall", "-fsanitize=undefined", "-g"]
" }}}
" vim-go {{{2
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
augroup VimGo
	autocmd!
	autocmd FileType go :highlight goErr ctermfg=214
	autocmd FileType go :match goErr /\<err\>/
augroup END
" }}}
" vimtex {{{2
let g:vimtex_fold_enabled = 1
let g:vimtex_fold_manual = 1 " improve performance
let g:vimtex_latexmk_continuous = 1
let g:vimtex_latexmk_background = 1
let g:vimtex_latexmk_options = '-pdfdvi'
let g:vimtex_quickfix_mode = 0
" let g:vimtex_view_general_viewer = '/opt/homebrew-cask/Caskroom/skim/1.4.13/Skim.app/Contents/SharedSupport/displayline'
let g:vimtex_view_general_viewer = '/usr/local/bin/displayline'
let g:vimtex_view_general_options = '@line @pdf @tex'
if !exists('g:ycm_semantic_triggers')
    let g:ycm_semantic_triggers = {}
endif
let g:ycm_semantic_triggers.tex = [
            \ 're!\\[A-Za-z]*(ref|cite)[A-Za-z]*([^]]*])?{([^}]*, ?)*'
            \ ]
" }}}
" tex-conceal {{{2
" let g:tex_conceal="agmb"
" autocmd VimEnter,Colorscheme * :hi Conceal guibg=green ctermfg=white ctermbg=234
" }}}
" NERD tree {{{2
nnoremap <silent> <C-e> :NERDTreeToggle<CR>
let NERDTreeMapChangeRoot='l'
let NERDTreeMapUpdir='h'
let NERDTreeCascadeSingleChildDir=0
let NERDTreeCascadeOpenSingleChildDir=0
let NERDTreeChDirMode=2
let NERDTreeDirArrowExpandable='+'
let NERDTreeDirArrowCollapsible='-'
" }}}
" CtrlP {{{2
if executable('ag')
  let g:ctrlp_use_caching = 0
  let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup -g ""'
endif
let g:ctrlp_root_markers = ['makefile']
" nnoremap <C-f> :CtrlP <ENTER>
" Prefix: f
" nnoremap f <Nop>
" nnoremap fa :<C-u>CtrlP<Space>
" nnoremap fb :<C-u>CtrlPBuffer<CR>
" nnoremap fd :<C-u>CtrlPDir<CR>
" nnoremap ff :<C-u>CtrlP<CR>
" nnoremap fl :<C-u>CtrlPLine<CR>
" nnoremap fm :<C-u>CtrlPMRUFiles<CR>
" nnoremap fq :<C-u>CtrlPQuickfix<CR>
" nnoremap fs :<C-u>CtrlPMixed<CR>
" nnoremap ft :<C-u>CtrlPTag<CR>
" let g:ctrlp_map = '<Nop>'
" let g:ctrlp_extensions = ['tag', 'quickfix', 'dir', 'line', 'mixed']
" }}}
" vimfiler {{{2
" noremap <C-e> :VimFilerBufferDir -split -simple -toggle <ENTER>
" noremap <C-e> :VimFilerBufferDir -simple -toggle <ENTER>
" noremap <C-e> :VimFiler -split -simple -winwidth=35 -no-quit -toggle <ENTER>
" noremap <C-e> :VimFiler -split -simple -winwidth=35 -no-quit<ENTER>
" noremap <C-e> :VimFilerExplorer -find -toggle<ENTER>
" }}}
" chromatica {{{2
let g:chromatica#libclang_path = '/usr/local/Cellar/llvm/5.0.1/lib/libclang.dylib'
let g:chromatica#enable_at_startup = 1
let g:chromatica#responsive_mode = 1
" }}}
" tigris {{{2
let g:tigris#enabled = 1
let g:tigris#on_the_fly_enabled = 1
let g:tigris#delay = 500
" }}}
" color_coded {{{2
let g:color_coded_enabled = 1
let g:color_coded_filetypes = ['c', 'cpp', 'objc']
" }}}
" highlighter {{{2
let g:highlighter#auto_update = 2
let g:highlighter#project_root_signs = ['.git', '.hg']
let g:highlighter#disabled_languages = ['c', 'cpp']
" }}}
" caw (comment out plugin) {{{2
nmap <Leader>c <Plug>(caw:i:toggle)
vmap <Leader>c <Plug>(caw:i:toggle)
" }}}
" indentLine {{{2
let g:indentLine_color_term = 239
let g:indentLine_setConceal=0
let g:indentLine_setColors=0
" }}}
" indent guides {{{2
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 2
let g:indent_guides_auto_colors = 0
" autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#263A45   ctermbg=236
" autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#263A45 ctermbg=236
" }}}
" Tagbar {{{2
nmap <F8> :TagbarToggle<CR>
" }}}
" Lightline {{{2
" let g:lightline = {
" \	'colorscheme': 'hybrid',
" \	'component': {
" \		'readonly': '%{&readonly?"⭤":""}',
" \	},
" \	'separator': { 'left': '⮀', 'right': '⮂' },
" \	'subseparator': { 'left': '⮁', 'right': '⮃' }
" \	}

let g:lightline = {
      \ 'colorscheme': 'neodark',
      \ 'mode_map': { 'c': 'NORMAL' },
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ] ],
      \   'right': [ [ 'lineinfo' ], [ 'percent' ], [ 'fileformat', 'fileencoding', 'filetype' ], [ 'ale_warnings', 'ale_errors' ] ]
      \ },
      \ 'component_function': {
      \   'modified': 'LightLineModified',
      \   'readonly': 'LightLineReadonly',
      \   'fugitive': 'LightLineFugitive',
      \   'filename': 'LightLineFilename',
      \   'fileformat': 'LightLineFileformat',
      \   'filetype': 'LightLineFiletype',
      \   'fileencoding': 'LightLineFileencoding',
      \   'mode': 'LightLineMode',
      \ },
      \ 'component_expand': {
      \     'ale_errors': 'LightLineAleErrors',
      \     'ale_warnings': 'LightLineAleWarnings',
      \ },
	  \ 'component_type': {
      \     'ale_errors': 'error',
      \     'ale_warnings': 'warning',
	  \ },
      \ 'separator': { 'left': '⮀', 'right': '⮂' },
      \ 'subseparator': { 'left': '⮁', 'right': '⮃' }
      \ }

function! LightLineModified()
  return &ft =~ 'help\|vimfiler' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! LightLineReadonly()
  return &ft !~? 'help\|vimfiler' && &readonly ? '⭤' : ''
endfunction

function! LightLineFilename()
  let fname = expand('%:t')
  return fname == 'ControlP' ? g:lightline.ctrlp_item :
		\ fname == '__Tagbar__' ? g:lightline.fname :
        \ fname =~ 'NERD_tree' ? '' :
        \ &ft == 'vimfiler' ? vimfiler#get_status_string() :
        \ &ft == 'unite' ? unite#get_status_string() :
        \ &ft == 'vimshell' ? vimshell#get_status_string() :
        \ ('' != LightLineReadonly() ? LightLineReadonly() . ' ' : '') .
        \ ('' != fname ? fname : '[No Name]') .
        \ ('' != LightLineModified() ? ' ' . LightLineModified() : '')
endfunction

function! LightLineFugitive()
  try
    if expand('%:t') !~? 'Tagbar\|NERD' && &ft !~? 'vimfiler' && exists('*fugitive#head')
      let mark = '⭠ '  " edit here for cool mark
      let _ = fugitive#head()
      return strlen(_) ? mark._ : ''
    endif
  catch
  endtry
  return ''
endfunction

function! LightLineFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LightLineFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

function! LightLineFileencoding()
  return winwidth(0) > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction

function! LightLineMode()
  let fname = expand('%:t')
  return fname == 'ControlP' ? 'CtrlP' :
		\ fname == '__Tagbar__' ? 'Tagbar' :
        \ fname =~ 'NERD_tree' ? 'NERDTree' :
        \ &ft == 'unite' ? 'Unite' :
        \ &ft == 'vimfiler' ? 'VimFiler' :
        \ &ft == 'vimshell' ? 'VimShell' :
        \ winwidth(0) > 60 ? lightline#mode() : ''
endfunction

function! CtrlPMark()
  if expand('%:t') =~ 'ControlP'
    call lightline#link('iR'[g:lightline.ctrlp_regex])
    return lightline#concatenate([g:lightline.ctrlp_prev, g:lightline.ctrlp_item
          \ , g:lightline.ctrlp_next], 0)
  else
    return ''
  endif
endfunction

let g:ctrlp_status_func = {
  \ 'main': 'CtrlPStatusFunc_1',
  \ 'prog': 'CtrlPStatusFunc_2',
  \ }

function! CtrlPStatusFunc_1(focus, byfname, regex, prev, item, next, marked)
  let g:lightline.ctrlp_regex = a:regex
  let g:lightline.ctrlp_prev = a:prev
  let g:lightline.ctrlp_item = a:item
  let g:lightline.ctrlp_next = a:next
  return lightline#statusline(0)
endfunction

function! CtrlPStatusFunc_2(str)
  return lightline#statusline(0)
endfunction

let g:tagbar_status_func = 'TagbarStatusFunc'

function! TagbarStatusFunc(current, sort, fname, ...) abort
    let g:lightline.fname = a:fname
  return lightline#statusline(0)
endfunction

augroup LightLineOnAle
	autocmd!
	autocmd User ALELint call lightline#update()
augroup END

function! LightLineAleErrors() abort
  return s:ale_string(0)
endfunction

function! LightLineAleWarnings() abort
  return s:ale_string(1)
endfunction

function! LightLineAleOK() abort
  return s:ale_string(2)
endfunction

function! s:ale_string(mode)
  if !exists('g:ale_buffer_info')
    return ''
  endif

  let l:buffer = bufnr('%')
  let l:counts = ale#statusline#Count(l:buffer)
  let [l:error_format, l:warning_format, l:no_errors] = g:ale_statusline_format

  if a:mode == 0 " Error
    let l:errors = l:counts.error + l:counts.style_error
    return l:errors ? printf(l:error_format, l:errors) : ''
  elseif a:mode == 1 " Warning
    let l:warnings = l:counts.warning + l:counts.style_warning
    return l:warnings ? printf(l:warning_format, l:warnings) : ''
  endif

  return l:no_errors
endfunction

let g:unite_force_overwrite_statusline = 0
let g:vimfiler_force_overwrite_statusline = 0
let g:vimshell_force_overwrite_statusline = 0
" }}}
" ConqueGdb {{{2
" let g:ConqueGdb_Leader = '<Space>'
" let g:ConqueTerm_Color = 2         " 1: strip color after 200 lines, 2: always with color
" let g:ConqueTerm_CloseOnEnd = 1    " close conque when program ends running
" let g:ConqueTerm_StartMessages = 0 " display warning messages if conqueTerm is configured incorrectly 
" }}}
" vim-template {{{2
let g:vimtex_indent_enabled = 1
" }}}
" UltiSnips {{{2
" let g:UltiSnipsExpandTrigger="<s-cr>"
" let g:UltiSnipsListSnippets="<c-s-tab>"
" }}}
" Supertab {{{2
" let g:SuperTabDefaultCompletionType = ‘<C-Tab>’
" }}}
" Previm {{{2
let g:previm_open_cmd = 'open -a Google\ Chrome'
let g:previm_show_header = 0
" let g:previm_enable_realtime = 1
" }}}
" easymotion {{{2
let g:EasyMotion_do_mapping = 0
nmap <Leader>s <Plug>(easymotion-s2)
" }}}
" eclim {{{2
let g:EclimCompletionMethod = 'omnifunc'
" }}}
" }}}
