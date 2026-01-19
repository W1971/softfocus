#!/usr/bin/env bash

set -e

echo "=== SoftFocus A-phase Observation Checklist ==="
echo "Timestamp: $(date -u)"
echo

echo "--- GSC CHECKS (manual via console) ---"
echo "1. Indexing:"
echo "   - No increase in 404"
echo "   - No new canonical conflicts"
echo "   - No manual actions"
echo
echo "2. Performance:"
echo "   - Impressions distributed across role pages"
echo "   - Core assessment remains primary impression source"
echo "   - No sudden drops in indexed product pages"
echo
echo "Action: Review Google Search Console > Pages & Performance"
echo

echo "--- PAYMENT / ENTITLEMENT CHECKS ---"
if [ -f run.jsonl ]; then
  echo "run.jsonl found"
  echo "Recent entitlement records:"
  tail -n 5 run.jsonl
else
  echo "WARNING: run.jsonl not found"
fi
echo
echo "Verify:"
echo " - Each payment -> entitlement execution"
echo " - Severity = PASS"
echo " - No missing or duplicated payment_ref"
echo

echo "--- GOVERNANCE CHECKS ---"
echo "Verify no changes to:"
echo " - Role page templates"
echo " - Product logic"
echo " - Calculator definitions"
echo
echo "Verify no new content added during A-phase"
echo

echo "=== Observation complete ==="
