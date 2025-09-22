#!/bin/bash
# Usage: ./run_scan.sh 192.168.1.0/24
NET_RANGE=${1:-"192.168.1.0/24"}
TIMESTAMP=$(date +"%Y%m%d_%H%M")
OUT_DIR="scan_output_${TIMESTAMP}"
mkdir -p "$OUT_DIR" && cd "$OUT_DIR" || exit

echo "Running SYN scan on $NET_RANGE ..."
nmap -sS -T4 "$NET_RANGE" -oN scan_results.txt -oX scan_results.xml

echo "Looking for interesting hosts (open ports) ..."
grep "open" scan_results.txt > open_ports_summary.txt || true

if command -v xsltproc >/dev/null 2>&1; then
  xsltproc scan_results.xml -o scan_results.html
  echo "Generated scan_results.html"
fi

echo "Done. Files saved in $(pwd):"
ls -lah
