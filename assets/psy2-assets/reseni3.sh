#!/usr/bin/env bash

# Pamatujte si, ze kdyz zadny .sh soubor neexistuje,
# tak se vytiskne i *.sh. Je potreba overit existenci.

for f in *.sh; do
    if [ -x "$f" ]; then
        echo "$f je spustitelny"
    else
        echo "$f neni spustitelny"
    fi
done