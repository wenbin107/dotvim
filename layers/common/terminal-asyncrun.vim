Plug 'skywind3000/asyncrun.vim'
let g:asyncrun_open = 6
let g:asyncrun_bell = 1

"nnoremap <Leader>at :call asyncrun#quickfix_toggle(6)<cr>
"nnoremap <silent> <leader>ac :AsyncRun gcc -Wall -O2 "$(VIM_FILEPATH)" -o "$(VIM_FILEDIR)/$(VIM_FILENOEXT)" <cr>
"nnoremap <silent> <Leader>ar :AsyncRun -raw -cwd=$(VIM_FILEDIR) "$(VIM_FILEDIR)/$(VIM_FILENOEXT)" <cr>
"nnoremap <silent> <Leader>am :AsyncRun -cwd=<root> cmake . <cr>
let g:asyncrun_rootmarks = ['.svn', '.git', '.root', '_darcs', 'build.xml'] 
"nnoremap <silent> <Leader>ab :AsyncRun -cwd=<root> make <cr>
"nnoremap <silent> <Leader>ap :AsyncRun -cwd=<root> -mode=4 make run <cr>

function! AsyncRunMake()
    if &filetype == 'python'
        execute 'CocCommand python.execInTerminal'
    elseif &filetype == 'go'
        execute 'AsyncRun! -cwd=<root> -raw go build "$(VIM_RELNAME)"'
    endif
endfunction

function! AsyncRunRun()
    if &filetype == 'php'
        execute 'AsyncRun! -mode=term -pos=bottom -rows=10 -cwd=<root> php $(VIM_RELNAME)'
    elseif &filetype == 'c'
        execute 'AsyncRun! -mode=term -pos=bottom -rows=10 gcc -Wall -O2 "$(VIM_FILEPATH)" -o "$(VIM_FILEDIR)/$(VIM_FILENOEXT)" ; "$(VIM_FILEDIR)/$(VIM_FILENOEXT)"'
    elseif &filetype == 'python'
        execute 'CocCommand python.execInTerminal'
        "let $PYTHONNUNBUFFERED=1
        "execute 'AsyncRun! -cwd=<root> -raw python %'
        let $PYTHONNUNBUFFERED=1
    elseif &filetype == 'go'
        execute 'AsyncRun! -mode=term -pos=bottom -rows=10 -cwd=<root> -raw go run "$(VIM_RELNAME)"'
    elseif &filetype == 'sh'
        execute 'AsyncRun! -mode=term -pos=bottom -rows=10 -cwd=<root> sh "$(VIM_RELNAME)"'
    elseif &filetype == 'java'
        execute 'AsyncRun! -mode=term -pos=bottom -rows=10 -cwd=<root> javac "$(VIM_RELNAME)" ; java $(VIM_FILENOEXT)'
    endif
endfunction

function! AsyncRunProject()
endfunction