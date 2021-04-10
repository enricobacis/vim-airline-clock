" MIT License. Copyright (c) 2016 Enrico Bacis
" vim: et ts=2 sts=2 sw=2

scriptencoding utf-8

" Avoid installing twice
if exists('g:loaded_vim_airline_clock')
  finish
endif

let g:loaded_vim_airline_clock = 1
let s:spc = g:airline_symbols.space

if !exists('g:airline#extensions#clock#auto')
  let g:airline#extensions#clock#auto = 1
endif

if !exists('g:airline#extensions#clock#format')
  let g:airline#extensions#clock#format = '%H:%M'
endif

if !exists('g:airline#extensions#clock#updatetime')
  let g:airline#extensions#clock#updatetime = &updatetime
endif

function! airline#extensions#clock#init(ext)
  call airline#parts#define_raw('clock', '%{airline#extensions#clock#get()}')
  if g:airline#extensions#clock#auto
    call a:ext.add_statusline_func('airline#extensions#clock#apply')
  endif
endfunction

function! airline#extensions#clock#apply(...)
  let w:airline_section_z = get(w:, 'airline_section_z', g:airline_section_z)
  if g:airline_right_alt_sep != ''
    let w:airline_section_z .= s:spc.g:airline_right_alt_sep
  endif
  let w:airline_section_z .= s:spc.'%{airline#extensions#clock#get()}'
endfunction

function! airline#extensions#clock#get()
  return strftime(g:airline#extensions#clock#format)
endfunction

if v:version < 800
  finish
endif

function! airline#extensions#clock#timerfn(timer)
  call airline#update_statusline()
endfunction

let g:airline#extensions#clock#timer = timer_start(
      \ g:airline#extensions#clock#updatetime,
      \ 'airline#extensions#clock#timerfn',{'repeat':-1})

" Pause the timer when Airline is disabled, un-pause when it's re-enabled
autocmd User AirlineToggledOff call timer_pause(g:airline#extensions#clock#timer, 1)
autocmd User AirlineToggledOn call timer_pause(g:airline#extensions#clock#timer, 0)
