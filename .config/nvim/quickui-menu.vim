function SwitchMouse()
    if (&g:mouse == "")
        set mouse=a
    else
        set mouse=
    endif
endfunction
call quickui#menu#switch('rust')
call quickui#menu#reset()

let s:menu = expand('<sfile>:p')
let s:edit = 'edit ' . s:menu
let s:source = 'source' . s:menu
call quickui#menu#install('&Tools', [
    \ [ '&Buffer...', 'call quickui#tools#list_buffer("e")'],
    \ [ '&Tab for Buffer...', 'call quickui#tools#list_buffer("tabedit")'],
    \ [ '&Mouse %{&g:mouse=="" ? "On" : "Off"}', 'call SwitchMouse()'],
    \ [ '--' ],
    \ [ '&Edit Menu', s:edit],
    \ [ '&Source Menu', s:source],
    \ ])

call quickui#menu#install('&Rust', [
    \ [ '&Next Error (ge)', 'normal ge'],
    \ [ '&Previous Error (gE)', 'normal gE'],
    \ [ '&Definition (gd)', 'normal gd'],
    \ [ '&Type Definition (gy)', 'normal gy'],
    \ [ '&Implementation (gi)', 'normal gi'],
    \ [ '&References (gr)', 'normal gr'],
    \ ], '<auto>', 'rs,rust')
