#!/usr/bin/env bash

absdir=$(cd $(dirname "$0"); pwd)

if [ -e "$absdir/soubor.txt" ]; then
    echo "Soubor.txt nalezen."
else
    echo "Soubor.txt proste zmizel."
fi