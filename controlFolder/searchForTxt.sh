#!/bin/bash

#複製資料夾home/scripts/內的檔案traverseEachKeywordSet.sh到資料夾home/all_txt/中
cp ~/scripts/traverseEachKeywordSet.sh ~/all_txt/

#進入資料夾home/all_txt/中
cd ~/all_txt/

#執行檔案traverseEachKeywordSet.sh
./traverseEachKeywordSet.sh

#回到上一層(即home)
cd ..

