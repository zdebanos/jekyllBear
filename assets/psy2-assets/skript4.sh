#!/usr/bin/env bash

# IFS příklad

set -ueo pipefail

polozky="jablka:hrusky:tresne"
OLDIFS="$IFS"
IFS=":"

for p in $polozky; do
    echo "$p"
done

