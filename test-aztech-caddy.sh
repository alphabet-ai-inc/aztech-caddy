#!/bin/bash
echo "=== TESTING AZTECH-CADDY ==="
echo ""

# Test 1: Check container status
echo "1. Container status:"
docker ps | grep aztech-caddy

# Test 2: Test routing
echo ""
echo "2. Testing routing:"

echo -n "  Django (aztech-ai.com): "
curl -s -o /dev/null -w "%{http_code}" -H "Host: aztech-ai.com" --max-time 5 http://localhost
echo ""

echo -n "  Auth Frontend (app.auth.aztech-ai.com): "
curl -s -o /dev/null -w "%{http_code}" -H "Host: app.auth.aztech-ai.com" --max-time 5 http://localhost
echo ""

echo -n "  Auth Backend (api.auth.aztech-ai.com): "
curl -s -o /dev/null -w "%{http_code}" -H "Host: api.auth.aztech-ai.com" --max-time 5 http://localhost
echo ""

# Test 3: Check logs
echo ""
echo "3. Caddy logs:"
docker logs aztech-caddy --tail=5

echo ""
echo "=== TEST FROM LOCAL MACHINE ==="
echo "Update hosts file with:"
echo "172.234.23.62 aztech-ai.com"
echo "172.234.23.62 app.auth.aztech-ai.com"
echo "172.234.23.62 api.auth.aztech-ai.com"
echo ""
echo "Then test:"
echo "curl http://aztech-ai.com"
echo "curl http://app.auth.aztech-ai.com"