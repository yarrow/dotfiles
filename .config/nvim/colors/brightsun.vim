" First remove all existing highlighting.
set background=light
hi clear
if exists("syntax_on")
  syntax reset
endif

hi def markdownItalic	term=italic,underline cterm=italic,underline gui=italic,underline

let g:colors_name = "brightsun"

" See /usr/local/share/nvim/runtime/syntax/syncolor.vim
hi Comment	term=bold cterm=NONE ctermfg=DarkBlue ctermbg=NONE gui=NONE guifg=#003541 guibg=NONE
" hi Constant	term=underline cterm=NONE ctermfg=DarkRed ctermbg=NONE gui=bold guifg=#aa390b guibg=NONE
hi Constant	term=underline cterm=NONE ctermfg=DarkRed ctermbg=NONE gui=bold guifg=#0606be guibg=NONE
hi rustString term=underline cterm=NONE ctermfg=DarkRed ctermbg=NONE gui=bold guifg=#429628 guibg=NONE
hi Special	term=bold cterm=NONE ctermfg=DarkMagenta ctermbg=NONE gui=NONE guifg=#500b90 guibg=NONE
hi Identifier	term=underline cterm=NONE ctermfg=DarkGreen ctermbg=NONE gui=NONE guifg=#266711 guibg=NONE
hi Statement	term=bold cterm=NONE ctermfg=Brown ctermbg=NONE gui=bold guifg=#715600 guibg=NONE
hi PreProc	term=underline cterm=NONE ctermfg=DarkMagenta ctermbg=NONE gui=NONE guifg=#500b90 guibg=NONE
hi Type		term=underline cterm=NONE ctermfg=DarkCyan ctermbg=NONE gui=NONE guifg=#0606be guibg=NONE
hi Underlined	term=underline cterm=underline ctermfg=DarkMagenta gui=underline guifg=#500b90
hi Ignore	term=NONE cterm=NONE ctermfg=white ctermbg=NONE gui=NONE guifg=#eee8d5 guibg=NONE
hi Error		term=reverse cterm=NONE ctermfg=White ctermbg=Red gui=NONE guifg=#eee8d5 guibg=#cb4b16
hi Todo		term=standout cterm=NONE ctermfg=Black ctermbg=Yellow gui=NONE guifg=#003541 guibg=#b4a000
hi Pmenu guibg=#00e5e8
hi Pmenusel guibg=#2aa7ff
"hi Search ctermbg=11 guibg=#e0d470
 hi Search ctermbg=11 guibg=#dcce5d
"hi Search ctermbg=11 guibg=#e5da83
