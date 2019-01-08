#!/usr/bin/perl
use strict;
use warnings;

#宣告變數$path_to_file，將變數設為要修改的檔案名稱'filenames_notyped_nodelimit_nodup_single.out'
my $path_to_file = 'filenames_notyped_nodelimit_nodup_single.out';

#宣告變數$currentFile，將變數設為'Nothing'
my $currentFile = 'Nothing';
#宣告變數$outputFile，將變數設為'Nothing'
my $outputFile = 'Nothing';

#宣告變數$i，將變數設為0
my $i=0;


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
  #將變數$i設為0
  $i=0;


  #將變數$currentFile設為目前讀到矩陣@lines的element加上檔案類型.txt.html
  #如：$currentFile為"13170730.txt.html";
  $currentFile = $_.".txt.html";

  #將outputFile設為"html_files_indexed/".$currentFile
  #也就是資料夾html_files_indexed/中的名字為$currentFile的檔案
  $outputFile="html_files_indexed/".$currentFile;

  #開啟檔案$currentFile，若無法開啟就顯示"Cound not open file $currentFile
  #'<'意思是將會做讀入的動作，變數$fh為目前讀到的一行  
  open(my $fh, '<',$currentFile) 
  	or die "Cound not open file '$currentFile' $!";

  #開啟檔案$outputFile，若無法開啟就顯示"Cound not open file $outputFile
  #'>'意思是將會做寫入的動作，變數$fh2為目前寫到的一行
  open (my $fh2, '>', $outputFile)
	or die "Cound not open file '$outputFile' ";

#利用while迴圈去讀$currentFile中的每一行文字，將每次讀到的那一行儲存在$row中
while (my $row = <$fh>){
#將變數$row結尾的換行符號拿掉
chomp $row;

#如果某一組的keywords只有一個keyword
if(scalar(@ARGV) == 1){
	#那麼，對於變數$row
	#若有遇到這個keyword(即$ARGV[0])，
	#則取代成"\<A style\=\"white-space: nowrap\; background-color: \#FFEE00\;\" NAME\=\"KEY".$i++."\"\>$&\<\/A\>"
	if($row =~ s/\b($ARGV[0])/"\<A style\=\"white-space: nowrap\; background-color: \#FFEE00\;\" NAME\=\"KEY".$i++."\"\>$&\<\/A\>"/ige) 		{
		#若上述的情形發生，就將$row\n寫入$outputFile
		print {$fh2} "$row\n";
	}
	#否則
	else{
	#就將$row\n寫入$outputFile
	print {$fh2} "$row\n";
	}
}

#如果某一組的keywords有2個keyword
elsif(scalar(@ARGV) == 2){
	#那麼，對於變數$row
	#若有遇到這個其中一個keyword(即$ARGV[0]或$ARGV[1])，
	#則取代成"\<A style\=\"white-space: nowrap\; background-color: \#FFEE00\;\" NAME\=\"KEY".$i++."\"\>$&\<\/A\>"	
	if($row =~ s/\b($ARGV[0])|\b($ARGV[1])/"\<A style\=\"white-space: nowrap\; background-color: \#FFEE00\;\" NAME\=\"KEY".$i++."\"\>$&\<\/A\>"/ige) 		{
		#若上述的情形發生，就將$row\n寫入$outputFile
		print {$fh2} "$row\n";
	}
	#否則
	else{
	#就將$row\n寫入$outputFile
	print {$fh2} "$row\n";
	}
}

#以下由上方類推...一直到如果某一組的keywords有20個keyword
elsif(scalar(@ARGV) == 3){
	if($row =~ s/\b($ARGV[0])|\b($ARGV[1])|\b($ARGV[2])/"\<A style\=\"white-space: nowrap\; background-color: \#FFEE00\;\" NAME\=\"KEY".$i++."\"\>$&\<\/A\>"/ige) 		{

		print {$fh2} "$row\n";
			}
	else{
	print {$fh2} "$row\n";
	}
}

elsif(scalar(@ARGV) == 4){
	if($row =~ s/\b($ARGV[0])|\b($ARGV[1])|\b($ARGV[2])|\b($ARGV[3])/"\<A style\=\"white-space: nowrap\; background-color: \#FFEE00\;\" NAME\=\"KEY".$i++."\"\>$&\<\/A\>"/ige) 		{

		print {$fh2} "$row\n";
			}
	else{
	print {$fh2} "$row\n";
	}
}

elsif(scalar(@ARGV) == 5){
	if($row =~ s/\b($ARGV[0])|\b($ARGV[1])|\b($ARGV[2])|\b($ARGV[3])|\b($ARGV[4])/"\<A style\=\"white-space: nowrap\; background-color: \#FFEE00\;\" NAME\=\"KEY".$i++."\"\>$&\<\/A\>"/ige) 		{

		print {$fh2} "$row\n";
			}
	else{
	print {$fh2} "$row\n";
	}
}

elsif(scalar(@ARGV) == 6){
	if($row =~ s/\b($ARGV[0])|\b($ARGV[1])|\b($ARGV[2])|\b($ARGV[3])|\b($ARGV[4])|\b($ARGV[5])/"\<A style\=\"white-space: nowrap\; background-color: \#FFEE00\;\" NAME\=\"KEY".$i++."\"\>$&\<\/A\>"/ige) 		{

		print {$fh2} "$row\n";
			}
	else{
	print {$fh2} "$row\n";
	}
}

elsif(scalar(@ARGV) == 7){
	if($row =~ s/\b($ARGV[0])|\b($ARGV[1])|\b($ARGV[2])|\b($ARGV[3])|\b($ARGV[4])|\b($ARGV[5])|\b($ARGV[6])/"\<A style\=\"white-space: nowrap\; background-color: \#FFEE00\;\" NAME\=\"KEY".$i++."\"\>$&\<\/A\>"/ige) 		{

		print {$fh2} "$row\n";
			}
	else{
	print {$fh2} "$row\n";
	}
}

elsif(scalar(@ARGV) == 8){
	if($row =~ s/\b($ARGV[0])|\b($ARGV[1])|\b($ARGV[2])|\b($ARGV[3])|\b($ARGV[4])|\b($ARGV[5])|\b($ARGV[6])|\b($ARGV[7])/"\<A style\=\"white-space: nowrap\; background-color: \#FFEE00\;\" NAME\=\"KEY".$i++."\"\>$&\<\/A\>"/ige) 		{

		print {$fh2} "$row\n";
			}
	else{
	print {$fh2} "$row\n";
	}
}

elsif(scalar(@ARGV) == 9){
	if($row =~ s/\b($ARGV[0])|\b($ARGV[1])|\b($ARGV[2])|\b($ARGV[3])|\b($ARGV[4])|\b($ARGV[5])|\b($ARGV[6])|\b($ARGV[7])|\b($ARGV[8])/"\<A style\=\"white-space: nowrap\; background-color: \#FFEE00\;\" NAME\=\"KEY".$i++."\"\>$&\<\/A\>"/ige) 		{

		print {$fh2} "$row\n";
			}
	else{
	print {$fh2} "$row\n";
	}
}

elsif(scalar(@ARGV) == 10){
	if($row =~ s/\b($ARGV[0])|\b($ARGV[1])|\b($ARGV[2])|\b($ARGV[3])|\b($ARGV[4])|\b($ARGV[5])|\b($ARGV[6])|\b($ARGV[7])|\b($ARGV[8])|\b($ARGV[9])/"\<A style\=\"white-space: nowrap\; background-color: \#FFEE00\;\" NAME\=\"KEY".$i++."\"\>$&\<\/A\>"/ige) 		{

		print {$fh2} "$row\n";
			}
	else{
	print {$fh2} "$row\n";
	}
}

elsif(scalar(@ARGV) == 11){
	if($row =~ s/\b($ARGV[0])|\b($ARGV[1])|\b($ARGV[2])|\b($ARGV[3])|\b($ARGV[4])|\b($ARGV[5])|\b($ARGV[6])|\b($ARGV[7])|\b($ARGV[8])|\b($ARGV[9])|\b($ARGV[10])/"\<A style\=\"white-space: nowrap\; background-color: \#FFEE00\;\" NAME\=\"KEY".$i++."\"\>$&\<\/A\>"/ige) 		{

		print {$fh2} "$row\n";
			}
	else{
	print {$fh2} "$row\n";
	}
}

elsif(scalar(@ARGV) == 12){
	if($row =~ s/\b($ARGV[0])|\b($ARGV[1])|\b($ARGV[2])|\b($ARGV[3])|\b($ARGV[4])|\b($ARGV[5])|\b($ARGV[6])|\b($ARGV[7])|\b($ARGV[8])|\b($ARGV[9])|\b($ARGV[10])|\b($ARGV[11])/"\<A style\=\"white-space: nowrap\; background-color: \#FFEE00\;\" NAME\=\"KEY".$i++."\"\>$&\<\/A\>"/ige) 		{

		print {$fh2} "$row\n";
			}
	else{
	print {$fh2} "$row\n";
	}
}

elsif(scalar(@ARGV) == 13){
	if($row =~ s/\b($ARGV[0])|\b($ARGV[1])|\b($ARGV[2])|\b($ARGV[3])|\b($ARGV[4])|\b($ARGV[5])|\b($ARGV[6])|\b($ARGV[7])|\b($ARGV[8])|\b($ARGV[9])|\b($ARGV[10])|\b($ARGV[11])|\b($ARGV[12])/"\<A style\=\"white-space: nowrap\; background-color: \#FFEE00\;\" NAME\=\"KEY".$i++."\"\>$&\<\/A\>"/ige) 		{

		print {$fh2} "$row\n";
			}
	else{
	print {$fh2} "$row\n";
	}
}

elsif(scalar(@ARGV) == 14){
	if($row =~ s/\b($ARGV[0])|\b($ARGV[1])|\b($ARGV[2])|\b($ARGV[3])|\b($ARGV[4])|\b($ARGV[5])|\b($ARGV[6])|\b($ARGV[7])|\b($ARGV[8])|\b($ARGV[9])|\b($ARGV[10])|\b($ARGV[11])|\b($ARGV[12])|\b($ARGV[13])/"\<A style\=\"white-space: nowrap\; background-color: \#FFEE00\;\" NAME\=\"KEY".$i++."\"\>$&\<\/A\>"/ige) 		{

		print {$fh2} "$row\n";
			}
	else{
	print {$fh2} "$row\n";
	}
}

elsif(scalar(@ARGV) == 15){
	if($row =~ s/\b($ARGV[0])|\b($ARGV[1])|\b($ARGV[2])|\b($ARGV[3])|\b($ARGV[4])|\b($ARGV[5])|\b($ARGV[6])|\b($ARGV[7])|\b($ARGV[8])|\b($ARGV[9])|\b($ARGV[10])|\b($ARGV[11])|\b($ARGV[12])|\b($ARGV[13])|\b($ARGV[14])/"\<A style\=\"white-space: nowrap\; background-color: \#FFEE00\;\" NAME\=\"KEY".$i++."\"\>$&\<\/A\>"/ige) 		{

		print {$fh2} "$row\n";
			}
	else{
	print {$fh2} "$row\n";
	}
}

elsif(scalar(@ARGV) == 16){
	if($row =~ s/\b($ARGV[0])|\b($ARGV[1])|\b($ARGV[2])|\b($ARGV[3])|\b($ARGV[4])|\b($ARGV[5])|\b($ARGV[6])|\b($ARGV[7])|\b($ARGV[8])|\b($ARGV[9])|\b($ARGV[10])|\b($ARGV[11])|\b($ARGV[12])|\b($ARGV[13])|\b($ARGV[14])|\b($ARGV[15])/"\<A style\=\"white-space: nowrap\; background-color: \#FFEE00\;\" NAME\=\"KEY".$i++."\"\>$&\<\/A\>"/ige) 		{

		print {$fh2} "$row\n";
			}
	else{
	print {$fh2} "$row\n";
	}
}

elsif(scalar(@ARGV) == 17){
	if($row =~ s/\b($ARGV[0])|\b($ARGV[1])|\b($ARGV[2])|\b($ARGV[3])|\b($ARGV[4])|\b($ARGV[5])|\b($ARGV[6])|\b($ARGV[7])|\b($ARGV[8])|\b($ARGV[9])|\b($ARGV[10])|\b($ARGV[11])|\b($ARGV[12])|\b($ARGV[13])|\b($ARGV[14])|\b($ARGV[15])|\b($ARGV[16])/"\<A style\=\"white-space: nowrap\; background-color: \#FFEE00\;\" NAME\=\"KEY".$i++."\"\>$&\<\/A\>"/ige) 		{

		print {$fh2} "$row\n";
			}
	else{
	print {$fh2} "$row\n";
	}
}

elsif(scalar(@ARGV) == 18){
	if($row =~ s/\b($ARGV[0])|\b($ARGV[1])|\b($ARGV[2])|\b($ARGV[3])|\b($ARGV[4])|\b($ARGV[5])|\b($ARGV[6])|\b($ARGV[7])|\b($ARGV[8])|\b($ARGV[9])|\b($ARGV[10])|\b($ARGV[11])|\b($ARGV[12])|\b($ARGV[13])|\b($ARGV[14])|\b($ARGV[15])|\b($ARGV[16])|\b($ARGV[17])/"\<A style\=\"white-space: nowrap\; background-color: \#FFEE00\;\" NAME\=\"KEY".$i++."\"\>$&\<\/A\>"/ige) 		{

		print {$fh2} "$row\n";
			}
	else{
	print {$fh2} "$row\n";
	}
}

elsif(scalar(@ARGV) == 19){
	if($row =~ s/\b($ARGV[0])|\b($ARGV[1])|\b($ARGV[2])|\b($ARGV[3])|\b($ARGV[4])|\b($ARGV[5])|\b($ARGV[6])|\b($ARGV[7])|\b($ARGV[8])|\b($ARGV[9])|\b($ARGV[10])|\b($ARGV[11])|\b($ARGV[12])|\b($ARGV[13])|\b($ARGV[14])|\b($ARGV[15])|\b($ARGV[16])|\b($ARGV[17])|\b($ARGV[18])/"\<A style\=\"white-space: nowrap\; background-color: \#FFEE00\;\" NAME\=\"KEY".$i++."\"\>$&\<\/A\>"/ige) 		{

		print {$fh2} "$row\n";
			}
	else{
	print {$fh2} "$row\n";
	}
}

#如果某一組的keywords有20個keyword
elsif(scalar(@ARGV) == 20){
	if($row =~ s/\b($ARGV[0])|\b($ARGV[1])|\b($ARGV[2])|\b($ARGV[3])|\b($ARGV[4])|\b($ARGV[5])|\b($ARGV[6])|\b($ARGV[7])|\b($ARGV[8])|\b($ARGV[9])|\b($ARGV[10])|\b($ARGV[11])|\b($ARGV[12])|\b($ARGV[13])|\b($ARGV[14])|\b($ARGV[15])|\b($ARGV[16])|\b($ARGV[17])|\b($ARGV[18])|\b($ARGV[19])/"\<A style\=\"white-space: nowrap\; background-color: \#FFEE00\;\" NAME\=\"KEY".$i++."\"\>$&\<\/A\>"/ige) 		{

		print {$fh2} "$row\n";
			}
	else{
	print {$fh2} "$row\n";
	}
}







}
#結束$outputFile的寫檔
close $fh2;
#結束$currentFile的讀檔
close $fh;
}



