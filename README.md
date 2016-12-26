# vim-airline-clock
[vim-airline](https://github.com/bling/vim-airline) clock extension -
*for people that easily loose the sense of time in fullscreen vim sessions*

![vim-airline-clock](https://github.com/enricobacis/vim-airline-clock/blob/master/.screenshot/vim-airline-clock.png)

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

* If you want to change the clock format
> let g:airline#extensions#clock#format = '%H:%M:%S'

  The formatting is done by the
  [`strftime`](http://vimdoc.sourceforge.net/htmldoc/eval.html#strftime())
  function. Check its documentation for the accepted format.

* If you want to change the updatetime (in milliseconds)
> let g:airline#extensions#clock#updatetime = 1000

  The default value is the same as your `updatetime` (4000 milliseconds if
  you haven't changed it). You should consider lowering it to `1000` if you
  put seconds in your `clock#format`.

## updatetime timer

The updatetime option only work in vim version 8.0 and greater. In fact
vim-airline-clock uses the native vim timer feature introducted in vim 8.0.
The advantage is that no hack is needed in order to refresh the statusline.
