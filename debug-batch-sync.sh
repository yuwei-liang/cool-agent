#!/bin/bash

# Quick debug script for batch file sync issue
echo "=== Debugging batch file sync issue ==="
echo ""

# Check if we're in a Git repository
if [[ ! -d ".git" ]]; then
    echo "❌ Not in a Git repository"
    exit 1
fi

echo "✅ In a Git repository"
echo ""

# Check if the batch file exists
BATCH_FILE="batch/mp/TestBizInsightsEnabledBatch.php"
if [[ ! -f "$BATCH_FILE" ]]; then
    echo "❌ Batch file not found: $BATCH_FILE"
    echo ""
    echo "Available batch files:"
    find . -name "*.php" -path "*/batch/*" 2>/dev/null | head -10
    exit 1
fi

echo "✅ Batch file exists: $BATCH_FILE"
echo ""

# Check Git status
echo "=== Git Status ==="
git status --porcelain "$BATCH_FILE"
echo ""

# Check if file is tracked by Git
echo "=== Git Tracking ==="
if git ls-files "$BATCH_FILE" &>/dev/null; then
    echo "✅ File is tracked by Git"
else
    echo "❌ File is not tracked by Git"
    echo "   Add it with: git add $BATCH_FILE"
fi
echo ""

# Check file size
FILE_SIZE=$(stat -f %z "$BATCH_FILE" 2>/dev/null || stat -c %s "$BATCH_FILE" 2>/dev/null)
echo "=== File Size ==="
echo "Size: $FILE_SIZE bytes ($(($FILE_SIZE / 1024))KB)"
if [[ $FILE_SIZE -gt 10485760 ]]; then
    echo "⚠️  File is larger than 10MB limit"
else
    echo "✅ File size is within limit"
fi
echo ""

# Show what k8s-sync would do
echo "=== k8s-sync Analysis ==="
echo "Default mode (Git-tracked files only):"
if git status --porcelain "$BATCH_FILE" | grep -q .; then
    echo "✅ File would be synced (has Git changes)"
else
    echo "❌ File would NOT be synced (no Git changes)"
    echo "   Solutions:"
    echo "   1. Use --all-files mode: k8s-sync --all-files . <pod_name>"
    echo "   2. Make a small change to the file"
    echo "   3. Add the file if untracked: git add $BATCH_FILE"
fi
echo ""

echo "All-files mode:"
echo "✅ File would be synced (exists and not ignored)"
echo ""

echo "=== Quick Fix ==="
echo "To sync this file immediately, run:"
echo "k8s-sync --all-files . <your_pod_name>"
echo ""
echo "Or to debug further:"
echo "./bin/k8s-sync-debug . $BATCH_FILE" 