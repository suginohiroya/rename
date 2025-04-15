#!/bin/bash

# 変更前と変更後のファイル名のリストを読み込む
source old_names.sh
source new_names.sh

# 変更元のディレクトリを指定
source_dir="old_name_files"

# 新しい保存先ディレクトリを指定
destination_dir="new_files"

# 各ファイルを逆順でリネーム
for (( i=${#old_names[@]}-1; i>=0; i-- )); do

    old_name="${source_dir}/${old_names[$i]}"
    new_name="${destination_dir}/${new_names[$i]}"
    if [ -f "$old_name" ]; then
        mv "$old_name" "$new_name"
        echo "成功: $new_name"
    else
        echo "警告: $old_name not found"
    fi
done