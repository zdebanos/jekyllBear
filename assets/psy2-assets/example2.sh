#!/usr/bin/env bash

echo "Na zacatku jste zadal $# argumentu"
echo "Nyni je proiterujeme pres while loop"

I=1

while [ $# -gt 0 ]; do
    echo "Arg $I je $1"
    let I++
    shift
done
