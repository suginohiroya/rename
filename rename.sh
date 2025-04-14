#!/bin/bash

# ファイル名リストを読み込む
source old_names.sh
source new_names.sh

# 配列の長さを取得
length=${#old_names[@]}

# 出力ディレクトリの作成
output_dir="./renamed_files"

# 各ファイルに対してリネームを実行
for ((i=0; i<length; i++)); do
    old_name="${old_names[$i]}"
    new_name="${new_names[$i]}"

    # studyディレクトリ内でファイルを検索
    found_file=$(find ./study -name "$old_name" -type f)

    if [ -n "$found_file" ]; then
        echo "リネーム: $old_name -> $new_name"
        # ファイルを新しいディレクトリにコピーしてリネーム
        cp "$found_file" "$output_dir/$new_name"
    else
        echo "警告: $old_name が見つかりません"
    fi
done

echo "リネーム処理が完了しました"