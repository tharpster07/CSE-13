#!/bin/bash
# Check output and exit status for letters_second.
./calc 4 xyz > got.txt
CAT_EXIT_CODE=$?
printf '%s\n' 'BAD INPUT' > expected.txt

if [ "$CAT_EXIT_CODE" -eq 0 ]; then
    echo "letters_second: wrong exit code $CAT_EXIT_CODE"
    rm -f expected.txt got.txt
    exit 1
fi

if ! diff -u expected.txt got.txt; then
    echo "letters_second: wrong output"
    rm -f expected.txt got.txt
    exit 1
fi

rm -f expected.txt got.txt
echo "letters_second: PASS"
exit 0
