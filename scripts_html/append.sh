#!/bin/bash

#利用while迴圈去讀每一行文字，將每次讀到的那一行儲存在$LINE中
while IFS= read -r LINE || [[ -n "$LINE" ]];

do
#若在檔案SECinfo_Index_File_no_duplicate_withWC.csv中某一列的某一個欄位含有$LINE，
#那麼就取得此一列的所有資料
awk -v pattern="$LINE" '$0 ~ pattern' "fileDetails.csv"

done
