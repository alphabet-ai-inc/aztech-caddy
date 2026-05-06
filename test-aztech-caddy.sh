#!/bin/bash
echo "=== TESTING AZTECH-CADDY ==="
echo ""

# Test 1: Check container status
echo "1. Container status:"
docker ps | grep aztech-caddy

# Test 2: Test routing
echo ""
echo "2. Testing routing:"

echo -n "  Auth Backend ( auth-api.aztech-ai.com): "
curl -s -o /dev/null -w "%{http_code}" -H "Host: auth-api.aztech-ai.com" --max-time 5 http://localhost
echo ""

echo -n "  Apps Backend ( apps-api.aztech-ai.com): "
curl -s -o /dev/null -w "%{http_code}" -H "Host: apps-api.aztech-ai.com" --max-time 5 http://localhost
echo ""

echo -n "  Users Backend ( users-api.aztech-ai.com): "
curl -s -o /dev/null -w "%{http_code}" -H "Host: users-api.aztech-ai.com" --max-time 5 http://localhost
echo ""


# Test 3: Check logs
echo ""
echo "3. Caddy logs:"
docker logs aztech-caddy --tail=5

echo ""
echo "=== TEST FROM LOCAL MACHINE ==="
echo "Update hosts file with:"
echo "172.234.23.62 aztech-ai.com"
echo "172.234.23.62 auth-api.aztech-ai.com"
echo "172.234.23.62 apps-api.aztech-ai.com"
echo "172.234.23.62 users-api.aztech-ai.com"
echo "172.234.23.62 auth-api.test.aztech-ai.com"
echo "172.234.23.62 apps-api.test.aztech-ai.com"
echo "172.234.23.62 users-api.test.aztech-ai.com"

echo ""
echo "Then test:"
echo "curl http://aztech-ai.com"
echo "curl http://auth-api.aztech-ai.com"