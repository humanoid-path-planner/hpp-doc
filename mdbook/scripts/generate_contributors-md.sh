#!/bin/bash

ORG=humanoid-path-planner

gh repo list $ORG --limit 200 --json name -q '.[].name' |
while read repo; do
    echo "Processing $repo..."

    gh api repos/$ORG/$repo/contributors --paginate \
        --jq '.[] | [.login, .contributions] | @tsv' |
    awk -v repo="$repo" '{print repo"\t"$1"\t"$2}'

done > contributors.tsv

# removes bots: 
grep -v '\[bot\]' contributors.tsv > contributors_no_bots.tsv


# sorty by name and count
awk -F'\t' '{sum[$2]+=$3} END {for (i in sum) print i "\t" sum[i]}' contributors_no_bots.tsv | sort -k2 -nr > contributors_total.tsv


echo "" >> CONTRIBUTORS.md
echo "<p align=\"center\">" >> CONTRIBUTORS.md

while IFS=$'\t' read login count
do
    echo "<a href=\"https://github.com/$login\">" >> CONTRIBUTORS.md
    echo "  <img src=\"https://github.com/$login.png\" width=\"80\" title=\"$login ($count contributions)\"/>" >> CONTRIBUTORS.md
    echo "</a>" >> CONTRIBUTORS.md
done < contributors_total.tsv

echo "</p>" >> CONTRIBUTORS.md

