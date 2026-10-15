#!/bin/bash
# Check output and exit status for negative_result.
./calc 3 -4 > got.txt
CAT_EXIT_CODE=$?
printf '%s\n' -1 > expected.txt

if [ "$CAT_EXIT_CODE" -ne 0 ]; then
    echo "negative_result: wrong exit code $CAT_EXIT_CODE"
    rm -f expected.txt got.txt
    exit 1
fi

if ! diff -u expected.txt got.txt; then
    echo "negative_result: wrong output"
    rm -f expected.txt got.txt
    exit 1
fi

rm -f expected.txt got.txt
echo "negative_result: PASS"
exit 0
