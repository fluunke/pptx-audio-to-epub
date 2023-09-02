#!/run/current-system/sw/bin/bash
set -e

pres=$1
name=$(basename "$pres" ".pptx")

for file in ./"$name"/*.wav; do
  filename="$(basename "$file" .m4a)"
  whisper-ctranslate2 --model medium.en --output_format all \
  --threads 16 --compute_type int8 --output_dir "$name" --language en "$name/$filename"
done

echo $pres