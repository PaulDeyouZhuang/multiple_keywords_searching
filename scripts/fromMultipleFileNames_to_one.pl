#!/usr/bin/perl
use strict;
use warnings;

#宣告變數$path_to_file，將變數設為要讀入的檔案名稱'filenames_notyped_delimit_dup_multiple.out'
my $path_to_file = 'filenames_notyped_delimit_dup_multiple.out';
#宣告變數$outputFile，將變數設為要寫入的檔案名稱'filenames_notyped_delimit_dup_single.out'
my $outputFile = 'filenames_notyped_delimit_dup_single.out';

#宣告變數$outputFile，將變數設為字串"NOTHING"
my $previous_line = 'NOTHING';

#打開檔案filenames_notyped_delimit_dup_multiple.out，一行一行地讀
open my $handle, '<', $path_to_file;
#將檔案filenames_notyped_delimit_dup_multiple.out的每一行資料除去尾端換行符號，
#並存入矩陣@lines中
chomp(my @lines = <$handle>);
#結束讀檔(從filenames_notyped_delimit_dup_multiple.out)
close $handle;

#開啟檔案filenames_notyped_delimit_dup_single.out，若無法開啟就顯示"Cound not open file 'filenames_notyped_delimit_dup_single.out'
#'>'意思是將會做寫入的動作，變數$fh為目前讀到的一行
open (my $fh, '>', $outputFile)
or die "Cound not open file '$outputFile' ";

#對於矩陣@lines中的每一個element，即（檔案filenames_notyped_delimit_dup_multiple.out中的每一行）
for (@lines)
{
#如果此element與變數$previous_line不同
if($_ ne $previous_line){
#那就將此行element寫入檔案filenames_notyped_delimit_dup_single.out中
print {$fh} "$_\n"
}

#將變數$previous_line設為變數$_（矩陣@lines目前的element）的值
$previous_line = $_;
}

#結束寫檔至filenames_notyped_delimit_dup_single.out
close $fh;

