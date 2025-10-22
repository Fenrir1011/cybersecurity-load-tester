#!/bin/bash

echo "💀 Extreme Load Tester - USE WITH CAUTION"
echo "==========================================="

echo "🚨 CRITICAL WARNING: For authorized testing only!"
echo "🔒 Safety: Only works with localhost/test domains"

# Extreme safety check
if [[ ! "$1" =~ ^(localhost|127\.0\.0\.1|test\.local|.*\.local)$ ]]; then
    echo "❌ SAFETY VIOLATION: Use only local/test domains"
    exit 1
fi

TARGET=${1:-"localhost"}
echo "🔥 Testing: $TARGET"

for wave in {1..3}; do
    echo "🌊 Wave $wave: High load"
    for i in {1..50}; do
        curl -s "http://$TARGET/" > /dev/null &
    done
    sleep 2
done

wait
echo "✅ Extreme test completed"
