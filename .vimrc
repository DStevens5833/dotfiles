"------------------------------------------------------------------------------"
" START VUNDLE
"------------------------------------------------------------------------------"
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'


"------------------------------------------------------------------------------"
" PLUGIN REPOSITORIES
"------------------------------------------------------------------------------"
" Language
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-markdown'
Plugin 'kchmck/vim-coffee-script'
Plugin 'vim-ruby/vim-ruby'
Plugin 'othree/html5.vim'
Plugin 'fatih/vim-go'
Plugin 'elzr/vim-json'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'vim-perl/vim-perl'
Plugin 'hotchpotch/perldoc-vim'
Plugin 'StanAngeloff/php.vim'
Plugin 'b4winckler/vim-objc'

" Completion
Plugin 'Valloric/YouCompleteMe'
Plugin 'rdnetto/YCM-Generator'
Plugin 'chrisbra/Colorizer'

" Code Display
Plugin 'ap/vim-css-color'
Plugin 'sjl/badwolf'
Plugin 'jonathanfilip/vim-lucius'
Plugin 'jpo/vim-railscasts-theme'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tomasr/molokai'
Plugin 'nanotech/jellybeans.vim'
Plugin 'chriskempson/base16-vim'
Plugin 'w0ng/vim-hybrid'
Plugin 'ujihisa/unite-colorscheme'
Plugin 'tpope/vim-vividchalk'
Plugin 'chriskempson/vim-tomorrow-theme'

" Integrations
Plugin 'jalcine/cmake.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'majutsushi/tagbar'
Plugin 'rizzatti/dash.vim'
Plugin 'airblade/vim-gitgutter'

" Interface
Plugin 'kien/ctrlp.vim'
Plugin 'bling/vim-airline'
Plugin 'pangloss/vim-javascript'

" Commands
Plugin 'a.vim'

" Other
Plugin 'tomtom/tlib_vim'
Plugin 'L9'
Plugin 'mattn/webapi-vim'
Plugin 'xolox/vim-misc'
Plugin 'helino/vim-nasm'


"------------------------------------------------------------------------------"
" DONE WITH VUNDLE
"------------------------------------------------------------------------------"
call vundle#end()
syntax on
filetype plugin indent on

" Source Custom Settings
"function! SourceSettings()
"    let file_list = split(globpath("~/.vim/settings", "*.vim"), '\n')
"
"    for file in file_list
"        execute('source '.file)
"    endfor
"endfunction
"
"call SourceSettings()


"------------------------------------------------------------------------------"
" VIM SETTINGS
"------------------------------------------------------------------------------"
if has("gui_running")
    set guifont=Inconsolata:h14
endif

set background=dark
"colorscheme solarized
colorscheme delek

"let base16colorspace=256
"let g:base16_shell_path = '/Users/ds/Repositories/base16-shell'
"set background=dark
"colorscheme base16-atelierdune

set hidden
set nowrap
set tabstop=4
set backspace=indent,eol,start

set autoindent
set copyindent
set shiftwidth=4
set shiftround
set showmatch
set ignorecase
set smartcase
set smarttab
set expandtab
set hlsearch
set incsearch
set nobackup
set noswapfile

set mouse=a
set laststatus=2


"------------------------------------------------------------------------------"
" Mappings
"------------------------------------------------------------------------------"
:let mapleader = ","

" Escape insert mode
imap jk <esc>

" Easier window navigation
map <C-k> <C-W><up>
map <C-j> <C-W><down>
map <C-h> <C-W><left>
map <C-l> <C-W><right>

" Easier window pane resizing
map <C-up> :resize -1<cr>
map <C-down> :resize +1<cr>
map <C-left> <C-W><
map <C-right> <C-W>>

" Clear search highlight
nmap <silent> <Leader>/ :nohlsearch<cr>

" Toggle nerd tree
nmap <Leader>t :NERDTreeToggle<cr>

" Toggle tagbar
nmap <Leader>b :TagbarToggle<cr>

nnoremap <Leader><tab> 0i    <esc>j0

" Quit without saving, save, save and quit
nnoremap <Leader>q :q!<cr>
nnoremap <Leader>s :w!<cr>
nnoremap <Leader>w :wq!<cr>

" Edit/Source ~.vimrc
nnoremap <Leader>ev :e $MYVIMRC<cr>
nnoremap <Leader>sv :so $MYVIMRC<cr>

" Toggle line numbers
nnoremap <Leader>n :set nu!<cr>


"------------------------------------------------------------------------------"
" RESTORE SAVED FILE LOCATION
"------------------------------------------------------------------------------"
if has("autocmd")
    au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
                \| exe "normal! g'\"" | endif
endif

au StdinReadPre * let s:std_in=1
au VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

au bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif



"------------------------------------------------------------------------------"
" YouCompleteMe Options
"------------------------------------------------------------------------------"
let g:ycm_add_preview_to_completeopt = 0
let g:ycm_allow_changing_updatetime = 1
let g:ycm_always_populate_location_list = 0
let g:ycm_auto_start_csharp_server = 1
let g:ycm_auto_stop_csharp_server = 1
let g:ycm_auto_trigger = 1
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 0
let g:ycm_cache_omnifunc = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 0
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_complete_in_comments = 0
let g:ycm_complete_in_strings = 1
let g:ycm_confirm_extra_conf = 0
let g:ycm_csharp_server_port = 0
let g:ycm_echo_current_diagnostic = 1
let g:ycm_enable_diagnostic_highlighting = 1
let g:ycm_enable_diagnostic_signs = 1
let g:ycm_extra_conf_globlist = ['~/dev/*','!~/*']
let g:ycm_extra_conf_vim_data = []
let g:ycm_error_symbol = '>>'
"let g:ycm_global_ycm_extra_conf = '/Users/Dustin/.ycm_extra_conf.py'
let g:ycm_filetype_blacklist = {
            \ 'tagbar' : 1,
            \ 'qf' : 1,
            \ 'notes' : 1,
            \ 'markdown' : 1,
            \ 'unite' : 1,
            \ 'text' : 1,
            \ 'vimwiki' : 1,
            \ 'pandoc' : 1,
            \ 'infolog' : 1,
            \ 'mail' : 1
            \}
let g:ycm_filetype_specific_completion_to_disable = {
            \ 'gitcommit': 1
            \}
let g:ycm_filetype_whitelist = { '*': 1 }
let g:ycm_filepath_completion_use_working_dir = 0
let g:ycm_key_detailed_diagnostics = '<leader>d'
let g:ycm_key_invoke_completion = '<C-Space>'
let g:ycm_key_list_select_completion = ['<TAB>', '<Down>']
let g:ycm_key_list_previous_completion = ['<S-TAB>', '<Up>']
let g:ycm_max_diagnostics_to_display = 30
let g:ycm_min_num_identifier_candidate_chars = 0
let g:ycm_min_num_of_chars_for_completion = 0
let g:ycm_open_loclist_on_ycm_diags = 1
let g:ycm_show_diagnostics_ui = 1
let g:ycm_seed_identifiers_with_syntax = 0
let g:ycm_semantic_triggers =  {
            \   'c' : ['->', '.'],
            \   'objc' : ['->', '.'],
            \   'ocaml' : ['.', '#'],
            \   'cpp,objcpp' : ['->', '.', '::'],
            \   'perl' : ['->'],
            \   'php' : ['->', '::'],
            \   'cs,java,javascript,d,python,perl6,scala,vb,elixir,go' : ['.'],
            \   'vim' : ['re![_a-zA-Z]+[_\w]*\.'],
            \   'ruby' : ['.', '::'],
            \   'lua' : ['.', ':'],
            \   'erlang' : [':'],
            \ }
let g:ycm_server_keep_logfiles = 0
let g:ycm_server_log_level = 'info'
let g:ycm_server_use_vim_stdout = 0
let g:ycm_use_ultisnips_completer = 1
let g:ycm_warning_symbol = '?>'
