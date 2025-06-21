#!/bin/bash

# HEVC Preview Fix Script
# Adds hvc1 tag to HEVC-encoded MP4 files to enable macOS QuickLook preview.

for f in "$@"
do
  if [[ "${f##*.}" == "mp4" || "${f##*.}" == "MP4" ]]; then
    dir=$(dirname "$f")
    base=$(basename "$f")
    temp="${dir}/.tmp_${base}"

    /opt/homebrew/bin/ffmpeg -y -i "$f" -c copy -tag:v hvc1 "$temp"
    if [ $? -eq 0 ]; then
      mv "$temp" "$f"
    else
      [ -f "$temp" ] && rm "$temp"
    fi
  fi
done
