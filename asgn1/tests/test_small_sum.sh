#!/bin/bash
# Check output and exit status for small_sum.
./calc -512 -512 > got.txt
CAT_EXIT_CODE=$?
printf '%s\n' -1024 > expected.txt

if [ "$CAT_EXIT_CODE" -ne 0 ]; then
    echo "small_sum: wrong exit code $CAT_EXIT_CODE"
    rm -f expected.txt got.txt
    exit 1
fi

if ! diff -u expected.txt got.txt; then
    echo "small_sum: wrong output"
    rm -f expected.txt got.txt
    exit 1
fi

rm -f expected.txt got.txt
echo "small_sum: PASS"
exit 0
