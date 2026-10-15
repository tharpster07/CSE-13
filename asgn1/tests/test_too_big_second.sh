#!/bin/bash
# Check output and exit status for too_big_second.
./calc 0 513 > got.txt
CAT_EXIT_CODE=$?
printf '%s\n' 'TOO BIG' > expected.txt

if [ "$CAT_EXIT_CODE" -eq 0 ]; then
    echo "too_big_second: wrong exit code $CAT_EXIT_CODE"
    rm -f expected.txt got.txt
    exit 1
fi

if ! diff -u expected.txt got.txt; then
    echo "too_big_second: wrong output"
    rm -f expected.txt got.txt
    exit 1
fi

rm -f expected.txt got.txt
echo "too_big_second: PASS"
exit 0
