let mapleader = "\<Space>"
" Stealing a lot from jonhoo/configs/editor/.config/nvim/init.vim

" =============================================================================
" # PLUGINS
" =============================================================================
call plug#begin('~/.config/nvim/plugged')
Plug 'ciaranm/securemodelines'

" Creating colorschemes
Plug 'vim-scripts/SyntaxAttr.vim'
" VIM enhancements TODO: keep both? one? neither?
Plug 'justinmk/vim-sneak'
Plug 'unblevable/quick-scope'

" GUI enhancements
Plug 'itchyny/lightline.vim'
Plug 'machakann/vim-highlightedyank'
set mouse=a
set clipboard+=unnamed
Plug 'skywind3000/vim-quickui'
" Plug 'andymass/vim-matchup'

" Semantic language support
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'do': 'bash install.sh', }

" Syntactic language support
Plug 'rust-lang/rust.vim', { 'for': 'rust' }
Plug 'cespare/vim-toml'

"" (Optional) Multi-entry selection UI.
"" Plug 'junegunn/fzf'

" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" Markdown shown in the browser
function! BuildComposer(info) abort
  if a:info.status != 'unchanged' || a:info.force
    if has('nvim')
      !cargo build --release
    else
      !cargo build --release --no-default-features --features json-rpc
    endif
  endif
endfunction
Plug 'euclio/vim-markdown-composer', { 'do': function('BuildComposer') }

call plug#end()

" Plugin settings
let g:secure_modelines_allowed_items = [
                \ "textwidth",   "tw",
                \ "softtabstop", "sts",
                \ "tabstop",     "ts",
                \ "shiftwidth",  "sw",
                \ "expandtab",   "et",   "noexpandtab", "noet",
                \ "filetype",    "ft",
                \ "foldmethod",  "fdm",
                \ "readonly",    "ro",   "noreadonly", "noro",
                \ "rightleft",   "rl",   "norightleft", "norl",
                \ "colorcolumn"
                \ ]

 if has("termguicolors")
   set termguicolors
 endif
augroup qs_colors
  autocmd!
  autocmd ColorScheme * highlight QuickScopePrimary guifg=#aa390b gui=underline ctermfg=155 cterm=underline
  autocmd ColorScheme * highlight QuickScopeSecondary guifg=#000000 gui=underline ctermfg=81 cterm=underline
augroup END
 colorscheme brightsun
 highlight CocErrorFloat guifg=#000000
" colorscheme vividchalk

" QuickUI
let g:quickui_border_style = 2
let g:quickui_show_tip = 1
nnoremap <silent> <leader>m :call quickui#menu#open()<cr>
highlight link QuickBG Pmenusel
highlight link QuickSel Pmenu
highlight      QuickKey term=bold ctermfg=9 gui=bold guifg=#ffffff
highlight link QuickOff Normal
highlight link QuickHelp Pmenu
runtime! quickui-menu.vim

" Lightline
let g:lightline = { 'colorscheme': 'solarized' }

" from http://sheerun.net/2014/03/21/how-to-boost-your-vim-productivity/
if executable('rg')
   set grepprg=rg\ --no-heading\ --vimgrep
   set grepformat=%f:%l:%c:%m
endif

" rust.vim settings
let g:rust_conceal = 1

" coc.nvim Completion

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

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

" Use <c-.> to trigger completion.
inoremap <silent><expr> <C-B> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
" inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Or use `complete_info` if your vim support it, like:
inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" -- " LanguageClient
" -- nnoremap <F5> :call LanguageClient_contextMenu()<CR>
" -- " Or map each action separately
" -- nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
" -- nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
" -- nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>
" -- nnoremap <silent> <leader><leader> :call LanguageClient#explainErrorAtPoint()<CR>
" -- 
" -- " call deoplete#custom#option('auto_complete', v:false)
" -- let g:deoplete#enable_at_startup = 1
" -- autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
" -- inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" =============================================================================
" # Editor settings
" =============================================================================
if has('nvim')
    set inccommand=nosplit " Show the effects of a command incrementally as you type
end

set number

set shiftround      " Round indent to multiple of 'shiftwidth'
set softtabstop=4
set shiftwidth=4
set expandtab
set laststatus=2    " Always display status line
set autoindent
filetype plugin indent on
" set timeoutlen=300  " http://stackoverflow.com/questions/2158516/delay-before-o-opens-a-new-line
set encoding=utf-8
set scrolloff=2     " More context between cursor and border
set noshowmode      " showmode is redundant when we're using lightline
set hidden          " Can switch away from modified buffer (which becomes hidden)

" Deal with long lines
set linebreak       " visually break long lines on word boundaries (see breakat)
set breakindent     " ... and indent each wrapped section the same as the original line
set showbreak=•\    " ... with a bullet at the beginning of each wrapped section

set nojoinspaces    " Don't add extra spaces after a period on line join
set signcolumn=yes  " Always draw sign column. Prevent buffer moving when adding/deleting sign.

" TODO consider https://github.com/unblevable/quick-scope plus/instead of sneak
let g:sneak#s_next = 1      " sneak-clever-s: Press s (or S) to repeat last sneak search
let g:sneak#use_ic_scs = 1  " Use ignorecase and smartcase
let g:sneak#label = 1     " Label all the finds with semi-random letters

" TODO: find out what these do
let g:vim_markdown_new_list_item_indent = 0
let g:vim_markdown_auto_insert_bullets = 0
let g:vim_markdown_frontmatter = 1

set showcmd    " Show (partial) command in status line.

" Proper search
set incsearch
set ignorecase
set smartcase
" set gdefault -- deprecated, says neovim, b/c plugins could get confused

" Ctrl+h to stop highlighting the last search
vnoremap <C-h> :nohlsearch<cr>
nnoremap <C-h> :nohlsearch<cr>

" Jump to start and end of line using the home row keys
map H ^
map L $

" Do vertical movement by line on screen, not lines in buffer
nnoremap j gj
nnoremap k gk
nnoremap <down> gj
nnoremap <up> gk
inoremap <down> <C-o>gj
inoremap <up> <C-o>gk

" Allow Ctrl-{h,j,k,l} in insert mode as if h,j,k,l in normal more
inoremap <C-j> <C-o>gj
inoremap <C-k> <C-o>gk
inoremap <C-h> <Left>
inoremap <C-l> <Right>

" Navigation using coc
nmap <silent> ge <Plug>(coc-diagnostic-next)
nmap <silent> gE <Plug>(coc-diagnostic-prev)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" <leader><leader> toggles between buffers like :e#
nnoremap <leader><leader> <c-^>

" Open new file in same directory as current file
nnoremap <leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

" ? set shortmess+=c
" set completeopt+=preview
" set completeopt+=menuone
" set completeopt+=longest

set encoding=utf-8
set fileformat=unix

augroup ResyncSyntax
    autocmd!
    autocmd BufEnter * :syntax sync fromstart
augroup END

let g:markdown_fenced_languages = ['rust']
let g:markdown_minlines = 200
let g:markdown_syntax_conceal = 1
set conceallevel=2

" Work around Neovim infelicities
set noautoread
augroup MakeFileChangedWork
    autocmd!
    autocmd BufEnter,FocusGained * checktime
    if exists('##VimResume') && 0
        autocmd VimResume * checktime
    else
        autocmd CursorMoved,CursorMovedI,WinEnter * checktime
    endif
augroup END

"" let g:racer_experimental_completer = 1
""au FileType rust nmap gd <Plug>(rust-def)
""au FileType rust nmap gs <Plug>(rust-def-split)
""au FileType rust nmap gx <Plug>(rust-def-vertical)
""au FileType rust nmap <leader>gd <Plug>(rust-doc)

let g:LanguageClient_serverCommands = {
    \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
    \ }
