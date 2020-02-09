
w() {
  if [ $# -eq 0 ]; then
    code .
  else
    code "${1:-.}"
  fi
}


s() {
  if [ $# -eq 0 ]; then
    subl .
  else
    subl "${1:-.}"
  fi
}

e() {
  if [ $# -eq 0 ]; then
    nvim .
  else
    nvim "${1:-.}"
  fi
}

findEmptyDirsAndFiles(){
  find . -type f -exec bash -c 'if [ `cat "{}" |wc -w` -eq 0 ]; then echo "file - {}";fi' \; -or -empty -exec bash -c "echo dir - {}" \;
}

convertAllMDFilesToTabs(){
 find . -name '*.md' ! -type d -exec bash -c 'expand -t 4 "$0" > /tmp/e && mv /tmp/e "$0"' {} \;
}

# Update Zsh plugins
uz(){
  antibody bundle <~/.dotfiles/zsh/plugins.txt >~/.zsh_plugins.sh
  antibody update
}

# Search aliases/functions
falias() {
    CMD=$(
        (
            (alias)
            (functions | grep "()" | cut -d ' ' -f1 | grep -v "^_" )
        ) | fzf | cut -d '=' -f1
    );

    eval $CMD
}

# Lowercase every file in current dir
lowercaseCurrentDir(){
  for i in *; do mv $i ${(L)i}; done
}

# Show $PATH
path(){
  echo -e ${PATH//:/\\n}
}

# cd to Finder
cdf() {
    target=`osascript -e 'tell application "Finder" to if (count of Finder windows) > 0 then get POSIX path of (target of front Finder window as text)'`
    if [ "$target" != "" ]; then
        cd "$target"
    else
        echo 'No Finder window found' >&2
    fi
}

# md <folder-name> - Create folder and cd to it
md(){
  mkdir "$1"
  cd "$1"
}

# Get cheat sheet of command from cheat.sh. h <cmd>
h(){
  curl cheat.sh/${@:-cheat}
  # curl cheat.sh/$@
}

# cfile <file> - Copy content of file to clipboard
cfile(){
  cat $1 | pbcopy
}

# re <files> - Move files to trash.
re(){
  mv "$@" ~/.Trash
}

# zs - Search for most visited directories from z index and open them in finder.
zs() {
  z $1 && open .
}

# awe - Open path of current dir in Alfred.
# awe <file> - Open path of <file> in Alfred.
awe() {
    if [ $# -eq 0 ]; then   # If nothing is put as arguments open Alfred at the working directory so it list the content
        osascript -e "tell application \"Alfred 3\" to browse \"$(pwd)\""
    elif [ $# -eq 1 ]; then # If only one argument is set
        if [[ -d $1 ]] || [[ -f $1 ]]; then   # if it looks like a path or file, then make sure we send a full path to Alfred
            osascript -e "tell application \"Alfred 3\" to browse \"$(realpath -s "$1")\""
        else    # Any other words that are not a path would be sent to Alfred as is  (ex: alfs snip  ->  would open Alfred with "snip")
            osascript -e "tell application \"Alfred 3\" to search \"$*\""
        fi
    else   # If multiple arguments are set, then they are sent to Alfred as is. (ex: alfs define allo  ->  would pop Alfred with "define allo")
        osascript -e "tell application \"Alfred 3\" to search \"$*\""
    fi
}

# aw - Alfred file action search of current dir.
# aw <file> - Alfred file action search for file.
aw() {
    if [ $# -eq 0 ]; then    # If no arguments, pop Alfred Action Window in the working directory
        osascript -e "tell application \"Alfred 3\" to action \"$(pwd)\""
    else
        args=""
        argsAreAllPaths=true
        for arg in "$@" ; do
            filePath=$(realpath -s "$arg")
            if [[ -d $filePath ]] || [[ -f $filePath ]]; then    # if the arg is a file of folder, append the path to the args string to build a list for the osascript command
                args+="\"$filePath\","
            else
                argsAreAllPaths=false   # if one argument is not a folder or file path, then pop Alfred with the standard search and try to access Alfred Action Window. This also makes it clear there's a problem with one of the passed paths
                break
            fi
        done
        if [ "$argsAreAllPaths" = true ] ; then    # If all arguments are files or directories, open Alfred Action Window with the list
            args=${args%?} # remove the trailing comma
            osascript -e "tell application \"Alfred 3\" to action { $args }"
        else  # If not all arguments are files or directories, search as is and try to access the Alfred Action Window. The Action Window should pop if it's possible, or the standard Alfred Search would be shown (ex: alfa activity monitor  ->  Would open the file action window of the Activity Monitor)
            actionKey="keystroke (ASCII character 29)"  # (meaning: right arrow) Put your prefered action key (Alfred -> File Search -> Actions -> Show Actions) as applescript command for keystroke or key code (ex: "key code 98")
            delayBetweenEvents=0.1    # Play with the number if the action doesn't work correctly
            osascript -e "tell application \"Alfred 3\" to search \"$*\"" -e "delay $delayBetweenEvents" -e "tell application \"System Events\" to $actionKey"
        fi
    fi
}

# dirfiles <dir> - Give number of files found inside given directory.
dirfiles() {
    find "$1" -type f | wc -l
}

# Print current active Finder dir.
finder() {
  osascript 2>/dev/null <<EOF
    tell application "Finder"
      return POSIX path of (target of window 1 as alias)
    end tell
EOF
}

# down <url> - Download <url> and save to current dir.
down(){
curl -O "$1"
}

# cw - Copy working dir.
cw() { printf %s "$PWD" | pbcopy; }

# md <dir-name> - Create directory and cd into it.
md() {
  [[ -n "$1" ]] && mkdir -p "$1" && builtin cd "$1"
}

function cd() {
  builtin cd $1

  if [[ -n "$VIRTUAL_ENV" && -d ./venv ]] ; then
    deactivate
    . ./venv/bin/activate
  fi
}

function z() {
  builtin z $1

  if [[ -n "$VIRTUAL_ENV" && -d ./venv ]] ; then
    deactivate
    . ./venv/bin/activate
  fi
}

function pyproj() {
    mkdir "$1"
    cd "$1"
    git init
    python3 -m venv venv
    source venv/bin/activate
    pip install --upgrade pip
}

function goproj() {
    mkdir "$1"
    cd "$1"
    git init
    touch main.go
    echo "package main \n\n\n import 'fmt'\n\n func main() {\n\tfmt.Printf('Hello World')\n}" > main.go
}

camelcase() {
    perl -pe 's#(_|^)(.)#\u$2#g'
}

