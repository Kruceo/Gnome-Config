#!/bin/bash
# Builds the main config.sh script from parts.

set -e
echo "#!/bin/bash" > config.sh
# Append scripts from ./parts, sorted numerically.
# This loop is safe for filenames with spaces.
ls -1v ./parts/*.sh | while IFS= read -r file; do
    echo "including $file"
    cat "$file" >> config.sh
    echo "" >> config.sh
    # Reset CWD after each part. $ORIGINAL_PATH is set in init.sh.
    echo "cd \"\$ORIGINAL_PATH\"" >> config.sh
    echo "" >> config.sh
done

# Run final processing
bun tools/fileReplacer.js ./config.sh

echo "config.sh built successfully."
