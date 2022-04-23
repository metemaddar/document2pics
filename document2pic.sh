#!/bin/bash

result_dir='docx2pic_result'
tmp_dir='docx2pic_tmp'

while [ -d "${tmp_dir}" ]
do
 tmp_dir="${tmp_dir}_"
done
mkdir -p "${tmp_dir}"

for filename in *.docx
do
	echo "Working with ${filename}"

	unzip -q "${filename}" -d "${tmp_dir}"

	dst_pics="${result_dir}/${filename%.*}"-pictures
	mkdir -p "${dst_pics}"
	find "${tmp_dir}" -name 'image*' -exec cp {} "${dst_pics}" \;

	rm -r "${tmp_dir}"/*
done

for filename in *.odt
do
	echo "Working with ${filename}"

	unzip -q "${filename}" -d "${tmp_dir}"

	dst_pics="${result_dir}/${filename%.*}"-pictures
	mkdir -p "${dst_pics}"
	cp "${tmp_dir}"/Pictures/* "${dst_pics}"/

	rm -r "${tmp_dir}"
done

echo 'All done'
