#!/usr/bin/env bash
# echos the mysql port

# http://stackoverflow.com/a/246128
SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
  DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
  SOURCE="$(readlink "$SOURCE")"
  [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"

RUNNING_CONTAINERS=`( cd "$DIR/.."; sudo docker ps)`
PORT=""

for word in $RUNNING_CONTAINERS; do
    if [[ $word == *"->3306/tcp" ]]; then
        PORT=`echo "$word" | grep -oP '(?<=:).*?(?=->3306/tcp)'`
        break
    fi
done

if [ -z "$PORT" ]; then
    >&2 echo "FAILURE - could not find mysql port, is the container running?"
    exit 1
else
    echo "$PORT"
fi
