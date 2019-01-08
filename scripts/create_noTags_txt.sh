rm -r txt_noTags/
mkdir txt_noTags
for file in *.txt; do perl -0777 -pe 's/<[^>]*>//gs' "$file" > "txt_noTags/$file"; done
cp ~/scripts/traverseEachKeywordSet.sh txt_noTags/
