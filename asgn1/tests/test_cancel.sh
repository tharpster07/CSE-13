#!/bin/bash
# Check output and exit status for cancel.
./calc -512 512 > got.txt
CAT_EXIT_CODE=$?
printf '%s\n' 0 > expected.txt

if [ "$CAT_EXIT_CODE" -ne 0 ]; then
    echo "cancel: wrong exit code $CAT_EXIT_CODE"
    rm -f expected.txt got.txt
    exit 1
fi

if ! diff -u expected.txt got.txt; then
    echo "cancel: wrong output"
    rm -f expected.txt got.txt
    exit 1
fi

rm -f expected.txt got.txt
echo "cancel: PASS"
exit 0
