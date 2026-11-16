# loker-apply-skill

Cari lowongan kerja baru dan kirim lamarannya — **1 klik sampai dapat kerja**.

Setup sekali, lalu skill jalan sendiri tiap pagi kerja (Senin–Jumat 08:00): cari loker → saring sesuai profil → kirim lamaran → catat → lapor. Berhenti sendiri saat kamu sudah dapat kerja.

Belum punya CV? Skill ini bisa buatkan dari data profil kamu — 1 halaman A4, ramah ATS. Kamu cukup isi data di `templates/profile.md`, sisanya dikerjakan skill.

## Install

```bash
npx skills add rizqialfahri-create/loker-apply-skill
```

## Cara pakai

1. **Setup sekali:** isi `templates/profile.md` dengan data diri kamu (nama, umur, pendidikan, domisili, email, HP, file CV, posisi yang dicari, area).
2. **Pasang otomasi (sekali aja):** ikuti `automation/README.md` — jadwal Senin–Jumat 08:00. Selesai.
3. Skill jalan sendiri tiap pagi sampai kamu dapat kerja. Ubah field **Status** di profil menjadi `sudah dapat kerja` untuk menghentikannya.

Mau jalan manual juga bisa — ketik ke Claude Code:

   ```
   cari loker dan kirim lamaran
   ```

   Atau: `cari 10 loker baru dan lamar`.

Tanpa perintah tambahan, skill ini mencari **10 loker baru** per jalan, dari postingan **1–3 hari terakhir**.

## Isi repo

```
loker-apply-skill/
├── SKILL.md                    # Instruksi skill (dibaca Claude Code)
├── templates/
│   ├── profile.md              # Data diri — isi sekali
│   ├── cv.html                 # Template CV (1 halaman A4, ramah ATS)
│   ├── cover-letter.md         # Template surat lamaran
│   └── applied-jobs.md         # Catatan lamaran terkirim
├── automation/
│   ├── run-daily.sh            # Script jalan harian (Senin–Jumat 08:00)
│   ├── cron.example            # Contoh baris crontab
│   └── README.md               # Cara pasang otomasi
├── README.md
└── LICENSE
```

## Aturan utama

- Hanya melamar posisi yang sesuai target di profil pengguna.
- Hanya lewat email atau formulir online yang bisa diisi dari data CV.
- Tidak pernah membayar untuk melamar.
- Tidak pernah membalas email HRD atas nama kamu tanpa perintah eksplisit.
- Tidak pernah mengarang pengalaman, jabatan, skill, atau data lain di lamaran dan CV.
- Loker yang butuh kamu sendiri (walk-in, aplikasi HP, WA-only) masuk daftar manual, bukan dilamar langsung.

## Penyesuaian CV

Kalau CV perlu disesuaikan dengan posisi yang dilamar, skill ini melakukannya langsung: ringkasan dan penekanan pengalaman diubah agar relevan — tanpa mengarang apa pun. CV master tidak diubah; versi yang disesuaikan disimpan terpisah per lamaran.

## Lisensi

MIT. Skill ini bukan afiliasi dari platform loker mana pun. Kamu bertanggung jawab atas lamaran yang dikirim atas namamu — periksa laporan setiap selesai jalan.
