# Aplikasi Login Flutter

Aplikasi login sederhana berbasis Flutter yang dibuat untuk tugas praktikum Mobile Programming. Aplikasi ini bersifat **offline** dan memiliki tiga halaman utama.

## Daftar Fitur

- **Halaman Login**
  - Form login dengan Email dan Password
  - Validasi client-side menggunakan `Form` + `GlobalKey<FormState>`
  - Validasi email dengan regex
  - Validasi password (minimal 8 karakter, mengandung huruf & angka)
  - Toggle show/hide password
  - Loading indicator
  - Multiple user login (bukan hanya 1 mock)

- **Halaman Lupa Password**
  - Form input email dengan validasi
  - Tombol Kirim Link Reset dengan loading state
  - Feedback menggunakan Snackbar

- **Halaman Dashboard**
  - AppBar dengan tombol logout
  - Menampilkan data user yang login
  - GridView Recovery Tools (10 item)
  - Bottom Navigation Bar (Home, Menu, Profil)
  - Password di Profil bisa di show/hide

## Cara Menjalankan Aplikasi

1. Buka terminal di folder project
2. Install dependencies:
   ```bash
   flutter pub get