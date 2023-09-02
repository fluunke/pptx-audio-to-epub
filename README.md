# audio-in-pptx-to-epub

a very specific conversion tool using whisper-ctranslate2 and pandoc

```sh
nix develop

./1_unzip_and_convert_audio.sh powerpoint.pptx
./2_run_whisper powerpoint.pptx
./3_make_book powerpoint
```
