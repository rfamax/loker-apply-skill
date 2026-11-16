---
name: loker-apply
description: Cari lowongan kerja baru dan kirim lamaran dengan 1 perintah — saring sesuai profil (pendidikan, umur, lokasi, posisi target), kirim via email atau formulir online dengan CV terlampir, dan catat hasilnya. Gunakan saat pengguna minta "cari loker", "cari kerja", "lamar kerja", "kirim lamaran", atau "loker hari ini".
---

# loker-apply

Cari lowongan kerja baru dan kirim lamarannya — cukup 1 perintah. Skill ini menyaring loker sesuai profil pengguna, mengirim lamaran lewat email atau formulir online, dan mencatat semuanya supaya tidak ada lamaran ganda.

## Cara pakai (1 klik sampai dapat kerja)

Setup sekali, lalu skill jalan sendiri tiap pagi sampai kamu dapat kerja:

1. **Setup sekali:** isi `templates/profile.md` dengan data diri (nama, umur, pendidikan, domisili, email, HP, file CV, posisi yang dicari, area). Kalau belum punya CV, kosongkan field File CV — skill akan buatkan dari data ini (lihat "Buat CV dari profil").
2. **Pasang otomasi (sekali aja):** ikuti `automation/README.md` — pasang jadwal Senin–Jumat 08:00. Selesai.
3. **Jalan sendiri:** tiap pagi kerja skill cari loker baru → saring sesuai profil → kirim yang lolos → catat → lapor. Berhenti sendiri saat field Status di profil diubah jadi `sudah dapat kerja`.

Mau jalan manual kapan saja juga bisa — ketik ke Claude Code: `cari loker dan kirim lamaran` (atau: `cari 10 loker baru dan lamar`).

Tanpa perintah tambahan, skill ini mencari **10 loker baru** per jalan, dari postingan **1–3 hari terakhir**.

## Jalan otomatis tiap pagi

- **Jadwal:** Senin–Jumat 08:00 waktu lokal. Lewati Sabtu–Minggu.
- **Tiap run:** alur yang sama (baca profil + log → cari → saring → kirim → catat → lapor).
- **Berhenti otomatis:** kalau field Status di `templates/profile.md` = `sudah dapat kerja`, jangan jalan lagi.
- **Kalau satu run tidak menemukan loker yang lolos:** laporkan dan jangan kirim apa pun — jangan ulangi run di hari yang sama.
- **Kalau run gagal** (mis. sumber tidak bisa dibaca): catat dan lanjutkan besok — jangan spam percobaan di hari yang sama.

## Buat CV dari profil (otomatis)

Kalau pengguna belum punya file CV, atau minta dibuatkan:

1. Baca `templates/profile.md`.
2. Isi `templates/cv.html` dengan data itu (ganti semua token `{{...}}`; ulangi blok pengalaman untuk tiap pekerjaan, dari yang terbaru; hapus bagian "Informasi Tambahan" kalau tidak ada isinya). Desainnya sudah dibuat 1 halaman A4 dan ramah ATS — jangan ubah struktur dan warnanya.
3. Ubah ke PDF 1 halaman A4 (coba berurutan: Chromium headless `--print-to-pdf`, lalu `weasyprint`, lalu `wkhtmltopdf`; kalau tidak ada yang tersedia, serahkan file HTML-nya).
4. Simpan sebagai `cv.pdf` dan tulis path-nya ke `templates/profile.md` (field File CV) — CV ini yang dilampirkan ke semua lamaran.
5. Jangan mengarang isi CV — hanya pakai data dari profil. Kalau ada data yang kurang (mis. ringkasan), tulis ringkasan singkat yang jujur dari pengalaman dan skill yang ada, tanpa menambah fakta baru.

## Alur kerja

### 1. Baca profil & riwayat

- Baca `templates/profile.md` — semua penyaringan memakai data ini.
- Baca `templates/applied-jobs.md` — loker yang sudah ada di sini TIDAK BOLEH dilamar lagi (cocokkan nama perusahaan + posisi; perusahaan sama dengan posisi berbeda boleh dilamar).

### 2. Cari loker baru

Sumber (sesuaikan dengan area di profil):

- Akun Instagram loker di area pengguna (cari dengan kata kunci `loker` + nama kota; contoh untuk area Bekasi/Jakarta: @lokerbekasi, @info.lokerbekasi.id, @infokerjabekasi, @lokerjakarta.id, @karirfeed, @lokersmainfo, @lokerbekasi.idn — ganti dengan akun di areamu).
- Pencarian publik Indeed (tanpa login) untuk loker yang tidak ada di Instagram.
- Cari postingan terbaru (1–3 hari terakhir). Tolak postingan lama atau yang sudah lewat tenggat.

### 3. Saring setiap loker

Lamar HANYA yang lolos SEMUA syarat ini:

- **Pendidikan:** syarat minimal sesuai profil. Tolak yang mensyaratkan pendidikan lebih tinggi dari pendidikan pengguna.
- **Umur:** batas umur loker masih mencakup umur pengguna.
- **Lokasi:** di area yang ditulis di profil.
- **Posisi:** sesuai posisi target yang ditulis di profil. Tolak posisi di luar target.
- **Tanpa bayaran:** tolak loker yang meminta bayaran/uang pendaftaran.
- **Bisa dieksekusi langsung:** lamaran via email atau formulir online yang bisa diisi dari data CV. Tolak yang butuh pengguna sendiri: walk-in, aplikasi di HP (KitaLulus, Glints, dll.), formulir yang butuh data/foto baru (tinggi/berat, foto seluruh badan), atau yang butuh login akun pengguna.
- **Formulir:** tolak di tahap seleksi (jangan dicoba dulu baru dicatat gagal) kalau formulir butuh login akun, wajib upload foto fullbody, atau wajib isi data yang tidak ada di CV.
- **Loker WA-only:** JANGAN dilamar — masukkan ke daftar manual (lihat bawah).

Kalau loker yang cocok kurang dari 10, lamar sebanyak yang ada dan laporkan jumlahnya dengan jujur. Kalau tidak ada sama sekali, laporkan dan jangan kirim apa pun.

### 4. Kirim lamaran

- **Via email:** kirim dari email di profil, lampirkan CV, pakai `templates/cover-letter.md` (sesuaikan [Nama Posisi] dan [Nama Perusahaan] per loker). Subjek: `Lamaran Pekerjaan – [Posisi] – [Nama]` kecuali loker meminta format lain. Periksa alamat email tujuan sebelum mengirim; jangan kirim ke alamat yang belum terverifikasi sebagai inbox rekrutmen.
- **Via formulir online:** isi dengan data dari CV/profil. Jangan mengarang jawaban. Kalau formulir menanyakan hal yang tidak ada di data, tanyakan dulu ke pengguna. Untuk gaji yang diharapkan, pakai angka yang sudah ditulis di profil. Kalau formulir tidak bisa diisi langsung (mis. butuh login), jangan lanjutkan dan catat sebagai gagal.
- **JANGAN** kirim lamaran lewat WhatsApp.

### 5. Penyesuaian CV (opsional, langsung jalan)

Kalau CV perlu disesuaikan dengan posisi yang dilamar, lakukan langsung tanpa tanya dulu. Yang boleh diubah: ringkasan/profil, urutan dan penekanan pengalaman serta skill agar relevan dengan posisi. Yang TIDAK BOLEH: mengarang pengalaman, jabatan, skill, atau pendidikan yang tidak ada. CV master JANGAN diubah — simpan versi yang disesuaikan per lamaran (nama file: `tanggal-nama-perusahaan-posisi.pdf`) dan catat versi yang dipakai.

### 6. Catat & lapor

- Catat semua hasil di `templates/applied-jobs.md` pada hari yang sama: perusahaan, posisi, jalur pengiriman, tanggal, bukti pengiriman (ID pesan email / konfirmasi formulir).
- Catat juga yang gagal beserta alasannya, dan yang masuk daftar manual.
- Periksa folder Terkirim dan email yang terpental (bounce): lamaran yang terpental = tidak pernah sampai, jangan dilaporkan sebagai "menunggu balasan".
- Laporan ke pengguna: daftar loker yang dilamar hari ini (posisi, perusahaan, lokasi, cara melamar) + yang gagal dan kenapa. Loker yang butuh pengguna sendiri TIDAK usah dilaporkan sebagai "gagal" — cukup masuk daftar manual.

## Daftar manual (butuh tindakan pengguna)

Buat daftar terpisah untuk loker yang tidak bisa dieksekusi langsung:

- **Walk-in:** tanggal, jam, alamat lengkap, berkas yang dibawa.
- **Aplikasi HP (KitaLulus, dll.):** nama perusahaan dan posisi.
- **WA-only:** nomor kontak dan nama narahubung.

Sampaikan daftar ini ke pengguna bersama laporan lamaran yang terkirim.

## Hal yang tidak pernah dilakukan

- Jangan pernah membalas email HRD atas nama pengguna tanpa perintah eksplisit.
- Jangan pernah mengirim pesan WhatsApp ke orang lain atas nama pengguna.
- Jangan pernah membayar untuk melamar atau untuk jasa pembuka loker.
- Jangan pernah mengarang angka pencapaian, gaji, atau data lain di lamaran dan CV.
- Jangan pernah mentransfer uang untuk alasan apa pun.
