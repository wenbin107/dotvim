"Plug 'taohaoge/python-mode',{ 'for': 'python'}
Plug 'kh3phr3n/python-syntax',{ 'for': 'python'}
"Plug 'davidhalter/jedi-vim'
Plug 'vim-scripts/indentpython.vim',{ 'for': 'python'}
fun! LoadPythonEnv()
    "python with virtualenv support
py << EOF
    import os
    import sys
    if 'VIRTUAL_ENV' in os.environ:
        project_base_dir = os.environ['VIRTUAL_ENV']
        activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
        execfile(activate_this, dict(__file__=activate_this))
EOF
endfun

autocmd FileType python call LoadPythonEnv()
