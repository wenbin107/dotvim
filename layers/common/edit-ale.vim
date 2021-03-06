if version > 800
Plug 'w0rp/ale', {'on': []}

"ale {{{
	let g:ale_sign_column_always = 1
	"%{ALEGetStatusLine()}
    let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '⬥ ok']
    let g:ale_set_highlights = 0
    "自定义error和warning图标
    let g:ale_sign_error = '✗'
    let g:ale_sign_warning = '⚡'
	let g:ale_echo_msg_error_str = 'E'
	let g:ale_echo_msg_warning_str = 'W'
	let g:ale_echo_msg_format = '[%linter%] %s [%severity%]' 
	let g:ale_set_loclist = 1
	let g:ale_set_quickfix = 0
	let g:ale_open_list = 1
	let g:ale_keep_list_window_open = 0
	let g:ale_lint_on_save = 1
	let g:ale_lint_on_text_changed = 0
    let g:ale_lint_on_enter = 0
    let g:ale_list_vertical = 0
"}}}
augroup load_ale
    autocmd!
    autocmd InsertEnter * call plug#load('ale') | autocmd! load_ale
augroup END


let g:ale_fixers = {
\  'php': [
\    'remove_trailing_lines',
\    'isort',
\    'trim_whitespace'
\   ]
\}
endif