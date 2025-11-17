# Jira find

alias j="jira"

alias jf='jira open $(jira issue list \
    -q "assignee = currentUser() AND resolution = Unresolved AND project IS NOT EMPTY" \
    --plain \
    --no-headers \
    --columns key,summary \
    | fzf) > /dev/null'

# [j]ira [a]ssign
# Usage: ja <ticket> [assignee]
function ja() {
    jira issue assign $1 ${2:-$(jira me)}
    jira issue move $1 "In Progress"
}

# [j]ira [c]reate
# Usage: jc <title> [description]
function jc() {
    opts=""
    if [ -z "$2" ]; then
        # Add ticket description
        opts+=" -b$2"
    fi
    jira issue create --web --no-input -tStory -s$1 $opts
}
