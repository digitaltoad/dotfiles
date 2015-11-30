# Work dir shortcut
function wo() {
  cd ~/Projects/Work/$1;
}

function _wo() {
  _files -W ~/Projects/Work -/
}
compdef _wo wo

# Projects dir shortcut
function p() {
  cd ~/Projects/$1;
}

function _p() {
  _files -W ~/Projects -/
}
compdef _p p

function pp() {
  cd ~/Projects/Personal/$1;
}

function _pp() {
  _files -W ~/Projects/Personal -/
}
compdef _pp pp

# Autocomplete ruby tests
_ruby_tests() {
  if [[ -n $words[2] ]]; then
    compadd `ruby_test -l ${words[2]}`
  fi
}
compdef _ruby_tests ruby_test
