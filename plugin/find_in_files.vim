" Vim plugin with helper function(s) for --find_in_files in current directory
" Maintainer: Sappy Goel <sappygoel@yahoo.com>
" Creation Date: 11 July 2003 <Initial Version>
" 
" Version 1.01: 25 Nov 2003
" changes to use grep and copen as suggested by Gary Johnson
" This is similar to grep command of VIM, additional functionality is the
" following:
" 	Use <F3> or :call FF("<string>")
" 		to search in the list of files in current directory
" 	Use <F4> or :call FC("<string>")
" 		to search in the current file
" 	<F2> to open the file in which the search string is found
" 	
" 	If <F3>/<F4> is used current word beneath the cursor is used as search 
" 	string 

function! Open_file()
	let lineTxt=getline(".")
	let fStrNo=match(lineTxt, "|")
	let fileName=strpart(lineTxt, 0, fStrNo)
	let fLineNo=match(lineTxt, "|", fStrNo+1)
	let lineNo=strpart(lineTxt,fStrNo+1, fLineNo-fStrNo-1)
	execute "wincmd k"
	if bufexists(fileName)
			let s:bufNo = bufnr(bufname(fileName))
			execute "buffer" s:bufNo
			execute lineNo
	else
			execute "e " fileName
			let s:bufNo = bufnr(bufname(fileName))
			execute "buffer" s:bufNo
			execute lineNo
	endif
endfunction

function! FF(str)
	execute "grep" a:str "*"
	execute "copen"
endfunction

function! FC(str)
	execute "grep" a:str "% a"
	execute "copen"
endfunction

function! Call_find_in_files()
	let cw = expand("<cword>")
	call FF(cw)
endfunction 

function! Call_find_in_cr_file()
	let cw = expand("<cword>")
	call FC(cw)
endfunction 

map <F2> :call Open_file() <CR>
map <F3> :call Call_find_in_files() <CR>
map <F4> :call Call_find_in_cr_file() <CR>
