" Vim plugin with helper function(s) for --find_in_files in current directory
" Maintainer: Sappy Goel <sappygoel@yahoo.com>
" Last Change: 11 July 2003

function! Str_to_no(str)
		let multiplier=1
		let nom=0
		let length=strlen(a:str)
		while (length > 0)
				let tmpStr=strpart(a:str,length-1,1)
				let tmp=char2nr(tmpStr)-char2nr("0")
				let nom=nom+multiplier*tmp
				let multiplier=multiplier*10
				let length=length-1
		endwhile
		return nom
endfunction

function! Open_file()
	let lineTxt=getline(".")
	let fStrNo=match(lineTxt, ":")
	let fileName=strpart(lineTxt, 0, fStrNo)
	let fLineNo=match(lineTxt, ":", fStrNo+1)
	let lineNo=strpart(lineTxt,fStrNo+1, fLineNo-fStrNo-1)
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
	execute "!findstr /N" a:str "* > c:\\xyz"
	execute "e c:\\xyz"
endfunction

function! FC(str)
	execute "!findstr /N" a:str "% a> c:\\xyz"
	execute "e c:\\xyz"
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
