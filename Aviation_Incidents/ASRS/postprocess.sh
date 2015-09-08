#! /bin/bash

# This script combines csv files from ASRS database into a single csv file.

final='combined.csv'
tmp='tmp.csv'

# Since each ASRS database csv file has its own headers, we remove those lines.
# And save the intermediate file as 'c.csv' -- we'll remove it later. 
echo "Combining files, remove headers..."
cat ASRS*.csv | sort | sed '/^$/d' | sed '/Time,Time/d' | sed '/ACN,Date/d' 1>$tmp
# Add the header back, and remove the intermediate file.
echo "Adding headers back..."
cat headers.csv $tmp 1>$final
echo "Removing temporary file $tmp..."
rm $tmp
echo "Done. Combined file name: $final."
echo
