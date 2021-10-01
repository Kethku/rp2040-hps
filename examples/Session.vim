let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd C:/dev/Projects/hps/rusty_blinker/examples
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +80 tx.rs
badd +1 c:/dev/Projects/hps/rusty_blinker/src/main.rs
badd +83 C:/dev/Projects/hps/rusty_blinker/examples/rx.rs
badd +60 C:/dev/Projects/hps/rust-dw1000/dw1000/src/hl/mod.rs
badd +27 C:/dev/Projects/hps/rust-dw1000/dw1000/src/hl/ready.rs
badd +42 C:/dev/Projects/hps/rust-dw1000/dw1000/src/hl/state_impls.rs
badd +0 C:/dev/Projects/hps/rust-dw1000/dw1000/src/hl/status.rs
badd +16 ~/AppData/Local/nvim/init.lua/../fnl/module/bindings.fnl
argglobal
%argdel
$argadd tx.rs
edit tx.rs
let s:save_splitbelow = &splitbelow
let s:save_splitright = &splitright
set splitbelow splitright
wincmd _ | wincmd |
vsplit
wincmd _ | wincmd |
vsplit
wincmd _ | wincmd |
vsplit
wincmd _ | wincmd |
vsplit
wincmd _ | wincmd |
vsplit
5wincmd h
wincmd w
wincmd w
wincmd w
wincmd w
wincmd w
let &splitbelow = s:save_splitbelow
let &splitright = s:save_splitright
wincmd t
let s:save_winminheight = &winminheight
let s:save_winminwidth = &winminwidth
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
exe 'vert 1resize ' . ((&columns * 24 + 160) / 320)
exe 'vert 2resize ' . ((&columns * 24 + 160) / 320)
exe 'vert 3resize ' . ((&columns * 197 + 160) / 320)
exe 'vert 4resize ' . ((&columns * 24 + 160) / 320)
exe 'vert 5resize ' . ((&columns * 22 + 160) / 320)
exe 'vert 6resize ' . ((&columns * 24 + 160) / 320)
argglobal
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let &fdl = &fdl
let s:l = 80 - ((45 * winheight(0) + 36) / 73)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 80
normal! 010|
wincmd w
argglobal
if bufexists("C:/dev/Projects/hps/rust-dw1000/dw1000/src/hl/mod.rs") | buffer C:/dev/Projects/hps/rust-dw1000/dw1000/src/hl/mod.rs | else | edit C:/dev/Projects/hps/rust-dw1000/dw1000/src/hl/mod.rs | endif
if &buftype ==# 'terminal'
  silent file C:/dev/Projects/hps/rust-dw1000/dw1000/src/hl/mod.rs
endif
balt C:/dev/Projects/hps/rust-dw1000/dw1000/src/hl/ready.rs
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let &fdl = &fdl
let s:l = 60 - ((59 * winheight(0) + 36) / 73)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 60
normal! 0
wincmd w
argglobal
if bufexists("~/AppData/Local/nvim/init.lua/../fnl/module/bindings.fnl") | buffer ~/AppData/Local/nvim/init.lua/../fnl/module/bindings.fnl | else | edit ~/AppData/Local/nvim/init.lua/../fnl/module/bindings.fnl | endif
if &buftype ==# 'terminal'
  silent file ~/AppData/Local/nvim/init.lua/../fnl/module/bindings.fnl
endif
balt C:/dev/Projects/hps/rust-dw1000/dw1000/src/hl/mod.rs
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let &fdl = &fdl
let s:l = 140 - ((37 * winheight(0) + 36) / 73)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 140
normal! 0
wincmd w
argglobal
if bufexists("C:/dev/Projects/hps/rust-dw1000/dw1000/src/hl/status.rs") | buffer C:/dev/Projects/hps/rust-dw1000/dw1000/src/hl/status.rs | else | edit C:/dev/Projects/hps/rust-dw1000/dw1000/src/hl/status.rs | endif
if &buftype ==# 'terminal'
  silent file C:/dev/Projects/hps/rust-dw1000/dw1000/src/hl/status.rs
endif
balt C:/dev/Projects/hps/rust-dw1000/dw1000/src/hl/mod.rs
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let &fdl = &fdl
let s:l = 4 - ((3 * winheight(0) + 36) / 73)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 4
normal! 0
wincmd w
argglobal
if bufexists("C:/dev/Projects/hps/rust-dw1000/dw1000/src/hl/ready.rs") | buffer C:/dev/Projects/hps/rust-dw1000/dw1000/src/hl/ready.rs | else | edit C:/dev/Projects/hps/rust-dw1000/dw1000/src/hl/ready.rs | endif
if &buftype ==# 'terminal'
  silent file C:/dev/Projects/hps/rust-dw1000/dw1000/src/hl/ready.rs
endif
balt C:/dev/Projects/hps/rust-dw1000/dw1000/src/hl/mod.rs
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let &fdl = &fdl
let s:l = 81 - ((30 * winheight(0) + 36) / 73)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 81
let s:c = 27 - ((21 * winwidth(0) + 11) / 22)
if s:c > 0
  exe 'normal! ' . s:c . '|zs' . 27 . '|'
else
  normal! 027|
endif
wincmd w
argglobal
if bufexists("c:/dev/Projects/hps/rusty_blinker/src/main.rs") | buffer c:/dev/Projects/hps/rusty_blinker/src/main.rs | else | edit c:/dev/Projects/hps/rusty_blinker/src/main.rs | endif
if &buftype ==# 'terminal'
  silent file c:/dev/Projects/hps/rusty_blinker/src/main.rs
endif
balt tx.rs
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let &fdl = &fdl
let s:l = 94 - ((30 * winheight(0) + 36) / 73)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 94
normal! 012|
wincmd w
3wincmd w
exe 'vert 1resize ' . ((&columns * 24 + 160) / 320)
exe 'vert 2resize ' . ((&columns * 24 + 160) / 320)
exe 'vert 3resize ' . ((&columns * 197 + 160) / 320)
exe 'vert 4resize ' . ((&columns * 24 + 160) / 320)
exe 'vert 5resize ' . ((&columns * 22 + 160) / 320)
exe 'vert 6resize ' . ((&columns * 24 + 160) / 320)
tabnext 1
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0&& getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20 shortmess=filnxtToO
let &winminheight = s:save_winminheight
let &winminwidth = s:save_winminwidth
let s:sx = expand("<sfile>:p:r")."x.vim"
if filereadable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &g:so = s:so_save | let &g:siso = s:siso_save
set hlsearch
let g:this_session = v:this_session
let g:this_obsession = v:this_session
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
