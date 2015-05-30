" Boilerplate snippets
map <buffer> ùi o#include <><Esc>i
map <buffer> ùo o#include ""<Esc>i
imap <buffer> ùi #include <
imap <buffer> ùo #include "
imap <buffer> ùm int main(int argc, char* argv[])<CR>{<CR><CR>}<CR><Esc>kki<Tab>
imap <buffer> ùu using namespace std;<CR>
imap <buffer> ùs std::

" Handle template files for the alternate plugin
let g:alternateExtensions_h    =  "txx,hxx,cxx,cpp,cc,CC"
let g:alternateExtensions_txx  =  "hxx,cxx,cpp,cc,CC,h,hpp"
let g:alternateExtensions_hxx  =  "cxx,cpp,cc,CC,h,hpp"
let g:alternateExtensions_cxx  =  "h,hpp,txx,hxx"
let g:alternateExtensions_cpp  =  "h,hpp,txx,hxx"

" Comment style for tpope/vim-commentary
setlocal commentstring=//\ %s
