#!/run/current-system/sw/bin/bash
pres=$1
name=$(basename "$pres" ".pptx")
path="${name}/zip"
mkdir -p "${path}"

unzip "$pres" -d "${path}"

find "${path}/ppt/media" -name '*m4a' -exec mv {} "${name}" \;

rm -r "${path}"

for file in ./"$name"/*.m4a; do
  filename="$(basename "$file" .m4a)"
  ffmpeg -i "$file" -ar 16000 -ac 1 -c:a pcm_s16le "$name/$filename.wav"
  # Delete the original file
  rm "$file"
done


echo $pres