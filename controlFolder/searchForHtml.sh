#!/bin/bash

#複製資料夾home/scripts_html/內的檔案traverseEachKeywordSet.sh到資料夾home/all_html/中
cp ~/scripts_html/traverseEachKeywordSet.sh ~/all_html/

#進入資料夾home/all_html/中
cd ~/all_html/

#執行檔案traverseEachKeywordSet.sh
./traverseEachKeywordSet.sh

#回到上一層(即home)
cd ..

