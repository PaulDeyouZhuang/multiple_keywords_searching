#!/bin/bash

#建一個資料夾，資料夾名字叫做tmp_html
mkdir tmp_html

#將資料夾home/secControl/內的檔案listOfKeywords_txt.xlsx複製到目前資料夾位置
cp ~/controlFolder/listOfKeywords_txt.xlsx .

#讀listOfKeywords_html.xlsx檔案內的每一行 (每一行為一組keywords) (見最後一行done < "listOfKeywords_html.xlsx")
while IFS='' read -r line || [[ -n "$line" ]]; do

#把目前讀到的一行keywords存到變數$str內
str=$line


#一些變數的宣告
string_forIndex=""
string_forGrep=""
str_folderName=""
str_folderName_tmp=""
arrOfIndex=()
initial=""
Oftxt="_txt_"
Ofhtml="_html_"
DATE=`date '+%Y-%m-%d %H:%M:%S'`

#用tab符號來區隔每一組keywords中的每個keyword，儲存到矩陣arr中
IFS=$'\t' arr=($str)

#對於每個在矩陣中的keyword
for x in "${arr[@]}"
#for迴圈的起始
do

#如果它的第一個字母是數字
if [[ ${x:0:1} =~ [0-9] ]];
#那麼
then

#那就把這個keyword存到變數$initial當中
initial=$x

#否則
else	
	#就把這個keyword存到矩陣arrOfIndex中
	arrOfIndex+=($x)

	#如果目前變數$string_forGrep還是空的
	if [[ ${string_forGrep} == "" ]];
	#那麼	
	then
		#把變數$string_forGrep設為此keyword加上\w*\b
		#\w*\b是為了之後的搜索，只搜索一個單字(單字後端可以加任何a-z的字母，
		#遇到非a-z的字母就停止)	
		string_forGrep="$x\w*\b"

		#變數str_folderName_tmp設為". "+"keyword的第一個單字為"+"_txt_"(這是為了命名資料夾)
		str_folderName_tmp=". $x$Oftxt"

	#否則
	else
	   	#就將這個keyword串接到變數$string_forGrep的尾端
		string_forGrep="$string_forGrep\|$x\w*\b"
	#結束if
	fi
#結束if
fi

#結束for迴圈
done

#變數$str_folderName（資料夾名稱）為變數$initial加上變數$str_folderName加上變數$DATE(即刻日期與時間)
#例如5. Period_txt_2018-01-24-11:21:43
str_folderName="$initial$str_folderName_tmp$DATE"

#將變數$str_folderName(資料夾名稱)顯示在terminal(黑視窗)上（執行過程中的黑視窗）
echo "$str_folderName"

#建一個資料夾，資料夾名字叫做變數$str_folderName
mkdir $str_folderName
#進入資料夾$str_folderName/
cd $str_folderName/

#建一個資料夾，資料夾名字為html
mkdir html 
#進入資料夾html/
cd html/
#建一個資料夾，資料夾名字為html_files_indexed
mkdir html_files_indexed 
#回到上上層資料夾(all_txt/)
cd ../..

#在資料夾(all_txt)中，針對所有的.txt檔，去搜索符合目前一組keywords的字附近的3行前後文
#將搜索的結果(含檔案原始名稱)放到資料夾$str_folderName內的檔案grep_f_c.out
grep -i -w -C 1 "$string_forGrep" *.txt > $str_folderName/grep_f_c.out
#將資料夾$str_folderName內的檔案grep_f_c.out由windows的dos換行格式轉換為unix系統的換行格式
dos2unix  $str_folderName/grep_f_c.out
#把grep_f_c.out內的第一欄檔名的.txt拿掉，產生新的檔案filenames_notyped_delimit_dup_multiple.out
awk -F '.txt' '{print $1}' $str_folderName/grep_f_c.out > $str_folderName/filenames_notyped_delimit_dup_multiple.out
#在資料夾(all_txt)中，針對所有的.txt檔，去搜索符合目前一組keywords的字附近的3行前後文
#將搜索的結果(不含檔案原始名稱)放到資料夾$str_folderName內的檔案context_delimit_multiple.out
grep -i -w -h -C 1 "$string_forGrep" *.txt > $str_folderName/context_delimit_multiple.out 
#將資料夾$str_folderName內的檔案context_delimit_multiple.out由windows的dos換行格式轉換為unix系統的換行格式
dos2unix  $str_folderName/context_delimit_multiple.out

#進入資料夾$str_folderName/
cd $str_folderName

#將搜索到的關鍵字檔案名稱filenames_notyped_delimit_dup_multiple.out(一欄) 和
#搜索到的關鍵字前後文context_delimit_multiple.out(另一欄)，
#兩欄貼到新的檔案twoColumns_notHyped_delimit_multiple，兩欄以tab相隔 
paste -d '\t' filenames_notyped_delimit_dup_multiple.out context_delimit_multiple.out > twoColumns_notHyped_delimit_multiple

#將資料夾home/scripts/內的檔案add_hyperLink_index.pl複製至此資料夾
cp ~/scripts/add_hyperLink_index.pl .

#執行檔案add_hyperLink_index.pl，並將結果放到新檔案twoColumns_Hyped_delimit_multiple中
#檔案add_hyperLink_index.pl的目的是為了
#要將檔案twoColumns_notHyped_delimit_multiple所有的關鍵字加上hyperLink的編號
#詳細過程請參閱資料夾home/scripts/內的檔案add_hyperLink_index.pl
./add_hyperLink_index.pl "${arrOfIndex[@]}" > twoColumns_Hyped_delimit_multiple

#將資料夾home/scripts/內的檔案fromMultipleFileNames_to_one.pl複製至此資料夾
cp ~/scripts/fromMultipleFileNames_to_one.pl .
#執行檔案fromMultipleFileNames_to_one.pl
#檔案fromMultipleFileNames_to_one.pl的目的是為了
#要將檔案filenames_notyped_delimit_dup_multiple.out每一區塊的多個檔案名稱
#減至只剩一個檔案名稱，並放到新的檔案filenames_notyped_delimit_dup_single.out中
#詳細過程請參閱資料夾home/scripts/內的檔案fromMultipleFileNames_to_one.pl
./fromMultipleFileNames_to_one.pl
#將檔案twoColumns_Hyped_delimit_multiple的第二個欄位(關鍵字的前後文)取出，放到檔案context_toBeStripped中
awk -F '\t' '{print $2}' twoColumns_Hyped_delimit_multiple > context_toBeStripped

#將資料夾home/scripts/內的檔案stripOffNewLine.pl複製至此資料夾
cp ~/scripts/stripOffNewLine.pl .
#執行檔案stripOffNewLine.pl
#檔案stripOffNewLine.pl的目的是為了
#要將檔案context_toBeStripped每一區塊的多行前後文字
#化為只剩一行，並放到新的檔案context_stripped中
#詳細過程請參閱資料夾home/scripts/內的檔案stripOffNewLine.pl
./stripOffNewLine.pl

#將檔案filenames_notyped_delimit_dup_single.out(一欄) 和
#檔案context_stripped(另一欄)，
#貼到新的檔案two_columns_one_inEachSeparator1，兩欄以tab相隔
paste -d '\t' filenames_notyped_delimit_dup_single.out context_stripped > two_columns_one_inEachSeparator

#將資料夾home/scripts/內的檔案remove_delimiters.pl複製至此資料夾
cp ~/scripts/remove_delimiters.pl .
#執行檔案remove_delimiters.pl
#檔案remove_delimiters.pl的目的是為了
#要將檔案two_columns_one_inEachSeparator內，分隔區塊的符號--	--去除，
#去除的結果放到新的檔案two_columns_no_separator中
#詳細過程請參閱資料夾home/scripts/內的檔案remove_delimiters.pl
./remove_delimiters.pl

#將檔案two_columns_no_separator的第一個欄位(檔名)取出，檔名後方加上檔案類型(.txt)後，
#放到檔案filenames_toBeAppended中
awk -F '\t' '{print $1".txt"}' two_columns_no_separator > filenames_toBeAppended

#將資料夾home/scripts/內的檔案SECinfo_Index_File_no_duplicate_withWC.csv複製至此資料夾
cp ~/scripts/SECinfo_Index_File_no_duplicate_withWC.csv .
#將資料夾home/scripts/內的檔案append.sh複製至此資料夾
cp ~/scripts/append.sh .
#執行檔案append.sh
#檔案append.sh的目的是為了依照filenames_toBeAppended，
#利用SECinfo_Index_File_no_duplicate_withWC.csv，加上所有檔案的詳細資料，
#出來的結果放到新的檔案all_fitted_rows.out中
#詳細過程請參閱資料夾home/scripts/內的檔案append.sh
./append.sh < filenames_toBeAppended > all_fitted_rows.out
#將資料夾$str_folderName內的檔案all_fitted_rows.out由windows的dos換行格式轉換為unix系統的換行格式
dos2unix all_fitted_rows.out

#將每個含有關鍵字檔名的詳細資料all_fitted_rows.out(一欄) 和
#和搜索到並處理過的關鍵字檔名及前後文two_columns_no_separator(另兩欄)，
#貼到新的檔案pre_menu，三欄各以tab相隔
paste -d '\t' all_fitted_rows.out  two_columns_no_separator > pre_menu

#將pre_menu加上html的tags（為了建立一個table），並去掉重複欄位(第十欄)
#出來的結果放到新的檔案pre_menu.html
#語法解釋：
#-F"\t"的意思是用tab符號為每一column的區別
#在column1的每一列前加上"<tr><td>"，在column2的每一列前加上"</td><td nowrap>"，以此類推
awk -F"\t" '{print "<tr><td>"$1, "</td><td nowrap>"$2, "</td><td>"$3, "</td><td>"$4, "</td><td nowrap>"$5, "</td><td nowrap>"$6, "</td><td>"$7, "</td><td>"$8,"</td><td>"$9,"</td><td>"$11"</td></tr>"}' pre_menu > pre_menu.html

#將資料夾home/scripts/內的檔案addHTML_headers.pl複製至此資料夾
cp ~/scripts/addHTML_headers.pl .
#執行檔案addHTML_headers.pl
#檔案addHTML_headers.pl的目的是加html的headers到pre_menu.html中，
#出來的結果放到新的檔案menu.html
#詳細過程請參閱資料夾home/scripts/內的檔案addHTML_headers.pl
./addHTML_headers.pl


#以下是為了在原始檔案加上超連結:

#將檔案filenames_notyped_delimit_dup_multiple.out中所有重複的列，只保留一個
#出來的結果放到新的檔案filenames_notyped_nodelimit_nodup_single.out
awk '!seen[$0]++' filenames_notyped_delimit_dup_multiple.out > filenames_notyped_nodelimit_nodup_single.out
#拿掉filenames_notyped_nodelimit_nodup_single.out中多的一個列"--"
sed -i ':a;N;$!ba; s/\n--//g' filenames_notyped_nodelimit_nodup_single.out

#將此資料夾內的檔案filenames_notyped_nodelimit_nodup_single.out複製至資料夾html/中
cp filenames_notyped_nodelimit_nodup_single.out html/
#將此資料夾內的檔案filenames_notyped_nodelimit_nodup_single.out複製至上一層資料夾中
cp filenames_notyped_nodelimit_nodup_single.out ..
#回到上一層資料夾
cd ..

#將資料夾home/scripts/內的檔案addHTML_headers_toAllFiles.pl複製至此資料夾
cp ~/scripts/addHTML_headers_toAllFiles.pl .
#執行檔案addHTML_headers_toAllFiles.pl
#檔案addHTML_headers_toAllFiles.pl的目的是為了將檔案filenames_notyped_nodelimit_nodup_single.out中，
#有出現過的檔名的檔案，將檔案加入html的開頭與結尾的tags
#詳細過程請參閱資料夾home/scripts/內的檔案addHTML_headers_toAllFiles.pl
./addHTML_headers_toAllFiles.pl

#將資料夾tmp_html/內的所有檔案複製至資料夾$str_folderName/html/
cp -r tmp_html/* $str_folderName/html/
#清空資料夾tmp_html/內的所有檔案
rm -r tmp_html/*
#進入資料夾$str_folderName/html/
cd $str_folderName/html/


#將資料夾home/scripts/內的檔案add_keyIndexToAllFiles.pl複製至此資料夾
cp ~/scripts/add_keyIndexToAllFiles.pl .
#執行檔案add_keyIndexToAllFiles.pl
#檔案add_keyIndexToAllFiles.pl的目的是為檔案中filenames_notyped_nodelimit_nodup_single.out中，
#有出現過的檔名，針對其檔案內關鍵字加上超連結
#詳細過程請參閱資料夾home/scripts/內的檔案add_keyIndexToAllFiles.pl
./add_keyIndexToAllFiles.pl "${arrOfIndex[@]}"
#回到上一層資料夾
cd ..

#將此資料夾內的檔案menu.html複製至此資料夾html/html_files_indexed中
cp menu.html html/html_files_indexed
#將資料夾home/scripts/內的檔案index.html複製至此資料夾html/html_files_indexed中
cp ~/scripts/index.html html/html_files_indexed
#將資料夾html/html_files_indexed/的名稱改為html/$str_folderName/
mv html/html_files_indexed/ html/$str_folderName/
#進入資料夾html
cd html/
#將資料夾$str_folderName/包成一個zip檔，檔名為$str_folderName.zip
zip -r $str_folderName.zip $str_folderName/
#將檔案$str_folderName.zip移動到資料夾home/resultFolder/中
mv $str_folderName.zip ~/resultFolder/
#回到上上層資料夾
cd ../../

#將以下的變數歸為空字串
string_forIndex=""
string_forGrep=""
str_folderName=""
y=""
#將以下的陣列歸為空陣列
arrOfIndex=()

#結束while迴圈
done < "listOfKeywords_txt.xlsx"
