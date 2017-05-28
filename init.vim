call plug#begin('~/.vim/plugged')

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-vinegar'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-commentary'
Plug 'mhartington/oceanic-next'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'clojure-vim/async-clj-omni'
Plug 'vim-syntastic/syntastic'
Plug 'SirVer/ultisnips' | Plug 'fatihict/vim-snippets'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-fugitive'
Plug 'bronson/vim-visual-star-search'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'dhruvasagar/vim-table-mode'
Plug 'christoomey/vim-tmux-navigator'
Plug 'fatihict/tagbar'

" Clojure (<3)
" Plug 'clojure-vim/acid.nvim' " Alternative to vim-fireplace, should try this
" sometime..
Plug 'tpope/vim-fireplace'
Plug 'guns/vim-clojure-highlight'
Plug 'guns/vim-clojure-static'
Plug 'guns/vim-sexp'
Plug 'tpope/vim-sexp-mappings-for-regular-people'
Plug 'tpope/vim-classpath'
Plug 'neovim/node-host', { 'dir': '~/.vim/plugged/node-host', 'do': 'npm install' }
Plug 'clojure-vim/clj-refactor.nvim'
Plug 'jonase/eastwood'

" Experimental plugins
Plug 'clojure-vim/neovim-client'

call plug#end()


let mapleader = ','
let maplocalleader = '\'

" If the window is small and a line is wrapped I usually want to go to the first character of the current visible line instead of the actual line.
nnoremap 0 g0
nnoremap ^ g^
nnoremap g0 0
nnoremap g^ ^

" jk should move up and down a line, even when the line is too long and breaks on a new line
nnoremap k gk
nnoremap gk k
nnoremap j gj
nnoremap gj j

nnoremap g_ $
nnoremap $ g_
vnoremap g_ $
vnoremap $ g_

" Highlight removal
nmap <Leader><space> :nohlsearch<cr>

" Quick save
" nmap ,w :w<cr> " Is mapped to another keybinding
nmap <Leader>fs :w<cr>

" select the pasted block
nnoremap gp `[v`]

" Because my leader key is mapped to a comma, I can stil use the comma to reverse the f command
noremap \ ,

" Navigation
" nnoremap <C-h> <C-w>h
" nnoremap <C-j> <C-w>j
" nnoremap <C-k> <C-w>k
" nnoremap <C-l> <C-w>l

" Best of both worlds
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>

" Easy escape
imap kj <esc>

" go to the bottom of a yanked selection, because that is what you want!
vmap y y`]j

" Automatically source this config on save
augroup autosourcing
autocmd!
autocmd BufWritePost ~/.config/nvim/init.vim source %
augroup end

" Visual
set background=dark

" Show tabs and whitespaces as unicode chars
exec "set listchars=tab:\uBB\uBB,trail:\uB7,nbsp:~"
set list

if (has("termguicolors"))
 set termguicolors
endif

" Theme
syntax enable
colorscheme OceanicNext

set backupdir=~/.vim/backup_files//
set directory=~/.vim/swap_files//
set undodir=~/.vim/undo_files//
set noswapfile

" Use shell aliases in cmd mode
set shell=zsh\ -l

" Hides buffers instead of closing them in order to keep undo history and marks
set hidden

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %

" Quick run plugininstall
nmap <C-p><C-i> :PlugInstall<cr>
nmap <C-p><C-d> :PlugClean<cr>

" Toggle line numbers
nmap <C-N><C-N> :set invnumber<CR>

set autowriteall
set ignorecase
set smartcase

nmap <Leader>c :Commentary<CR>
vmap <Leader>c :Commentary<CR>

set clipboard=unnamedplus

syntax on
filetype plugin indent on

" Evaluate Clojure buffers on load
autocmd BufRead *.clj try | silent! Require | catch /^Fireplace/ | endtry

let g:deoplete#enable_at_startup = 1

let g:deoplete#keyword_patterns = {}
let g:deoplete#keyword_patterns.clojure = '[\w!$%&*+/:<=>?@\^_~\-\.#]*'

" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
"
function! GitBranchName()
    let branch = fugitive#head()
    if branch != ''
        return ' ' . branch
    endif
    return ''
endfunction

hi StatusLine guibg=none
set statusline=
set statusline+=%=
set statusline+=%-10{GitBranchName()}

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

nmap <Leader>bb :Buffers<CR>
nmap <Leader>p :Tags<CR>
nmap <Leader>l :BLines<CR>
nmap <C-e> :History<CR>
nmap <Leader>s :GFiles<CR>
nmap <Leader>/ :History/<CR>
nmap <Leader>: :History:<CR>

nmap <Leader>tb :Tagbar<CR>
nmap <Leader>bt :BTags<CR>

" C-e is already bound to searching recent files, but scrolling down single
" lines is still awesome, soo this remap is awesome =)
nnoremap <M-y> <C-e>

" Tab navigation
nnoremap th  :tabfirst<CR>
nnoremap tj  :tabnext<CR>
nnoremap tk  :tabprev<CR>
nnoremap tl  :tablast<CR>
nnoremap tt  :tabedit<Space>
nnoremap tn  :tabnext<CR>
nnoremap tp  :tabprev<CR>
nnoremap tm  :tabm<Space>
nnoremap td  :tabclose<CR>

" Buffer navigation
nnoremap bj  :bn<CR>
nnoremap bk  :bp<CR>
nnoremap bn  :bn<CR>
nnoremap bp  :bp<CR>

" Visual mode eval range
vmap <Leader>e :'<,'>Eval<CR>

hi MatchParen guifg=#1aff1a guibg=none

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
" let g:UltiSnipsSnippetsDir = "~/.vim/bundle/ultisnips/UltiSnips"
let g:UltiSnipsSnippetsDir = "/home/fatih/.vim/plugged/vim-snippets/snippets"
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" Stole this from: https://github.com/Pancia/dotfiles/blob/master/nvim/ftplugin/clojure.vim
let g:clojure_maxlines=300
let g:clojure_align_multiline_strings=1
let g:clojure_syntax_keywords = {
            \ 'clojureMacro': ['defui', 'facts', 'fact', 'specification', 'behavior', 'provided', 'assertions', 'component', 'provided', 'when-mocking', 'render', 'query', 'ident', 'start', 'stop', 'defsyntax', 'defsynfn', 'synfn', 'defspawner', 'defread', 'defmutation']
            \ }

let g:clojure_fuzzy_indent = 1
let g:clojure_fuzzy_indent_patterns = [
            \ '^def.*', '^with.*', 'specification', 'behavior', 'assertions', 'component', 'provided',
            \ 'start', 'stop', 'letfn', '-tx$', 'transact!', '^check.*', '^assert.*',
            \ 'concat', '.*Exception.*', '.*Error.*', 'trace\|debug\|info\|warn\|error\|fatal',
            \ '.*->>\?$', 'either', 'synfn', 'parse.*', 'spawn-*', 'load-data.*',
            \ '!$', '^do', 'into', '^test-.*', '\..*', 'ui-*',
            \ 'a', 'article', 'button', 'code', 'defs', 'div', 'footer', 'form',
            \ 'h1', 'h2', 'h4', 'header', 'hr', 'img', 'input', 'label', 'li', 'linearGradient',
            \ 'main', 'nav', 'node', 'ol', 'option', 'p', 'path', 'polygon',
            \ 'section', 'select', 'small', 'span', 'stop', 'strong', 'svg',
            \ 'table', 'tbody', 'td', 'textarea', 'th', 'thead', 'tr', 'ul',
            \ 'fdef', 'reduce', 'merge', 'row', 'col', 'icon',
            \ ]
let g:clojure_fuzzy_indent_blacklist = []
let g:clojure_special_indent_words = join([
            \ 'defrecord', 'defui', 'reify', 'letfn', 'extend-type',
            \ 'defprotocol', 'defmutation',
            \ ], ',')

" Markdown-compatible tables
let g:table_mode_corner='|'

function! s:isAtStartOfLine(mapping)
  let text_before_cursor = getline('.')[0 : col('.')-1]
  let mapping_pattern = '\V' . escape(a:mapping, '\')
  let comment_pattern = '\V' . escape(substitute(&l:commentstring, '%s.*$', '', ''), '\')
  return (text_before_cursor =~? '^' . ('\v(' . comment_pattern . '\v)?') . '\s*\v' . mapping_pattern . '\v$')
endfunction

inoreabbrev <expr> <bar><bar>
          \ <SID>isAtStartOfLine('\|\|') ?
          \ '<c-o>:TableModeEnable<cr><bar><space><bar><left><left>' : '<bar><bar>'
inoreabbrev <expr> __
          \ <SID>isAtStartOfLine('__') ?
          \ '<c-o>:silent! TableModeDisable<cr>' : '__'

" Navigate between vim and tmux seamlessly
let g:tmux_navigator_no_mappings = 1

nnoremap <silent> <C-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
nnoremap <silent> <C-k> :TmuxNavigateUp<cr>
nnoremap <silent> <C-l> :TmuxNavigateRight<cr>
" nnoremap <silent> {Previous-Mapping} :TmuxNavigatePrevious<cr>

" Vimscript stuff for quick sourcing
nmap ,e :w<cr>:so %<cr>
nmap ,m :mess<cr>

" Tabs and spaces
set tabstop=4
set expandtab
set softtabstop=4
set shiftwidth=4
set smartindent
set autoindent
set copyindent
set indentexpr&

" I don't use folds.. So unfold all the things!
set foldlevel=99
set history=800

" Because i fail at letting go shift after writing a colon
abbrev Wq wq

" Easy source changes to vimrc
nnoremap <Leader>qs :so ~/.config/nvim/init.vim<CR> :echo "Sourced new vimrc :)"<CR>

" Removes a namespaced symbol
nmap dns 0f/ldt<space><CR>
    \ :call repeat#set("dns")<CR>
nmap cns <Esc>0f/ldt<space>i
