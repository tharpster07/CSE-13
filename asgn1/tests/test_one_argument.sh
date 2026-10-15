#!/bin/bash
# Check output and exit status for one_argument.
./calc 3 > got.txt
CAT_EXIT_CODE=$?
printf '%s\n' 'NOT ENOUGH INPUT' > expected.txt

if [ "$CAT_EXIT_CODE" -eq 0 ]; then
    echo "one_argument: wrong exit code $CAT_EXIT_CODE"
    rm -f expected.txt got.txt
    exit 1
fi

if ! diff -u expected.txt got.txt; then
    echo "one_argument: wrong output"
    rm -f expected.txt got.txt
    exit 1
fi

rm -f expected.txt got.txt
echo "one_argument: PASS"
exit 0
