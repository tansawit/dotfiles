call plug#begin('~/.config/nvim/nvim/plugged')
" Declare the list of plugins.

" Quality of Life
Plug 'itchyny/lightline.vim'                         " customizable and light status line
Plug 'junegunn/vim-easy-align'                       " text alignment
Plug 'ryanoasis/vim-devicons'                        " file type icons
Plug 'tweekmonster/impsort.vim', {'for': 'python'}   " color and sort imports

                                                     " Navigation
Plug '/usr/local/opt/fzf'                            " local fzf

" File Editing
Plug 'rizzatti/dash.vim'                             " dash integration
Plug 'unblevable/quick-scope'                        " lightning fast left-right movement
Plug 'junegunn/fzf.vim'                              " fuzzy searching
Plug 'jiangmiao/auto-pairs'                          " insert or delete brackets, parens, quotes in pair
Plug 'SirVer/ultisnips'                              " code snippets
Plug 'AndrewRadev/splitjoin.vim'                     " split/join line into one or multiple lines
Plug 'tpope/vim-repeat'                              " repeat previous command
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'arthurxavierx/vim-caser'                       " change variable case
Plug 'tpope/vim-commentary'                          " quick comment/uncomment
Plug 'ConradIrwin/vim-bracketed-paste'               " bracket pasting

" File Navigation
Plug 'haya14busa/incsearch.vim'                      " Incremental searching
Plug 'haya14busa/incsearch-fuzzy.vim'
Plug 'haya14busa/incsearch-easymotion.vim'
Plug 'easymotion/vim-easymotion'                     " Better Vim Motions

" Project Navigation
Plug 'ctrlpvim/ctrlp.vim'                            " search for file in directory

" Editor Appearance
Plug 'arcticicestudio/nord-vim'
Plug 'bling/vim-bufferline'                          " show the list of buffers in the command bar
Plug 'tpope/vim-surround'                            " easy quote/bracket
Plug 'tpope/vim-fugitive'                            " git wrappers
Plug 'airblade/vim-gitgutter'                        " show git changes
Plug 'tpope/vim-abolish'                             " asily search for, substitute, and abbreviate multiple variants of a word

" Language support
Plug 'davidhalter/jedi-vim', {'for': 'python'}       " python autocompletion
Plug 'ekalinin/Dockerfile.vim'                       " docker support
Plug 'elzr/vim-json'                                 " json support
Plug 'fatih/vim-go', {'for':'go'}                    " golang support
Plug 'gabrielelana/vim-markdown', {'for':'markdown'} " markdown support
Plug 'pangloss/vim-javascript'
Plug 'MaxMEllon/vim-jsx-pretty'


Plug 'godlygeek/tabular'                             " align text at character
Plug 'majutsushi/tagbar'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-easytags'

Plug 'jremmen/vim-ripgrep'
Plug 'luochen1990/rainbow'
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }

Plug 'edkolev/tmuxline.vim'
Plug 'vim-syntastic/syntastic'
call plug#end()


" Options
set noshowmode                             " hide insert status
set noruler                                " remove ruler
set laststatus=2                           " always the status line
set noshowcmd                              " turn off display of command
set cmdheight=2                            " height of command length
set noshowmode                             " Hide INSERT/VISUAL messages
set mouse=a                                " Copy selected text with mouse to system clipboard
set undofile                               " Save undos after file closes
set wildmode=longest:list,full             " Complete longest common string, then each full match
set signcolumn=yes
set updatetime=300                         " If this many milliseconds nothing is typed the swap file will be written to disk
set visualbell                             " Turn off the audio bell (no beeps)
set clipboard^=unnamed                     " Make copy work with system clipboard
set gdefault                               " Always do global substitutions
set title                                  " Set terminal title
set whichwrap+=<,>,[,]                     " Make right arrow wrap to the next line
set completeopt-=preview                   " No annoying scratch preview above
set expandtab                              " Spaces on tabs
set shiftwidth=4                           " TODO: ?
set softtabstop=2
set undolevels=1000                        " set number of undos saved
set smartindent                            " Indentation
set shortmess=Ia                           " Disable startup message
set fileencoding=utf-8                     " Encoding when written to file
set fileformat=unix                        " Line endings
set timeout timeoutlen=1000 ttimeoutlen=10 " TODO: ?
set autowrite                              " Automatically save before :next, :make etc
set ignorecase                             " Search case insensitive:
set smartcase                              " .. but not when search pattern contains upper case characters
set nocursorcolumn
set nocursorline
set number
set wrap
set textwidth=79
set formatoptions=qrn1
set notimeout
set ttimeout
set ttimeoutlen=10
set nobackup                               " Don't create annoying backup files
set path=+**                               " Search down into subfolders
let g:rainbow_active = 1 


" Folding
set foldcolumn=1
set foldlevel=20
set foldlevelstart=7
set foldmethod=syntax
set foldignore=""
set nofoldenable


" Buffers
set hidden


" Searching
set wrapscan
set ignorecase
set smartcase


" Usable 'Tab'
set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab


" UI
set cursorline                " Highlight current line
set showmatch
set tabstop=4                 " Default indentation is 4 spaces long and uses tabs, not spaces
set matchtime=2
set termguicolors             " Enable true colors support
set completeopt+=menu,menuone " Completion                                                     "
" "
" "

autocmd BufWritePre *.py ImpSort!


" Impsort option
hi pythonImportedObject ctermfg=127
hi pythonImportedFuncDef ctermfg=127
hi pythonImportedClassDef ctermfg=127<Paste>


let python_highlight_all = 1
" For Neovim 0.1.3 and 0.1.4 - https://github.com/neovim/neovim/pull/2198

filetype plugin indent on
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
filetype plugin on
syntax on
let g:quantum_italics=1
set termguicolors
colorscheme nord
let g:enable_bold_font = 1
let g:enable_italic_font = 1
let g:hybrid_transparent_background = 1
if (empty($TMUX))
  if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif
let g:lightline = {
  \ 'colorscheme': 'nord',
  \ }
let g:lightline = {
      \ 'colorscheme': 'nord',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head',
      \ },
      \ }
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*


"NERD Commenter"
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = 'left'
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1
let g:NERDToggleCheckAllLines = 1


"TagBar"
nmap <F8> :TagbarToggle<CR>
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
let g:indentLine_concealcursor = "nc"

" set autochdir
set nobackup nowritebackup noswapfile
set listchars=extends:→               " Show arrow if line continues rightwards
set listchars+=precedes:←             " Show arrow if line continues leftwards
set ttyfast                           " Send more characters in fast terminals
set showcmd                           " Show size of visual selection
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
nnoremap <silent> <leader>z :Goyo<crgi

" Trigger a highlight in the appropriate direction when pressing these keys:
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

" Trigger a highlight only when pressing f and F.
let g:qs_highlight_on_keys = ['f', 'F']
highlight QuickScopePrimary guifg='#afff5f' gui=underline ctermfg=155 cterm=underline
highlight QuickScopeSecondary guifg='#5fffff' gui=underline ctermfg=81 cterm=underline

nnoremap - :Files<CR>
nnoremap = :Ag<CR>

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" Completion
" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <C-d> for select selections ranges, needs server support, like: coc-tsserver, coc-python
" nmap <silent> <C-d> <Plug>(coc-range-select)
" xmap <silent> <C-d> <Plug>(coc-range-select)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

" use `:OR` for organize import of current buffer
command! -nargs=0 OR :call CocAction('runCommand', 'editor.action.organizeImport')
autocmd BufWritePre *.go :OR
let g:tagbar_type_go = {
\ 'ctagstype' : 'go',
\ 'kinds'     : [
    \ 'p:package',
    \ 'i:imports:1',
    \ 'c:constants',
    \ 'v:variables',
    \ 't:types',
    \ 'n:interfaces',
    \ 'w:fields',
    \ 'e:embedded',
    \ 'm:methods',
    \ 'r:constructor',
    \ 'f:functions'
\ ],
\ 'sro' : '.',
\ 'kind2scope' : {
    \ 't' : 'ctype',
    \ 'n' : 'ntype'
\ },
\ 'scope2kind' : {
    \ 'ctype' : 't',
    \ 'ntype' : 'n'
\ },
\ 'ctagsbin'  : 'gotags',
\ 'ctagsargs' : '-sort -silent'
\ }
nmap <leader>t :TagbarToggle<CR>
function! s:config_easyfuzzymotion(...) abort
  return extend(copy({
  \   'converters': [incsearch#config#fuzzyword#converter()],
  \   'modules': [incsearch#config#easymotion#module({'overwin': 1})],
  \   'keymap': {"\<CR>": '<Over>(easymotion)'},
  \   'is_expr': 0,
  \   'is_stay': 1
  \ }), get(a:, 1, {}))
endfunction

noremap <silent><expr> <Space>/ incsearch#go(<SID>config_easyfuzzymotion()go
" FORMATTERS
au FileType javascript setlocal formatprg=prettier
au FileType javascript.jsx setlocal formatprg=prettier
au FileType typescript setlocal formatprg=prettier\ --parser\ typescript
au FileType html setlocal formatprg=js-beautify\ --type\ html
au FileType scss setlocal formatprg=prettier\ --parser\ css
au FileType css setlocal formatprg=prettier\ --parser\ csgo
" Changing cursor shape per mode
" 1 or 0 -> blinking block
" 2 -> solid block
" 3 -> blinking underscore
" 4 -> solid underscore
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

" vim-Go
map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
nnoremap <leader>a :cclose<CR>
autocmd FileType go nmap <leader>b  <Plug>(go-build)
autocmd FileType go nmap <leader>r  <Plug>(go-run)
let g:go_highlight_fields = 1

let g:go_auto_sameids = 1

noremap <leader>d :Dash<CR>

