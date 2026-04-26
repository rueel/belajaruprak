# koding

error error go away🙏

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Learn Flutter](https://docs.flutter.dev/get-started/learn-flutter)
- [Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Flutter learning resources](https://docs.flutter.dev/reference/learning-resources)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

# Aplikasi Login Flutter

## Deskripsi Aplikasi
Aplikasi login sederhana berbasis Flutter. Aplikasi ini bersifat offline(mirip dummy) dan memiliki tiga halaman utama yaitu Login, Lupa Password, dan Dashboard.

## Daftar Fitur

- **Halaman Login**
  - Form login dengan Email dan Password
  - Validasi client-side menggunakan Form dan GlobalKey
  - Validasi email dengan regex
  - Validasi password (minimal 8 karakter, mengandung huruf dan angka)
  - Toggle show/hide password
  - Loading indicator saat login
  - Mock login: `admin@test.com` / `Admin123`

- **Halaman Lupa Password**
  - Form input email dengan validasi
  - Tombol Kirim Link Reset dengan loading state
  - Feedback menggunakan Snackbar 

- **Halaman Dashboard**
  - AppBar dengan tombol logout
  - Menampilkan data user yang berhasil login
  - ListView.builder dengan 12 item dummy menggunakan Card
  - Desain Card dengan shadow dan rounded corner
  - Logout dengan Navigator.pushAndRemoveUntil

## Cara Menjalankan Aplikasi

1. Buka terminal di dalam folder project
2. Install dependencies:
   ```bash
   flutter pub get
3. Jalankan aplikasi 
   ```bash
   flutter run
