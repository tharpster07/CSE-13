#!/bin/bash
# Check output and exit status for huge_integer.
./calc 999999999999999999999999 1 > got.txt
CAT_EXIT_CODE=$?
printf '%s\n' 'TOO BIG' > expected.txt

if [ "$CAT_EXIT_CODE" -eq 0 ]; then
    echo "huge_integer: wrong exit code $CAT_EXIT_CODE"
    rm -f expected.txt got.txt
    exit 1
fi

if ! diff -u expected.txt got.txt; then
    echo "huge_integer: wrong output"
    rm -f expected.txt got.txt
    exit 1
fi

rm -f expected.txt got.txt
echo "huge_integer: PASS"
exit 0
