# Useful quick docker functions

DEFAULT_IMAGE="ubuntu:latest"
DEFAULT_COMMAND="/bin/bash"

# Start a Docker container running with a given command
# Defaults to $DEFAULT_COMMAND running in $DEFAULT_IMAGE
function drun() {
 docker run -it "${1:-$DEFAULT_IMAGE}" "${2:-$DEFAULT_COMMAND}"
}

# Enter a running Docker container.
function denter() {
 if [[ ! "$1" ]] ; then
     echo "You must supply a container ID or name."
     return 0
 fi

 docker exec -it $1 bash
 return 0
}