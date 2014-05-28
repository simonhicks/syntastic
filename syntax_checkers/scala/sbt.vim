"============================================================================
"File:        sbt.vim
"Description: Syntax checking plugin for syntastic.vim
"License:     This program is free software. It comes without any warranty,
"             to the extent permitted by applicable law. You can redistribute
"             it and/or modify it under the terms of the Do What The Fuck You
"             Want To Public License, Version 2, as published by Sam Hocevar.
"             See http://sam.zoy.org/wtfpl/COPYING for more details.
"
"============================================================================

if exists("g:loaded_syntastic_scala_sbt_checker")
    finish
endif
let g:loaded_syntastic_scala_sbt_checker = 1

if !exists('g:syntastic_scala_options')
    let g:syntastic_scala_options = ''
endif

let s:save_cpo = &cpo
set cpo&vim

function! SyntaxCheckers_scala_sbt_GetLocList() dict
    return SyntasticMake({
          \ 'makeprg': 'cat ./target/streams/compile/compile/\$global/streams/out | grep error',
          \ 'errorformat': '[error]\ %f:%l:\ %m' })
endfunction

call g:SyntasticRegistry.CreateAndRegisterChecker({
    \ 'filetype': 'scala',
    \ 'name': 'sbt'})

let &cpo = s:save_cpo
unlet s:save_cpo

" vim: set et sts=4 sw=4:
