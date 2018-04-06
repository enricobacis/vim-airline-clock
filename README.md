# vim-airline-clock
[vim-airline](https://github.com/bling/vim-airline) clock extension -
*for people that easily loose the sense of time in fullscreen vim sessions*

![vim-airline-clock](https://raw.github.com/enricobacis/vim-airline-clock/master/.screenshot/vim-airline-clock.png)

## requirements
* [vim-airline](https://github.com/bling/vim-airline): This extension is
  based on vim-airline (like vim-powerline but faster)

## installation

Install `vim-airline-clock` as any other plugin through the use of
[vim-plug](https://github.com/junegunn/vim-plug),
[Vundle](https://github.com/VundleVim/Vundle.vim),
[pathogen](https://github.com/tpope/vim-pathogen)
or your favourite vim plugin manager. The plugin is enabled by default.

## configuration

* If you want to disable the clock from automatically being added to
  airline

  ```vim
  let g:airline#extensions#clock#auto = 0
  ```

* If you want to change the clock format

  ```vim
  let g:airline#extensions#clock#format = '%H:%M:%S'
  ```

  The formatting is done by the
  [`strftime`](http://vimdoc.sourceforge.net/htmldoc/eval.html#strftime())
  function. Check its documentation for the accepted format.

* If you want to change the updatetime (in milliseconds)

  ```vim
  let g:airline#extensions#clock#updatetime = 1000
  ```

  The default value is the same as your `updatetime` (4000 milliseconds if
  you haven't changed it). You should consider lowering it to `1000` if you
  put seconds in your `clock#format`.

* If you want to add clock to a different location in airline

  ```vim
  let g:airline#extensions#clock#auto = 0
  function! AirlineInit()
    let g:airline_section_z = airline#section#create(['clock', g:airline_symbols.space, g:airline_section_z])
  endfunction
  autocmd User AirlineAfterInit call AirlineInit()
  ```

## updatetime timer

The updatetime option only work in vim version 8.0 and greater. In fact
vim-airline-clock uses the native vim timer feature introduced in vim 8.0.
The advantage is that no hack is needed in order to refresh the statusline.
