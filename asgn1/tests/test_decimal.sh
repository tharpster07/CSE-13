#!/bin/bash
# Check output and exit status for decimal.
./calc 1.5 4 > got.txt
CAT_EXIT_CODE=$?
printf '%s\n' 'BAD INPUT' > expected.txt

if [ "$CAT_EXIT_CODE" -eq 0 ]; then
    echo "decimal: wrong exit code $CAT_EXIT_CODE"
    rm -f expected.txt got.txt
    exit 1
fi

if ! diff -u expected.txt got.txt; then
    echo "decimal: wrong output"
    rm -f expected.txt got.txt
    exit 1
fi

rm -f expected.txt got.txt
echo "decimal: PASS"
exit 0
