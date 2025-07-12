#!/bin/bash

if [ "$@" != "" ]; then
    export PYTEST_ARGS="$@"
fi

set -e

cd `dirname $0`/dupCI

docker compose up
docker compose logs 2>&1 | grep -E '== .* (failed|passed|skipped).* in .* ==' | sort
