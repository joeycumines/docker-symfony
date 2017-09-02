#!/usr/bin/env bash
# Exports the environment vars, run as source to get them.

# http://stackoverflow.com/a/246128
SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
  ENV_FILE_DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
  SOURCE="$(readlink "$SOURCE")"
  [[ $SOURCE != /* ]] && SOURCE="$ENV_FILE_DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
ENV_FILE_DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"

export $(cat "$ENV_FILE_DIR/../.env" | grep -v ^# | xargs)
