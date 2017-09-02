#!/usr/bin/env bash

# runs mysql command

# http://stackoverflow.com/a/246128
SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
  DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
  SOURCE="$(readlink "$SOURCE")"
  [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"

# import the environment vars
source "$DIR/env.sh"

# get the mysql port
MYSQL_PORT="$($DIR/mysql_port.sh)"

# run the command with any args
mysql --host="$SYMFONY_ADDRESS" --user="$MYSQL_USER" --password="$MYSQL_PASSWORD" --port="$MYSQL_PORT" "$MYSQL_DATABASE"
