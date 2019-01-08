#進入資料夾home/RawFiles_html/
cd ~/RawFiles_html/

#印出"Processing your request..."
echo "Processing your request...";

#對於每一個檔案類型為.htm的檔案，如果其中有</div>不換行就接著另一個tag的前端(意即<)
#那麼就把</div>與另一個tag的前端(意即<)中間加上換行符號，
#並將結果放入home/all_html/中，檔名為原檔名
for file in *.htm; do perl -0777 -pe 's/<\/div>[^\n<>]*</<\/div>\n</gs' "$file" > "../all_html/$file"; done
