#!/bin/sh

METRIC=fadvisor_file_size_bytes

echo "# HELP $METRIC The total size of file or directory"
echo "# TYPE $METRIC gauge"

echo "$FILES" | while IFS= read -r file && [[ -n "$file" ]]; do

    dest="/host$file"

    if [[ ! -e $dest ]]; then
        echo "File doesn't exists: $file" >&2
        continue
    fi

    size="$(du -s "$dest" | cut -f1)"

    echo "$METRIC{file=\"$file\"} $size"

done
