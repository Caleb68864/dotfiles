set nocompatible " be iMproved, required 
filetype off " required 

" set the runtime path to include Vundle and initialize 
set rtp+=~/dotfiles/vim/bundle/Vundle.vim 
call vundle#begin() 
" alternatively, pass a path where Vundle should install plugins 
"call vundle#begin('~/some/path/here') 

" let Vundle manage Vundle, required 
Plugin 'VundleVim/Vundle.vim' 

Bundle 'Valloric/YouCompleteMe'


" The following are examples of different formats supported. 
" Keep Plugin commands between vundle#begin/end. 
" plugin on GitHub repo 
" Plugin 'tpope/vim-fugitive' 
" plugin from http://vim-scripts.org/vim/scripts.html 
" Plugin 'L9' 
" Git plugin not hosted on GitHub Plugin 'git://git.wincent.com/command-t.git' 
" git repos on your local machine (i.e. when working on your own plugin) 
" Plugin 'file:///home/gmarik/path/to/plugin' 
" The sparkup vim script is in a subdirectory of this repo called vim. 
" Pass the path to set the runtimepath properly. 
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'} 
" Install L9 and avoid a Naming conflict if you've already installed a 
" different version somewhere else. 
" Plugin 'ascenator/L9', {'name': 'newL9'} 

" All of your Plugins must be added before the following line 
call vundle#end() " required 
filetype plugin indent on " required 
" To ignore plugin indent changes, instead use: 
"filetype plugin on 
" 
" Brief help 
" :PluginList - lists configured plugins 
" :PluginInstall - installs plugins; append `!` to update or just :PluginUpdate 
" :PluginSearch foo - searches for foo; append `!` to refresh local cache 
" :PluginClean - confirms removal of unused plugins; append `!` to auto-approve removal 
" 
" see :h vundle for more details or wiki for FAQ 
" Put your non-Plugin stuff after this line

" General Vim settings
	syntax on
	let mapleader=","
	set autoindent
	set expandtab
	set tabstop=4
	set shiftwidth=4
	set dir=/tmp/
	set relativenumber 
	set number

	set cursorline
	hi Cursor ctermfg=White ctermbg=Yellow cterm=bold guifg=white guibg=yellow gui=bold

	" enable all Python syntax highlighting features 
	let python_highlight_all = 1

	set hlsearch
	nnoremap <C-l> :nohl<CR><C-l>:echo "Search Cleared"<CR>
	nnoremap <C-c> :set norelativenumber<CR>:set nonumber<CR>:echo "Line numbers turned off."<CR>
	nnoremap <C-n> :set relativenumber<CR>:set number<CR>:echo "Line numbers turned on."<CR>

	nnoremap n nzzzv
	nnoremap N Nzzzv

	nnoremap H 0
	nnoremap L $
	nnoremap J G
	nnoremap K gg

	map <tab> %

	set backspace=indent,eol,start

	nnoremap <Space> za
	nnoremap <leader>z zMzvzz

	nnoremap vv 0v$

	set listchars=tab:\|\ 
	nnoremap <leader><tab> :set list!<cr>
	set pastetoggle=<F2>
	set mouse=a
	set incsearch

" Language Specific
	" General
		inoremap <leader>for <esc>Ifor (int i = 0; i < <esc>A; i++) {<enter>}<esc>O<tab>
		inoremap <leader>if <esc>Iif (<esc>A) {<enter>}<esc>O<tab>
		

	" Java
		inoremap <leader>sys <esc>ISystem.out.println(<esc>A);
		vnoremap <leader>sys yOSystem.out.println(<esc>pA);

	" Java
		inoremap <leader>con <esc>Iconsole.log(<esc>A);
		vnoremap <leader>con yOconsole.log(<esc>pA);

	" C++
		inoremap <leader>cout <esc>Istd::cout << <esc>A << std::endl;
		vnoremap <leader>cout yOstd::cout << <esc>pA << std:endl;

	" C
		inoremap <leader>out <esc>Iprintf(<esc>A);<esc>2hi
		vnoremap <leader>out yOprintf(, <esc>pA);<esc>h%a

	" Typescript
		autocmd BufNewFile,BufRead *.ts set syntax=javascript
		autocmd BufNewFile,BufRead *.tsx set syntax=javascript

	" Markup
		inoremap <leader>< <esc>I<<esc>A><esc>yypa/<esc>O<tab>

" File and Window Management 
	inoremap <leader>w <Esc>:w<CR>
	nnoremap <leader>w :w<CR>

	inoremap <leader>q <ESC>:q<CR>
	nnoremap <leader>q :q<CR>

	inoremap <leader>x <ESC>:x<CR>
	nnoremap <leader>x :x<CR>

	nnoremap <leader>e :Ex<CR>
	nnoremap <leader>t :tabnew<CR>:Ex<CR>
	nnoremap <leader>v :vsplit<CR>:w<CR>:Ex<CR>
	nnoremap <leader>s :split<CR>:w<CR>:Ex<CR>

" Return to the same line you left off at
	augroup line_return
		au!
		au BufReadPost *
			\ if line("'\"") > 0 && line("'\"") <= line("$") |
			\	execute 'normal! g`"zvzz' |
			\ endif
	augroup END

" Future stuff
	"Swap line
	"Insert blank below and above

