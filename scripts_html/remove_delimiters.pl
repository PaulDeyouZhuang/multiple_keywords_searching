#!/usr/bin/perl
use strict;
use warnings;

#宣告變數$path_to_file，將變數設為要讀入的檔案名稱'two_columns_one_inEachSeparator'
my $path_to_file = 'two_columns_one_inEachSeparator';
#宣告變數$outputFile，將變數設為要讀入的檔案名稱'two_columns_no_separator'
my $outputFile = 'two_columns_no_separator';

#開啟檔案two_columns_one_inEachSeparator，若無法開啟就顯示"Cound not open file 'two_columns_one_inEachSeparator'
#'<'意思是將會做讀入的動作，變數$handle為目前讀到的一行
open my $handle, '<', $path_to_file;
#將檔案two_columns_one_inEachSeparator的每一行資料除去尾端換行符號，
#並存入矩陣@lines中
chomp(my @lines = <$handle>);
#結束讀檔(從two_columns_one_inEachSeparator)
close $handle;

#開啟檔案two_columns_no_separator，若無法開啟就顯示"Cound not open file 'two_columns_no_separator'
#'>'意思是將會做寫入的動作，變數$fh為目前寫到的一行
  open (my $fh, '>', $outputFile)
	or die "Cound not open file '$outputFile' ";

#對於矩陣@lines中的每一個element，即（檔案two_columns_no_separator中的每一行）
for (@lines)
{
  #如果此element不等於"--\t--"
  if($_ ne "--\t--"){
  #那就將此行element寫入檔案two_columns_no_separator中
  print {$fh} "$_\n"
  }
}
#結束寫檔至two_columns_no_separator
close $fh;
