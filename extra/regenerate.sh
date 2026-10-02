#!/usr/bin/env bash
#
# extra/regenerate.sh
#
# Rebuilds the snapshot files in extra/ from the live system. These files
# are NOT symlinks and do NOT auto-update — run this before every commit
# that you want to include current package/script state.
#
# Usage: ./extra/regenerate.sh
# Run from anywhere; paths are resolved relative to this script's location.

set -euo pipefail

EXTRA_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TIMESTAMP="$(date -u +%Y-%m-%dT%H:%M:%SZ)"

echo "Regenerating snapshots in: $EXTRA_DIR"
echo "Timestamp: $TIMESTAMP"
echo

# --- packages.txt: full package state (includes all dependencies) --------
echo "-> packages.txt"
{
  echo "# Full dpkg selections snapshot"
  echo "# Generated: $TIMESTAMP"
  echo "# NOTE: includes dependencies, not just manually installed packages."
  echo "# For restore, use manual-packages.txt instead."
  echo
  dpkg --get-selections
} > "$EXTRA_DIR/packages.txt"

# --- manual-packages.txt: only explicitly installed packages -------------
echo "-> manual-packages.txt"
{
  echo "# Manually installed packages (apt-mark showmanual)"
  echo "# Generated: $TIMESTAMP"
  echo "# Restore with: sudo apt install \$(cat manual-packages.txt)"
  echo
  apt-mark showmanual
} > "$EXTRA_DIR/manual-packages.txt"

# --- systemd user unit list (units themselves live in ~/.config/systemd) -
echo "-> systemd-user-units.txt"
{
  echo "# Enabled systemd --user units (for reference/restore verification)"
  echo "# Generated: $TIMESTAMP"
  echo
  systemctl --user list-unit-files --state=enabled --no-pager 2>/dev/null || true
} > "$EXTRA_DIR/systemd-user-units.txt"

echo
echo "Done. Review changes with 'git status' / 'git diff' before committing."