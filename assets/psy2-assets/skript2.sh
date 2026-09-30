#!/bin/bash

# Existence skriptu s absolutní cestou

absdir=$(cd $(dirname "$0"); pwd)
echo $absdir

if [ -e "$absdir/skript2.sh" ]; then
    echo "Skript existuje"
else
    echo "Skript neexistuje"
fi