#!/bin/bash
PATH=$1
FILES=$2

/bin/mkdir -p "$PWD/grep_results"

while read p; do
    echo "=============================" >> $PWD/grep_results/$PATH-$FILES-results.txt
    echo "$p" >> $PWD/grep_results/$PATH-$FILES-results.txt
    /usr/bin/grep -H -p -n -r "$p" $FILES >> $PWD/grep_results/$PATH-$FILES-results.txt
done <$PWD/grep/$PATH.txt