#!/bin/bash
# Check output and exit status for mixed_signs.
./calc -3 4 > got.txt
CAT_EXIT_CODE=$?
printf '%s\n' 1 > expected.txt

if [ "$CAT_EXIT_CODE" -ne 0 ]; then
    echo "mixed_signs: wrong exit code $CAT_EXIT_CODE"
    rm -f expected.txt got.txt
    exit 1
fi

if ! diff -u expected.txt got.txt; then
    echo "mixed_signs: wrong output"
    rm -f expected.txt got.txt
    exit 1
fi

rm -f expected.txt got.txt
echo "mixed_signs: PASS"
exit 0
