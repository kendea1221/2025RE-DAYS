#!/bin/bash

# 圧縮したいディレクトリを指定
INPUT_DIR="./public/videos"
OUTPUT_DIR="./public/compressed"

# 出力フォルダが存在しなければ作成
mkdir -p "$OUTPUT_DIR"

# ディレクトリ内の動画ファイルを順に処理
for file in "$INPUT_DIR"/*.{mp4,mov,mkv,avi}; do
  # ファイルが存在しない場合はスキップ
  [ -e "$file" ] || continue

  # 出力ファイル名（拡張子を除去して再付与）
  filename=$(basename "$file")
  output="$OUTPUT_DIR/$filename"

  echo "圧縮中：$filename"

  # ffmpegコマンドで圧縮（H.264 / 720p / 音声AAC）
  ffmpeg -i "$file" -vcodec libx264 -preset slow -crf 28 -acodec aac -b:a 128k -vf "scale=-1:720" "$output"
done

echo "✅ 圧縮完了！"