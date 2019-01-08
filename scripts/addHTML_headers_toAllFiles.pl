#!/usr/bin/perl
use strict;
use warnings;

#將變數$path_to_file設為filenames_notyped_nodelimit_nodup_single.out
my $path_to_file = 'filenames_notyped_nodelimit_nodup_single.out';
#將變數$currentFile設為'Nothing'
my $currentFile = 'Nothing';
#將變數$outputFile設為'Nothing'
my $outputFile = 'Nothing';

#開啟檔案filenames_notyped_nodelimit_nodup_single.out，若無法開啟就顯示"Cound not open file 'filenames_notyped_nodelimit_nodup_single.out'
#'<'意思是將會做讀檔的動作，變數$handle為目前讀到的一行
open my $handle, '<', $path_to_file;
#將檔案filenames_notyped_nodelimit_nodup_single.out的每一行資料除去尾端換行符號，
#並存入矩陣@lines中
chomp(my @lines = <$handle>);
#結束讀檔(從filenames_notyped_nodelimit_nodup_single.out)
close $handle;

#對於矩陣@lines中的每一個element，即（檔案filenames_notyped_nodelimit_nodup_single.out中的每一行）
for (@lines)
{

  #將變數$currentFile設為目前讀到矩陣@lines的element加上檔案類型.txt
  #如：$currentFile為"13170730.txt";
  $currentFile = $_.".txt";

  #將outputFile設為"tmp_html/".$currentFile.".html"
  #也就是資料夾tmp_html/中的名字為$currentFile.".html"的檔案
  $outputFile="tmp_html/".$currentFile.".html";

  #開啟檔案$currentFile，若無法開啟就顯示"Cound not open file $currentFile
  #'<'意思是將會做讀檔的動作，變數$fh為目前讀到的一行
  open(my $fh, '<',$currentFile) 
  	or die "Cound not open file '$currentFile' $!";

  #開啟檔案$outputFile，若無法開啟就顯示"Cound not open file $outputFile
  #'>'意思是將會做寫檔的動作，變數$fh2為目前寫到的一行
  open (my $fh2, '>', $outputFile)
	or die "Cound not open file '$outputFile' ";

#將下方從<<'_END_HEADER_';到_END_HEADER_中間的所有內容，寫入檔案$outputFile
print $fh2 <<'_END_HEADER_';
<html>
<body>
<table border="1">
<pre>
_END_HEADER_
#利用while迴圈去讀$outputFile的每一行文字，將每次讀到的那一行儲存在變數$line中
while (my $line = <$fh>) {
    #將變數$line的值寫入$outputFile
    print $fh2 $line;
}

#將'</pre></table></body></html>'寫入$outputFile檔案的尾端
print $fh2 '</pre></table></body></html>';

#結束$outputFile的寫檔
close $fh2;
#結束$currentFile的讀檔
close $fh;
}
