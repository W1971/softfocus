#!/usr/bin/env bash
set -euo pipefail

echo "▶ Bootstrapping SoftFocus repository structure..."

# -------------------------
# DOCS
# -------------------------
mkdir -p docs/assessment/active
mkdir -p docs/assessment/archive
mkdir -p docs/content/ru
mkdir -p docs/content/en
mkdir -p docs/governance
mkdir -p docs/releases

# -------------------------
# SOURCE (Astro)
# -------------------------
mkdir -p src/content
mkdir -p src/layouts
mkdir -p src/pages/ru
mkdir -p src/pages/en

# -------------------------
# SCRIPTS
# -------------------------
mkdir -p scripts/guards
mkdir -p scripts/archive
mkdir -p scripts/validators
mkdir -p scripts/release

# -------------------------
# PUBLIC
# -------------------------
mkdir -p public/assets

# -------------------------
# CANONICAL ASSESSMENT FILE
# -------------------------
cat <<'EOT' > docs/assessment/active/ASSESSMENT_RESULT_COPY_FREE_v1.0.md
# SoftFocus — Assessment Result (Free)

Version: v1.0  
Status: ACTIVE  

This document defines the free assessment output.

1. Burnout Stage Classification  
2. Primary Risk Vector  
3. Short Interpretation  
4. Return Trigger Explanation
EOT

echo "✔ SoftFocus bootstrap completed successfully."
