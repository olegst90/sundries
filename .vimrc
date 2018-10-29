set incsearch
set hlsearch
set autoindent
set cindent
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab

set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<

" errorformat=%f:%l:%c: error: %m  

nnoremap <Space> i_<Esc>r

set number

fun! FindFiles(filename)
      let error_file = tempname()
      silent exe '!find . -name "'.a:filename.'" | xargs file | sed "s/:/:1:/" > '.error_file
      set errorformat=%f:%l:%m
      exe "cfile ". error_file
      copen
      call delete(error_file)
endfun

command! -nargs=1 FindFile call FindFiles(<q-args>)
set tags=tags;

