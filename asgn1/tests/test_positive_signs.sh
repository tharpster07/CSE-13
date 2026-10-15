#!/bin/bash
# Check output and exit status for positive_signs.
./calc +3 +4 > got.txt
CAT_EXIT_CODE=$?
printf '%s\n' 7 > expected.txt

if [ "$CAT_EXIT_CODE" -ne 0 ]; then
    echo "positive_signs: wrong exit code $CAT_EXIT_CODE"
    rm -f expected.txt got.txt
    exit 1
fi

if ! diff -u expected.txt got.txt; then
    echo "positive_signs: wrong output"
    rm -f expected.txt got.txt
    exit 1
fi

rm -f expected.txt got.txt
echo "positive_signs: PASS"
exit 0
