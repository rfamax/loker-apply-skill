# Otomasi Harian — jalan tiap pagi sampai dapat kerja

Skill ini dirancang untuk jalan sendiri tiap pagi kerja, tanpa perlu diketik ulang. Setup sekali, lalu berhenti sendiri saat kamu sudah dapat kerja.

## Setup (sekali aja)

**Linux / macOS (cron):**

1. Buat script bisa dijalankan:
   ```bash
   chmod +x automation/run-daily.sh
   ```
2. Pasang jadwalnya:
   ```bash
   crontab -e
   ```
   Tempel baris dari `cron.example` (sesuaikan path folder skill). Jadwalnya: **Senin–Jumat 08:00** waktu lokal.
3. Pastikan Claude Code sudah login dan bisa jalan headless (`claude -p "halo"` sebagai tes).

**Windows (Task Scheduler):**

Buat task baru → Trigger: Senin–Jumat 08:00 → Action: jalankan `claude -p "cari loker dan kirim lamaran"` dengan "Start in" diisi folder skill ini.

## Yang terjadi tiap pagi

Tiap run menjalankan alur skill yang sama: baca profil + catatan lamaran → cari loker baru → saring sesuai profil → kirim yang lolos → catat → lapor. Kalau tidak ada loker yang lolos hari itu, tidak ada yang dikirim — dan run tidak diulang di hari yang sama.

## Berhenti otomatis

Ubah field **Status** di `templates/profile.md` menjadi `sudah dapat kerja`. Script harian akan berhenti sendiri mulai run berikutnya. Tidak perlu hapus cron-nya.

## Catatan

- Jalan headless butuh sesi login Claude Code + akses email/Instagram yang sudah beres. Kalau pengiriman email pertama kali minta persetujuan, jalankan sekali secara interaktif dulu (`cari loker dan kirim lamaran`), baru pasang otomasi.
- Log tiap run tersimpan di `/tmp/loker-apply.log` (sesuai `cron.example`).
- Tetap bisa jalan manual kapan saja — ketik `cari loker dan kirim lamaran` ke Claude Code.
