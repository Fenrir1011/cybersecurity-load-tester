#!/bin/bash

echo "📊 Professional Benchmark Tool"
echo "=============================="

TARGET=${1:-"localhost"}

# Safety first
if [[ ! "$TARGET" =~ ^(localhost|127\.0\.0\.1|test\.) ]]; then
    echo "❌ Use only local/test domains"
    exit 1
fi

echo "Testing: $TARGET"

for concurrent in 10 25 50; do
    echo "🔍 Testing $concurrent concurrent connections..."
    seq 1 100 | xargs -P $concurrent -I {} curl -s "http://$TARGET/" > /dev/null
    echo "   ✅ Completed $concurrent concurrent"
done

echo "📈 Benchmark completed"
