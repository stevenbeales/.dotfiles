

# Make Python use UTF-8 encoding for output to stdin, stdout, and stderr.
export PYTHONIOENCODING='UTF-8';

# Python shortcuts
alias aa='source env/bin/activate'
alias aactivate='source env/bin/activate'
alias cal='python -m calendar'
alias jcat='python -m json.tool'
alias p="ipython"
alias p2="python2"
alias p3="python3"
alias pdb='python -m ipdb'
alias pip="python3 -m pip"
# pretty print standard input
alias pprint='python -c "import pprint, sys, ast; pprint.pprint(ast.literal_eval(sys.stdin.read()))"'
# pretty print clipboard
alias pprint_clipboard='pbpaste | pprint'
alias prp="pipenv run python"
alias pydoc='python -m pydoc'
# Find python file
alias pyfind='find . -name "*.py"'
# Grep among .py files
alias pygrep='grep --include="*.py"'
alias pypi_submit="python setup.py register sdist bdist upload"
alias pypath='python -c "import sys; print sys.path" | tr "," "\n" | grep -v "egg"'
alias pyprof='python -m profile'
alias python='python3'
alias pytime='python -m timeit'
alias serve='python3 -m http.server'
alias server='python3 -m http.server'
# URL-encode strings
alias urlencode='python -c "import sys, urllib as ul; print ul.quote_plus(sys.argv[1]);"'
alias venv='python -m venv'

remove-pyc-files() {
  find . -name "*.pyc" -exec rm -rf {} \;
}