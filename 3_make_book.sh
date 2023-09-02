#!/run/current-system/sw/bin/bash
name="$1"
end="$1.md"

touch "$end";
printf "# $name\n">"$end"

i=1
find "$name" -type f -name "media*.txt" | sort -V | while read file; do
    printf "## $i\n"
    cat "$file"
    ((i+=1))
    echo ""
done >> "$end"

pandoc "$end" -o "$name.epub"

echo "Success: $name.epub"