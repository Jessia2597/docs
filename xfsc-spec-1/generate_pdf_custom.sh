#!/bin/bash
# set -ex job's log is too big for gitlab if uncommented

# I.Create Table of Content
# II. Mkdocs build html files
# III. Convert html files to pdf


# I. Enumerate Heading with python library, then Create and Insert Table of Content with shell script
md=docs/L*/*.md

for file in $md; do
    echo $file
   
    # Create Table of Content
    # 1. Remove and store meta_title so that it's not enumerated
    meta_title=$(head -n 3 $file)
    echo "$meta_title" > temp.md
    sed -i '1,3d' $file # remove meta_title

    # 2. Enumerate headings with python library
    markdown-enum $file 1 $file

    # 3. Create Table of Content with shell script
    toc=$(bash create_TOC.sh $file)
    echo "$toc" >> temp.md
    echo " " >> temp.md

    cat $file >> temp.md

    # Replace original content by temp file content
    cat temp.md > $file
done


# II. Mkdocs build html files
mkdocs build 2> debug/log.txt


# III. Convert html files to pdf
# Move images into index.html folder
L_dir=public/L*

for d in $L_dir; do
    index_dir=$d/*/index.html
    index_path=$(dirname $index_dir)
    mv $d/media $index_path
done

# PDF work
dir=$(find public -name *.html)
test -f public/index.html && rm public/index.html

for file in $dir; do
    echo $file

    # Remove emojis from html file because it's not rendered in the PDF and break layout
    sed -i 's/⏩/>>/g' $file && sed -i 's/⏪//g' $file
    # Replace “ and ” by ""
    sed -i 's/“/"/g' $file && sed -i 's/”/"/g' $file
    # Replace – and by -
    sed -i 's/–/-/g' $file
    # Replace ’ and by '
    sed -i 's/’/\o047s/g' $file

    # Get title from html files, and format it
    pdf_title=$(grep -h '<title>' $file | cut -d "-" -f 2 | tr -d "/" | sed -e 's/&amp;/And/' | tr ' ' '_')

    weasyprint $file pdf/$pdf_title.pdf
done
