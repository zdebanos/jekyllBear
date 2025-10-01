#!/usr/bin/env bash

[ "$#" -gt 0 ] || {
    echo "ERROR"
    exit 1
}

border="$1"
arr=()
shift

for n in "$@"; do
    if [ $n -ge $border ]; then
        arr+=($n)
    fi
done

echo ${arr[@]}
