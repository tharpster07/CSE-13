#!/bin/bash
# Check output and exit status for leading_zero.
./calc 03 4 > got.txt
CAT_EXIT_CODE=$?
printf '%s\n' 'BAD INPUT' > expected.txt

if [ "$CAT_EXIT_CODE" -eq 0 ]; then
    echo "leading_zero: wrong exit code $CAT_EXIT_CODE"
    rm -f expected.txt got.txt
    exit 1
fi

if ! diff -u expected.txt got.txt; then
    echo "leading_zero: wrong output"
    rm -f expected.txt got.txt
    exit 1
fi

rm -f expected.txt got.txt
echo "leading_zero: PASS"
exit 0
