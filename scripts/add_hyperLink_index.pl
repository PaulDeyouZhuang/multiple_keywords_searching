#!/usr/bin/perl
use strict;
use warnings;

#宣告變數$srcFile，將變數設為要修改的檔案名稱'twoColumns_notHyped_delimit_multiple'
my $srcFile = 'twoColumns_notHyped_delimit_multiple';

#宣告變數$i，將變數$i設為0
my $i=0;

#宣告矩陣@arr_previous，將矩陣的第一個element設為"NOTHING1"，第二個element設為"NOTHING1"
my @arr_previous=("NOTHING1","NOTHING1");
#宣告矩陣@arr，將矩陣的第一個element設為"NOTHING0"，第二個element設為"NOTHING0"
my @arr=("NOTHING0","NOTHING0");

#開啟檔案twoColumns_notHyped_delimit_multiple，若無法開啟就顯示"Cound not open file 'twoColumns_notHyped_delimit_multiple'
#'<'意思是將會做讀檔的動作，變數$fh為目前讀到的一行
open(my $fh, '<',$srcFile) 
or die "Cound not open file '$srcFile' $!";

#利用while迴圈去讀每一行文字，將每次讀到的那一行儲存在變數$row中
while (my $row = <$fh>){
#將變數$row結尾的換行符號拿掉
chomp $row;

#將$row以tab符號做切割，前面的字串存在$arr的第一個element中，後面的字串存在$arr的第二個element中
@arr = split /\t/, $row;

#如果arr的第一個element是'--'
if($arr[0] eq '--')
{
#那麼，印出"$arr[0]\t$arr[1]\n"，也就是"--	--"
print "$arr[0]\t$arr[1]\n";
#直接回到while迴圈的頭，變數$row去讀下一行
next;
}

#如果$arr的第一個element不等於$arr_previous第一個element
if($arr[0] ne $arr_previous[0])
#那麼$i就歸零
{$i = 0;}
#如果某一組的keywords只有一個keyword
if(scalar(@ARGV) == 1){
	#那麼，對於矩陣$arr的第二個element(即$arr[1])
	#若有遇到這個keyword(即$ARGV[0])，
	#則取代成"\<a style\=\"background-color:\#FFEE00\" href\=\"".$arr[0].".txt.html\#KEY".$i++."\" target\=\"content\"\>$&\<\/a\>"
	if($arr[1] =~ s/\b($ARGV[0])/"\<a style\=\"background-color:\#FFEE00\" href\=\"".$arr[0].".txt.html\#KEY".$i++."\" target\=\"content\"\>$&\<\/a\>"/ige) {
	#若上述的情形發生，就印出"$arr[0]\t$arr[1]\n"，也就是"$arr的第一個element加上tab符號再加上$arr的第二個element
		print "$arr[0]\t$arr[1]\n";
	}
	#否則
	else{
		#就印出"$arr[0]\t$arr[1]\n"，也就是"$arr的第一個element加上tab符號再加上$arr的第二個element
		print "$arr[0]\t$arr[1]\n";
	}
}
#如果某一組的keywords有2個keywords
elsif(scalar(@ARGV) == 2){
	#那麼，對於矩陣$arr的第二個element(即$arr[1])
	#若有遇到這個其中一個keyword(即$ARGV[0]或$ARGV[1])，
	#則取代成"\<a style\=\"background-color:\#FFEE00\" href\=\"".$arr[0].".txt.html\#KEY".$i++."\" target\=\"content\"\>$&\<\/a\>"
	if($arr[1] =~ s/\b($ARGV[0])|\b($ARGV[1])/"\<a style\=\"background-color:\#FFEE00\" href\=\"".$arr[0].".txt.html\#KEY".$i++."\" target\=\"content\"\>$&\<\/a\>"/ige) {
		print "$arr[0]\t$arr[1]\n";
	}
	else{
		print "$arr[0]\t$arr[1]\n";
	}
}

#以下由上方類推...一直到如果某一組的keywords有20個keyword
elsif(scalar(@ARGV) == 3){
	if($arr[1] =~ s/\b($ARGV[0])|\b($ARGV[1])|\b($ARGV[2])/"\<a style\=\"background-color:\#FFEE00\" href\=\"".$arr[0].".txt.html\#KEY".$i++."\" target\=\"content\"\>$&\<\/a\>"/ige) {
	print "$arr[0]\t$arr[1]\n";
		}
	else{
	print "$arr[0]\t$arr[1]\n";
	}
}

elsif(scalar(@ARGV) == 4){
	if($arr[1] =~ s/\b($ARGV[0])|\b($ARGV[1])|\b($ARGV[2])|\b($ARGV[3])/"\<a style\=\"background-color:\#FFEE00\" href\=\"".$arr[0].".txt.html\#KEY".$i++."\" target\=\"content\"\>$&\<\/a\>"/ige) {
	print "$arr[0]\t$arr[1]\n";
		}
	else{
	print "$arr[0]\t$arr[1]\n";
	}
}

elsif(scalar(@ARGV) == 5){
	if($arr[1] =~ s/\b($ARGV[0])|\b($ARGV[1])|\b($ARGV[2])|\b($ARGV[3])|\b($ARGV[4])/"\<a style\=\"background-color:\#FFEE00\" href\=\"".$arr[0].".txt.html\#KEY".$i++."\" target\=\"content\"\>$&\<\/a\>"/ige) {
	print "$arr[0]\t$arr[1]\n";
		}
	else{
	print "$arr[0]\t$arr[1]\n";
	}
}

elsif(scalar(@ARGV) == 6){
	if($arr[1] =~ s/\b($ARGV[0])|\b($ARGV[1])|\b($ARGV[2])|\b($ARGV[3])|\b($ARGV[4])|\b($ARGV[5])/"\<a style\=\"background-color:\#FFEE00\" href\=\"".$arr[0].".txt.html\#KEY".$i++."\" target\=\"content\"\>$&\<\/a\>"/ige) {
	print "$arr[0]\t$arr[1]\n";
		}
	else{
	print "$arr[0]\t$arr[1]\n";
	}
}

elsif(scalar(@ARGV) == 7){
	if($arr[1] =~ s/\b($ARGV[0])|\b($ARGV[1])|\b($ARGV[2])|\b($ARGV[3])|\b($ARGV[4])|\b($ARGV[5])|\b($ARGV[6])/"\<a style\=\"background-color:\#FFEE00\" href\=\"".$arr[0].".txt.html\#KEY".$i++."\" target\=\"content\"\>$&\<\/a\>"/ige) {
	print "$arr[0]\t$arr[1]\n";
		}
	else{
	print "$arr[0]\t$arr[1]\n";
	}
}

elsif(scalar(@ARGV) == 8){
	if($arr[1] =~ s/\b($ARGV[0])|\b($ARGV[1])|\b($ARGV[2])|\b($ARGV[3])|\b($ARGV[4])|\b($ARGV[5])|\b($ARGV[6])|\b($ARGV[7])/"\<a style\=\"background-color:\#FFEE00\" href\=\"".$arr[0].".txt.html\#KEY".$i++."\" target\=\"content\"\>$&\<\/a\>"/ige) {
	print "$arr[0]\t$arr[1]\n";
		}
	else{
	print "$arr[0]\t$arr[1]\n";
	}
}

elsif(scalar(@ARGV) == 9){
	if($arr[1] =~ s/\b($ARGV[0])|\b($ARGV[1])|\b($ARGV[2])|\b($ARGV[3])|\b($ARGV[4])|\b($ARGV[5])|\b($ARGV[6])|\b($ARGV[7])|\b($ARGV[8])/"\<a style\=\"background-color:\#FFEE00\" href\=\"".$arr[0].".txt.html\#KEY".$i++."\" target\=\"content\"\>$&\<\/a\>"/ige) {
	print "$arr[0]\t$arr[1]\n";
		}
	else{
	print "$arr[0]\t$arr[1]\n";
	}
}

elsif(scalar(@ARGV) == 10){
	if($arr[1] =~ s/\b($ARGV[0])|\b($ARGV[1])|\b($ARGV[2])|\b($ARGV[3])|\b($ARGV[4])|\b($ARGV[5])|\b($ARGV[6])|\b($ARGV[7])|\b($ARGV[8])|\b($ARGV[9])/"\<a style\=\"background-color:\#FFEE00\" href\=\"".$arr[0].".txt.html\#KEY".$i++."\" target\=\"content\"\>$&\<\/a\>"/ige) {
	print "$arr[0]\t$arr[1]\n";
		}
	else{
	print "$arr[0]\t$arr[1]\n";
	}
}

elsif(scalar(@ARGV) == 11){
	if($arr[1] =~ s/\b($ARGV[0])|\b($ARGV[1])|\b($ARGV[2])|\b($ARGV[3])|\b($ARGV[4])|\b($ARGV[5])|\b($ARGV[6])|\b($ARGV[7])|\b($ARGV[8])|\b($ARGV[9])|\b($ARGV[10])/"\<a style\=\"background-color:\#FFEE00\" href\=\"".$arr[0].".txt.html\#KEY".$i++."\" target\=\"content\"\>$&\<\/a\>"/ige) {
	print "$arr[0]\t$arr[1]\n";
		}
	else{
	print "$arr[0]\t$arr[1]\n";
	}
}

elsif(scalar(@ARGV) == 12){
	if($arr[1] =~ s/\b($ARGV[0])|\b($ARGV[1])|\b($ARGV[2])|\b($ARGV[3])|\b($ARGV[4])|\b($ARGV[5])|\b($ARGV[6])|\b($ARGV[7])|\b($ARGV[8])|\b($ARGV[9])|\b($ARGV[10])|\b($ARGV[11])/"\<a style\=\"background-color:\#FFEE00\" href\=\"".$arr[0].".txt.html\#KEY".$i++."\" target\=\"content\"\>$&\<\/a\>"/ige) {
	print "$arr[0]\t$arr[1]\n";
		}
	else{
	print "$arr[0]\t$arr[1]\n";
	}
}

elsif(scalar(@ARGV) == 13){
	if($arr[1] =~ s/\b($ARGV[0])|\b($ARGV[1])|\b($ARGV[2])|\b($ARGV[3])|\b($ARGV[4])|\b($ARGV[5])|\b($ARGV[6])|\b($ARGV[7])|\b($ARGV[8])|\b($ARGV[9])|\b($ARGV[10])|\b($ARGV[11])|\b($ARGV[12])/"\<a style\=\"background-color:\#FFEE00\" href\=\"".$arr[0].".txt.html\#KEY".$i++."\" target\=\"content\"\>$&\<\/a\>"/ige) {
	print "$arr[0]\t$arr[1]\n";
		}
	else{
	print "$arr[0]\t$arr[1]\n";
	}
}

elsif(scalar(@ARGV) == 14){
	if($arr[1] =~ s/\b($ARGV[0])|\b($ARGV[1])|\b($ARGV[2])|\b($ARGV[3])|\b($ARGV[4])|\b($ARGV[5])|\b($ARGV[6])|\b($ARGV[7])|\b($ARGV[8])|\b($ARGV[9])|\b($ARGV[10])|\b($ARGV[11])|\b($ARGV[12])|\b($ARGV[13])/"\<a style\=\"background-color:\#FFEE00\" href\=\"".$arr[0].".txt.html\#KEY".$i++."\" target\=\"content\"\>$&\<\/a\>"/ige) {
	print "$arr[0]\t$arr[1]\n";
		}
	else{
	print "$arr[0]\t$arr[1]\n";
	}
}

elsif(scalar(@ARGV) == 15){
	if($arr[1] =~ s/\b($ARGV[0])|\b($ARGV[1])|\b($ARGV[2])|\b($ARGV[3])|\b($ARGV[4])|\b($ARGV[5])|\b($ARGV[6])|\b($ARGV[7])|\b($ARGV[8])|\b($ARGV[9])|\b($ARGV[10])|\b($ARGV[11])|\b($ARGV[12])|\b($ARGV[13])|\b($ARGV[14])/"\<a style\=\"background-color:\#FFEE00\" href\=\"".$arr[0].".txt.html\#KEY".$i++."\" target\=\"content\"\>$&\<\/a\>"/ige) {
	print "$arr[0]\t$arr[1]\n";
		}
	else{
	print "$arr[0]\t$arr[1]\n";
	}
}

elsif(scalar(@ARGV) == 16){
	if($arr[1] =~ s/\b($ARGV[0])|\b($ARGV[1])|\b($ARGV[2])|\b($ARGV[3])|\b($ARGV[4])|\b($ARGV[5])|\b($ARGV[6])|\b($ARGV[7])|\b($ARGV[8])|\b($ARGV[9])|\b($ARGV[10])|\b($ARGV[11])|\b($ARGV[12])|\b($ARGV[13])|\b($ARGV[14])|\b($ARGV[15])/"\<a style\=\"background-color:\#FFEE00\" href\=\"".$arr[0].".txt.html\#KEY".$i++."\" target\=\"content\"\>$&\<\/a\>"/ige) {
	print "$arr[0]\t$arr[1]\n";
		}
	else{
	print "$arr[0]\t$arr[1]\n";
	}
}

elsif(scalar(@ARGV) == 17){
	if($arr[1] =~ s/\b($ARGV[0])|\b($ARGV[1])|\b($ARGV[2])|\b($ARGV[3])|\b($ARGV[4])|\b($ARGV[5])|\b($ARGV[6])|\b($ARGV[7])|\b($ARGV[8])|\b($ARGV[9])|\b($ARGV[10])|\b($ARGV[11])|\b($ARGV[12])|\b($ARGV[13])|\b($ARGV[14])|\b($ARGV[15])|\b($ARGV[16])/"\<a style\=\"background-color:\#FFEE00\" href\=\"".$arr[0].".txt.html\#KEY".$i++."\" target\=\"content\"\>$&\<\/a\>"/ige) {
	print "$arr[0]\t$arr[1]\n";
		}
	else{
	print "$arr[0]\t$arr[1]\n";
	}
}

elsif(scalar(@ARGV) == 18){
	if($arr[1] =~ s/\b($ARGV[0])|\b($ARGV[1])|\b($ARGV[2])|\b($ARGV[3])|\b($ARGV[4])|\b($ARGV[5])|\b($ARGV[6])|\b($ARGV[7])|\b($ARGV[8])|\b($ARGV[9])|\b($ARGV[10])|\b($ARGV[11])|\b($ARGV[12])|\b($ARGV[13])|\b($ARGV[14])|\b($ARGV[15])|\b($ARGV[16])|\b($ARGV[17])/"\<a style\=\"background-color:\#FFEE00\" href\=\"".$arr[0].".txt.html\#KEY".$i++."\" target\=\"content\"\>$&\<\/a\>"/ige) {
	print "$arr[0]\t$arr[1]\n";
		}
	else{
	print "$arr[0]\t$arr[1]\n";
	}
}

elsif(scalar(@ARGV) == 19){
	if($arr[1] =~ s/\b($ARGV[0])|\b($ARGV[1])|\b($ARGV[2])|\b($ARGV[3])|\b($ARGV[4])|\b($ARGV[5])|\b($ARGV[6])|\b($ARGV[7])|\b($ARGV[8])|\b($ARGV[9])|\b($ARGV[10])|\b($ARGV[11])|\b($ARGV[12])|\b($ARGV[13])|\b($ARGV[14])|\b($ARGV[15])|\b($ARGV[16])|\b($ARGV[17])|\b($ARGV[18])/"\<a style\=\"background-color:\#FFEE00\" href\=\"".$arr[0].".txt.html\#KEY".$i++."\" target\=\"content\"\>$&\<\/a\>"/ige) {
	print "$arr[0]\t$arr[1]\n";
		}
	else{
	print "$arr[0]\t$arr[1]\n";
	}
}

#如果某一組的keywords有20個keyword
elsif(scalar(@ARGV) == 20){
	if($arr[1] =~ s/\b($ARGV[0])|\b($ARGV[1])|\b($ARGV[2])|\b($ARGV[3])|\b($ARGV[4])|\b($ARGV[5])|\b($ARGV[6])|\b($ARGV[7])|\b($ARGV[8])|\b($ARGV[9])|\b($ARGV[10])|\b($ARGV[11])|\b($ARGV[12])|\b($ARGV[13])|\b($ARGV[14])|\b($ARGV[15])|\b($ARGV[16])|\b($ARGV[17])|\b($ARGV[18])|\b($ARGV[19])/"\<a style\=\"background-color:\#FFEE00\" href\=\"".$arr[0].".txt.html\#KEY".$i++."\" target\=\"content\"\>$&\<\/a\>"/ige) {
	print "$arr[0]\t$arr[1]\n";
		}
	else{
	print "$arr[0]\t$arr[1]\n";
	}
}



#將變數@arr_previous設為@arr
@arr_previous=@arr;
}

