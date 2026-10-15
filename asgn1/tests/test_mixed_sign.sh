#!/bin/bash
# Check output and exit status for mixed_sign.
./calc +-3 4 > got.txt
CAT_EXIT_CODE=$?
printf '%s\n' 'BAD INPUT' > expected.txt

if [ "$CAT_EXIT_CODE" -eq 0 ]; then
    echo "mixed_sign: wrong exit code $CAT_EXIT_CODE"
    rm -f expected.txt got.txt
    exit 1
fi

if ! diff -u expected.txt got.txt; then
    echo "mixed_sign: wrong output"
    rm -f expected.txt got.txt
    exit 1
fi

rm -f expected.txt got.txt
echo "mixed_sign: PASS"
exit 0
