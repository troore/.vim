
syntax on

set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent
set smartindent
set cindent

set ttymouse=xterm2  " solve vim mouse cannot work in tmux.
set mouse=a
set nu

set tags=./tags;,tags;

if v:version >= 700
set omnifunc=syntaxcomplete#Complete " override built-in C omnicomplete with C++ OmniCppComplete plugin
let OmniCpp_GlobalScopeSearch   = 1
let OmniCpp_DisplayMode         = 1
let OmniCpp_ShowScopeInAbbr     = 0 "do not show namespace in pop-up
let OmniCpp_ShowPrototypeInAbbr = 1 "show prototype in pop-up
let OmniCpp_ShowAccess          = 1 "show access in pop-up
let OmniCpp_SelectFirstItem     = 1 "select first item in pop-up
set completeopt=menuone,menu,longest
endif
if version >= 700
  let g:SuperTabDefaultCompletionType = "<C-X><C-O>"
  highlight   clear
  highlight   Pmenu         ctermfg=0 ctermbg=2
  highlight   PmenuSel      ctermfg=0 ctermbg=7
  highlight   PmenuSbar     ctermfg=7 ctermbg=0
  highlight   PmenuThumb    ctermfg=0 ctermbg=7
endif

function! UpdateTags()
  execute ":!ctags -R --languages=C++ --c++-kinds=+p --fields=+iaS --extra=+q ./"
  echohl StatusLine | echo "C/C++ tag updated" | echohl None
endfunction
nnoremap <F4> :call UpdateTags()


" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'OmniCppComplete'

Plugin 'ervandew/supertab'

" Plugin 'Lokaltog/vim-powerline'

Plugin 'vim-airline/vim-airline'

Plugin 'vim-airline/vim-airline-themes'

Plugin 'scrooloose/nerdtree'
Plugin 'Yggdroot/LeaderF'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" vim-airline configurations
" let g:airline#extensions#tabline#enabled = 1
