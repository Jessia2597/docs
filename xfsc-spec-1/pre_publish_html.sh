#!/bin/bash
set -ex

dir=public/L*

for d in $dir; do
index_dir=$d/*/index.html
index_path=$(dirname $index_dir)
mv $d/media $index_path
done