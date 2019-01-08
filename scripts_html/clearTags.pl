#!/usr/bin/perl
use strict;
use warnings;

#宣告變數$srcFile，將變數設為要讀入的檔案名稱'two_columns_one_inEachSeparator1'
my $srcFile = 'two_columns_one_inEachSeparator1';
#宣告變數$outputFile ，將變數設為要寫入的檔案名稱'two_columns_one_inEachSeparator'
my $outputFile = 'two_columns_one_inEachSeparator';
#將變數$flag設為0
my $flag = 0;


#開啟檔案two_columns_one_inEachSeparator1，若無法開啟就顯示"Cound not open file 'two_columns_one_inEachSeparator1'
#'<'意思是將會做讀入的動作，變數$fh為目前讀到的一行
open(my $fh, '<',$srcFile) 
or die "Could not open file '$srcFile' $!";

#開啟檔案two_columns_one_inEachSeparator，若無法開啟就顯示"Cound not open file 'two_columns_one_inEachSeparator'
#'>'意思是將會做寫入的動作，變數$fh_output為目前讀到的一行
open(my $fh_output, '>', $outputFile)
or die "Could not open file '$outputFile' $!";

#利用while迴圈去讀two_columns_one_inEachSeparator1的每一行文字，將每次讀到的那一行儲存在$row中
while (my $row = <$fh>){
#將變數$row當中所有不是keyword前後的html的tags拿掉
$row =~ s/<[^><\n¶]*>//gs;
#將變數$row當中所有不是keyword前後的html的不完整的後半段tag拿掉(例如"xxxyyy>")
$row =~ s/\t[^\n><¶]*>/\t/gs;
#將變數$row當中所有不是keyword前後的html的不完整的前半段tag拿掉(例如"<xxxyyy")
$row =~ s/<[^\n><¶]*\n/\n/gs;

#將變數$row當中所有html註解過的tag拿掉(形式為"<!--xxxyyy-->")
if($row =~ s/[^\n]*<\!\-\-[^><]*<[^><]*>[^><]*<[^><]*>[^><]*\-\->[^\n]*\n//gs) {
#如果上述的情形發生(所有html註解過的tag拿掉)，就將變數$flag設為1
$flag = 1;
}

#如果$flag為1
if($flag==1) {
	#如果目前的$row為"--	--\n"，就將之拿掉
	if($row =~ s/\-\-\t\-\-\n//gs){
		#如果上述的情形發生，就把$flag設回0
		$flag=0;
	}
}


#將$row中所有的¶符號拿掉
$row =~ s/¶//gs;

#將目前的$row寫入檔案two_columns_one_inEachSeparator
print $fh_output $row;

}

#結束檔案two_columns_one_inEachSeparator1的讀檔
close($fh);
#結束檔案two_columns_one_inEachSeparator的寫檔
close($fh_output);

