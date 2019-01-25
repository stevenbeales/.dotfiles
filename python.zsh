
remove-pyc-files() {
  find . -name "*.pyc" -exec rm -rf {} \;
}


# python shortcuts
alias pip="python3 -m pip"
alias python='python3'
alias pypath='python -c "import sys; print sys.path" | tr "," "\n" | grep -v "egg"'
alias server='python3 -m http.server'
alias p="ipython"
alias p2="python2"
alias p3="python3"
alias pypi_submit="python setup.py register sdist bdist upload"
alias aa='source env/bin/activate'
alias aactivate='source env/bin/activate'
alias venv='python -m venv'
alias serve='python3 -m http.server'
alias pydoc='python -m pydoc'
alias pdb='python -m ipdb'
alias pytime='python -m timeit'
alias pyprof='python -m profile'
alias jcat='python -m json.tool'
alias cal='python -m calendar'
# pretty print standard input
alias pprint='python -c "import pprint, sys, ast; pprint.pprint(ast.literal_eval(sys.stdin.read()))"'
# pretty print clipboard
alias pprint_clipboard='pbpaste | pprint'
alias prp="pipenv run python"