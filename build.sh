#!/bin/bash
# Build the InsightSignal .mcpb Desktop Extension bundle.
# Run from the desktop-extension/ directory.
#
# Usage: bash build.sh
#
# Output: insightsignal.mcpb (in current directory)
#
# The bundle uses Node.js (Claude Desktop's built-in runtime) — no
# Python, uv, or npm dependencies required on the target machine.

set -e

BUNDLE_NAME="insightsignal.mcpb"

echo "Building $BUNDLE_NAME..."

# Remove old bundle if exists
rm -f "$BUNDLE_NAME"

# Build with correct directory structure using Python (cross-platform)
python -c "
import zipfile
with zipfile.ZipFile('$BUNDLE_NAME', 'w', zipfile.ZIP_DEFLATED) as z:
    z.write('manifest.json')
    z.write('server/index.js')
    if __import__('os').path.exists('icon.png'):
        z.write('icon.png')
"

echo ""
echo "Built: $BUNDLE_NAME"
python -c "
import zipfile
z = zipfile.ZipFile('$BUNDLE_NAME')
for i in z.infolist():
    print(f'  {i.file_size:>8}  {i.filename}')
z.close()
"
echo ""
echo "To install: Open Claude Desktop → Settings → Extensions → Install Extension → select $BUNDLE_NAME"
