#!/bin/su
mytmp=/tmp/docx2pic
#Create temp directory
mkdir -p $mytmp
#Temp directory for extraction
mkdir -p $mytmp/extraction
#Directory to fetch images from it
mymedia=extraction/word/media/
#file name from input (maybe its path of file)
fname=$(basename "$1")
#file name with it's path plus -pictures
dstpics="${1%.*}"-pictures
#extract the file extension
extension="${fname##*.}"
#exact file name
filename="${fname%.*}"

#Now I just get docx's pictures. Because it rename them by image1 image2 ...
if [[ "$extension" == "docx" ]]
then
	cp $1 ${mytmp}/${fname}.zip
	unzip -q ${mytmp}/${fname}.zip -d ${mytmp}/extraction
	#directory to put images in it
	mkdir -p $dstpics
	#Copy images to directory beside docx image
	cp $mytmp/$mymedia/*.png $dstpics/
	#remove temp files.
	rm -r $mytmp/*
fi
