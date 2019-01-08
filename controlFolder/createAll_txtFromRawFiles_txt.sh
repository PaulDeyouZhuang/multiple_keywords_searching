#進入資料夾home/RawFiles_html/
cd ~/RawFiles_txt/

#印出"Processing your request..."
echo "Processing your request..."

#對於每一個檔案類型為.txt的檔案，如果其中有html的tag(意即<OOXX>)，就將tag拿掉
#並將結果放入home/all_txt/中，檔名為原檔名
for file in *.txt; do perl -0777 -pe 's/<[^>]*>//gs' "$file" > "../all_txt/$file"; done
