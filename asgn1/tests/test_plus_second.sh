#!/bin/bash
# Check output and exit status for plus_second.
./calc -4 +3 > got.txt
CAT_EXIT_CODE=$?
printf '%s\n' -1 > expected.txt

if [ "$CAT_EXIT_CODE" -ne 0 ]; then
    echo "plus_second: wrong exit code $CAT_EXIT_CODE"
    rm -f expected.txt got.txt
    exit 1
fi

if ! diff -u expected.txt got.txt; then
    echo "plus_second: wrong output"
    rm -f expected.txt got.txt
    exit 1
fi

rm -f expected.txt got.txt
echo "plus_second: PASS"
exit 0
