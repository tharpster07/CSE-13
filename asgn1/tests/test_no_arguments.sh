#!/bin/bash
# Check output and exit status for no_arguments.
./calc > got.txt
CAT_EXIT_CODE=$?
printf '%s\n' 'NOT ENOUGH INPUT' > expected.txt

if [ "$CAT_EXIT_CODE" -eq 0 ]; then
    echo "no_arguments: wrong exit code $CAT_EXIT_CODE"
    rm -f expected.txt got.txt
    exit 1
fi

if ! diff -u expected.txt got.txt; then
    echo "no_arguments: wrong output"
    rm -f expected.txt got.txt
    exit 1
fi

rm -f expected.txt got.txt
echo "no_arguments: PASS"
exit 0
