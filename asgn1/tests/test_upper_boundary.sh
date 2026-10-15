#!/bin/bash
# Check output and exit status for upper_boundary.
./calc 512 0 > got.txt
CAT_EXIT_CODE=$?
printf '%s\n' 512 > expected.txt

if [ "$CAT_EXIT_CODE" -ne 0 ]; then
    echo "upper_boundary: wrong exit code $CAT_EXIT_CODE"
    rm -f expected.txt got.txt
    exit 1
fi

if ! diff -u expected.txt got.txt; then
    echo "upper_boundary: wrong output"
    rm -f expected.txt got.txt
    exit 1
fi

rm -f expected.txt got.txt
echo "upper_boundary: PASS"
exit 0
