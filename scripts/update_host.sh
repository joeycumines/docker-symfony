#!/usr/bin/env bash
# update the system host file so it can be accessed locally for development

# http://stackoverflow.com/a/246128
SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
  DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
  SOURCE="$(readlink "$SOURCE")"
  [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"

source "$DIR/env.sh"

NEW_HOSTS_LINE="$(sudo docker network inspect bridge | grep Gateway | grep -o -E '[0-9\.]+') $SYMFONY_ADDRESS"

if grep -q "$NEW_HOSTS_LINE" "/etc/hosts"; then
    echo "The line \"$NEW_HOSTS_LINE\" already exists in /etc/hosts"
else
    echo "Writing \"$NEW_HOSTS_LINE\" to /etc/hosts"
    if sudo sh -c "echo $NEW_HOSTS_LINE >> /etc/hosts"; then
        echo "SUCCESS"
    else
        >&2 echo "FAILURE"
        exit 1
    fi
fi
