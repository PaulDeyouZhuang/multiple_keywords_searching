#!/usr/bin/perl
use strict;
use warnings;

#宣告變數$srcFile，將變數設為要讀入的檔案名稱'context_toBeStripped'
my $srcFile = 'context_toBeStripped';
#宣告變數$outputFile，將變數設為要寫入的檔案名稱'context_stripped'
my $outputFile = 'context_stripped';

#打開檔案context_toBeStripped，一行一行地讀，若無法開啟就顯示"Cound not open file 'context_toBeStripped'
#'>'意思是將會做讀入的動作，變數$fh為目前讀到的一行
open(my $fh, '<',$srcFile) 
or die "Cound not open file '$srcFile' $!";

#開啟檔案context_stripped，若無法開啟就顯示"Cound not open file 'context_stripped'
#'>'意思是將會做寫入的動作，變數$fh1為目前寫到的一行
 open (my $fh1, '>:encoding(UTF-8)', $outputFile)
	or die "Cound not open file '$outputFile' ";

#利用while迴圈去讀context_toBeStripped的每一行文字，將每次讀到的那一行儲存在變數$row中
while (my $row = <$fh>){
#將$row結尾的換行符號拿掉
chomp $row;

#如果變數$row不是"--"
if($row ne "--"){
#就將$row寫入context_stripped中
print {$fh1} "$row ";
}
#如果變數$row是"--"
else{
#就將前後皆有換行符號的$row(即"\n--\n")寫入context_stripped中
print {$fh1} "\n$row\n";
}

}
#結束context_toBeStripped的讀檔
close $fh;
#結束context_stripped的寫檔
close $fh1;
