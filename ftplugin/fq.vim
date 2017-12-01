" folding -------------------- {{{
setlocal foldmethod=expr
setlocal foldexpr=GetFqFold(v:lnum)

function! GetFqFold(lnum)
    "only fold lines not staring with DNA base (or N)
    if getline(a:lnum) =~? '\v^[NATGC].*$'
    "if getline(a:lnum) =~? '\v^[\@\+].*$'
        return '0'
    endif

    return '1'
  endfunction
" ---------------------- }}}
" sections -------------------- {{{
" lines starting with @ are section headings ([[ and ]] to jump between them)
noremap <script> <buffer> <silent> [[ <nop>
noremap <script> <buffer> <silent> ]] <nop>

noremap <script> <buffer> <silent> [] <nop>
noremap <script> <buffer> <silent> ][ <nop>

function! s:NextSection(type, backwards)
endfunction

noremap <script> <buffer> <silent> ]]
        \ :call <SID>NextSection(1, 0)<cr>

noremap <script> <buffer> <silent> [[
        \ :call <SID>NextSection(1, 1)<cr>

noremap <script> <buffer> <silent> ][
        \ :call <SID>NextSection(2, 0)<cr>

noremap <script> <buffer> <silent> []
        \ :call <SID>NextSection(2, 1)<cr>

if !exists("g:count_section")
	let g:count_section = 10
endif

function! s:NextSection(type, backwards)
	if a:type == 1
		let mycount = 1
	elseif a:type == 2
		if g:count_section > 0
			let mycount = g:count_section
		else
			echom "g:count_section needs to be > 0"
		endif
	endif

    if a:backwards
        let dir = '?'
    else
        let dir = '/'
    endif

        let pattern = '\v^[NATGC].*$'
    execute 'silent normal! ' . mycount . dir . pattern . "\r"
  endfunction
" ---------------------- }}}
