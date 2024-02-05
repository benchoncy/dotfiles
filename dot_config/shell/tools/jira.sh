# Jira find

alias j="jira"

alias jf='jira open $(jira issue list \
    -q "assignee = currentUser() AND resolution = Unresolved AND project IS NOT EMPTY" \
    --plain \
    --no-headers \
    --columns key,summary \
    | fzf) > /dev/null'

# Jira assign
function ja() {
    jira issue assign $1 ${2:-$(jira me)}
}
