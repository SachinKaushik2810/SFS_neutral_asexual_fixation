#!/bin/bash

dir="N_500_average_data"
output_file="post_fix_N_500.txt"

# Using awk to sum up the values for the same row numbers across files
awk '
{
    sum[$1] += $2; 
    count[$1]++;
}
END {
    for (i in sum) {
        print i, sum[i] / count[i];
    }
}
' $(ls "$dir"/*.txt | sort -V) | sort -n > "$output_file"

echo "Averages written to $output_file."
