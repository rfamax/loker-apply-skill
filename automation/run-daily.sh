#!/bin/bash
# loker-apply — jalan harian otomatis (Senin–Jumat 08:00)
# Setup sekali: tambahkan ke crontab (lihat cron.example).
# Script ini menjalankan skill lewat Claude Code mode headless.
set -e
cd "$(dirname "$0")/.."

# Berhenti sendiri kalau field Status di profile.md sudah "sudah dapat kerja"
# (grep dibatasi ke baris Status supaya teks petunjuk tidak ikut terhitung)
if grep -qiE '^ *- *Status: *sudah dapat kerja' templates/profile.md 2>/dev/null; then
  echo "Status: sudah dapat kerja — otomasi berhenti."
  exit 0
fi

# Satu perintah yang sama seperti kalau diketik manual.
# Sesuaikan --allowedTools dengan tools email/Instagram yang kamu pakai.
claude -p "cari loker dan kirim lamaran"
