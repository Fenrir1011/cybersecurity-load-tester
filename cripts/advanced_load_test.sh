#!/bin/bash

echo "🛡️ Advanced Load Tester - FOR AUTHORIZED TESTING ONLY"
echo "========================================================"

# Safety configuration
ALLOWED_DOMAINS=("localhost" "127.0.0.1" "test.local")

check_domain_safety() {
    local domain=$1
    for allowed in "${ALLOWED_DOMAINS[@]}"; do
        if [[ "$domain" == *"$allowed"* ]]; then
            return 0
        fi
    done
    echo "❌ ERROR: Domain not in allowed list for safety reasons."
    exit 1
}

echo "⚠️ WARNING: Only test systems you own or have permission to test!"
echo "✅ Safety checks implemented - only localhost/testing domains allowed"

# Basic load test
echo "📊 Running load test on localhost..."
for i in {1..20}; do
    curl -s http://localhost/ > /dev/null &
done

wait
echo "🎯 Load test completed"
