#!/bin/bash
# Check output and exit status for near_boundary.
./calc 511 511 > got.txt
CAT_EXIT_CODE=$?
printf '%s\n' 1022 > expected.txt

if [ "$CAT_EXIT_CODE" -ne 0 ]; then
    echo "near_boundary: wrong exit code $CAT_EXIT_CODE"
    rm -f expected.txt got.txt
    exit 1
fi

if ! diff -u expected.txt got.txt; then
    echo "near_boundary: wrong output"
    rm -f expected.txt got.txt
    exit 1
fi

rm -f expected.txt got.txt
echo "near_boundary: PASS"
exit 0
