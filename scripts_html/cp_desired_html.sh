#!/bin/bash

#利用while迴圈去讀檔案filenames_notyped_nodelimit_nodup_single.out中
#的每一行文字(見最後一行 done < "filenames_notyped_nodelimit_nodup_single.out")，
#將每次讀到的那一行儲存在$line中
while IFS='' read -r line || [[ -n "$line" ]]; do

#將變數filetype設為'.htm'
filetype='.htm'

#將變數name設為$line$filetype，也就是檔案名稱加上檔案內容
name=$line$filetype

#複製該完成的檔案(以變數$name表示)到資料夾tmp_html/
cp $name tmp_html/

done < "filenames_notyped_nodelimit_nodup_single.out"
