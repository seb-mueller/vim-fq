if exists("b:current_syntax")
    finish
endif

syntax keyword fqKeyword marks
syntax keyword fqFunc realistic

syntax match fqComment "\v^\@.*$"
syntax match fqComment "\v^\+.*$"
syntax match fqpolyA "\vAA+$"

highlight link fqKeyword Keyword
highlight link fqFunc Function
highlight link fqpolyA Comment
highlight link fqComment function

"Highlighting Strings
"syntax region potionString start=/\v"/ skip=/\v\\./ end=/\v"/
"highlight link potionString String
"echom "Our syntax highlighting code will go here."

let b:current_syntax = "fq"
