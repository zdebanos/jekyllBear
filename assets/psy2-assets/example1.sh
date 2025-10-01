#!/usrbin/env bash

# IFS and cycles over strings

ovoce="jablka hrusky tresne"

I=1

for ov in $ovoce; do
    echo "Iterace $I: $ov"
    I=$(( I+1 ))
done

OLDIFS=$IFS
IFS=':'

ovoce="jablka:hrusky:tresne"

for ov in $ovoce; do
    echo "Iterace $I: $ov"
    I=$(( I+1 ))
done

IFS=$OLDIFS
