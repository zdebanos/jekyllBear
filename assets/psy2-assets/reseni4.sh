#!/usr/bin/env bash

line=1

while read -r radek; do
    echo "$line: $radek"
    line=$(( line+1 ))
done < skript1.sh
