#!/bin/bash

result_dir=docx2pic_result
tmp_dir=docx2pic_tmp

while [ -d "${tmp_dir}" ]
do
 tmp_dir="${tmp_dir}_"
done
mkdir -p $tmp_dir

for filename in *.docx
do
	echo "Working with ${filename}"

	dst_pics="${result_dir}/${filename%.*}"-pictures

	mkdir -p $tmp_dir
	cp "${filename}" "${tmp_dir}/${filename}".zip
	unzip -q "${tmp_dir}/${filename}".zip -d "${tmp_dir}"

	mkdir -p "${dst_pics}"
	find "${tmp_dir}" -name '*.jp*' -exec cp {} "${dst_pics}" \;
	rm -r "${tmp_dir}"
done

echo "All done"

