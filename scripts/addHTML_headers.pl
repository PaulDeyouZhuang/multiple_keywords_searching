#!/usr/bin/perl
use strict;
use warnings;

#開啟檔案menu.html，若無法顯示就出現變數$!
#'>'意思是將會做寫入的動作，變數$HTML為目前寫到的一行
open my $HTML, '>', 'menu.html' or die $!;

#將下方從<<'_END_HEADER_';到_END_HEADER_中間的所有內容，寫入檔案menu.html
print $HTML <<'_END_HEADER_';
<html>
<body>
<table border="1">

<tr><td>CIK </td><td nowrap>Company </td><td>Date </td><td>Filing </td><td nowrap>Executive </td><td nowrap>Document </td><td>Word Count </td><td>File Size</td><td>File in Zip </td><td>Context </td></tr>


_END_HEADER_

#打開檔案pre_menu.html，一行一行地讀，變數$IN為目前讀到的一行
open my $IN, '<', 'pre_menu.html' or die $!;
#利用while迴圈去讀pre_menu.html的每一行文字，將每次讀到的那一行儲存在變數$line中
while (my $line = <$IN>) {
    #將變數$line的值寫入menu.html
    print $HTML $line;
}

#結束pre_menu.html的讀檔
close $IN;

#將'</table></body></html>'寫入menu.html檔案的尾端
print $HTML '</table></body></html>';
#結束menu.html的寫檔
close $HTML or die $!;
