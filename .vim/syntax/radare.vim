" Vim syntax file
" Language: Radare2 configuration
" Maintainer: Dustin Stevens

if exists("b:current_syntax")
    finish
endif

let s:cpo_save = &cpo
set cpo&vim

" Keywords
syn keyword radareEvaluate e
syn keyword radareType anal asm bin cfg cmd dbg diff dir esil file fs graph hex
syn keyword radareType http hud io key magic pdb rap rop scr search stack time zoom
syn keyword radareConstant true false

" Matches
syn match radareComment "#.*$"
syn match radareNumber "\<\(0\|[1-9]\d*\)\>"

" Regions

highlight link radareEvaluate Keyword
highlight link radareComment Comment
highlight link radareType Type
highlight link radareConstant Constant
highlight link radareNumber Number

let b:current_syntax = "radare"

let &cpo = s:cpo_save
unlet s:cpo_save
