#!/bin/sh

for patch in ../patches/*.patch; do
    [ -e "$patch" ] || continue

    echo "Applying $patch..."
    git apply "$patch" || {
        echo "Failed to apply $patch"
        exit 1
    }
done

echo "All patches applied successfully."
