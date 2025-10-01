#!/usr/bin/env bash

[ "$#" -gt 0 ] || {
    echo "ERROR"
    exit 1
}

border="$1"
shift
arr=()

while [ "$#" -gt 0 ]; do
    if [ "$1" -ge "$border" ]; then
        arr+=( $1 )
    fi
    shift
done

if [ ${#arr[@]} -eq 0 ]; then
    echo "NO ELEMENTS"
    exit 2
else
    echo "GREATER: ${arr[@]}"
fi
