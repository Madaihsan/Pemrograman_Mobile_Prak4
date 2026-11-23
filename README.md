# PemrogramanMobile-P4-Starter

Starter project **Praktikum 4: State Management dengan Provider**, berupa aplikasi keranjang belanja sederhana.

Kode Langkah 1–6 dari modul **sudah ditulis** di repo ini. Tugasmu adalah mengerjakan **Tugas Praktikum 4**. Setiap bagian yang harus diubah ditandai komentar `// TODO(Tugas ...)` di dalam kode.

---

## 1. Persiapan

| Kebutuhan | Keterangan |
|---|---|
| Flutter SDK | versi stable terbaru, cek dengan `flutter doctor` |
| Editor | VS Code (ekstensi Flutter + Dart) atau Android Studio |
| Perangkat uji | Chrome, emulator Android, atau HP Android |
| Git + akun GitHub | untuk mengumpulkan hasil |

Package yang dipakai sudah terdaftar di `pubspec.yaml`:

- `provider` untuk state management
- `intl` untuk format Rupiah (dipakai di Tugas 3)

## 2. Cara Memulai

```bash
# 1. Clone starter ini
git clone https://github.com/MuhammadIbnuA/PemrogramanMobile-P4-Starter.git
cd PemrogramanMobile-P4-Starter

# 2. Ambil package
flutter pub get

# 3. Jalankan aplikasi
flutter run -d chrome
```

Untuk pengumpulan, buat repository **public** baru di akun GitHub-mu, lalu arahkan remote ke sana:

```bash
git remote set-url origin https://github.com/<username-kamu>/<nama-repo>.git
git push -u origin main
```

## 3. Struktur Proyek

Starter ini hanya menyertakan platform **Android** dan **Web (Chrome)**, sesuai perangkat uji di modul. Kalau perlu platform lain, tambahkan dengan `flutter create --platforms=windows .` (ganti `windows` dengan `ios`, `macos`, atau `linux`).

```
android/                      # platform Android
web/                          # platform Web (Chrome)
lib/
|- main.dart                  # Langkah 4: mendaftarkan ChangeNotifierProvider
|- models/
|  `- item.dart               # Langkah 2: model data Item
|- providers/
|  `- cart_provider.dart      # Langkah 3: CartProvider (ChangeNotifier)
`- screens/
   |- catalog_screen.dart     # Langkah 5: halaman Katalog (context.read)
   `- cart_screen.dart        # Langkah 6: halaman Keranjang (Consumer)
test/
`- widget_test.dart           # test alur tambah barang -> checkout
```

## 4. Ringkasan Konsep Provider

| Komponen | Peran | Dipakai di |
|---|---|---|
| `ChangeNotifier` | Menyimpan state dan memanggil `notifyListeners()` saat data berubah | `cart_provider.dart` |
| `ChangeNotifierProvider` | Menyediakan `CartProvider` ke semua widget di bawahnya | `main.dart` |
| `Consumer` / `context.watch` | Mendengarkan perubahan dan membangun ulang tampilan | `cart_screen.dart` |
| `context.read` | Memanggil fungsi tanpa mendengarkan perubahan | `catalog_screen.dart` |

Halaman Katalog dan Keranjang **tidak saling mengoper data**. Keduanya membaca dari `CartProvider` yang sama.

## 5. Tugas Praktikum 4

Cari semua tugas dengan fitur search editor (`Ctrl+Shift+F`) menggunakan kata kunci **`TODO(Tugas`**.

### Tugas 1: Hapus per item (wajib)

Tambahkan tombol hapus (ikon tempat sampah) di setiap item pada halaman Keranjang.

| Bagian | File | Yang dikerjakan |
|---|---|---|
| 1a | `lib/providers/cart_provider.dart` | Buat method `removeItem(Item item)` yang memanggil `_items.remove(item)` lalu `notifyListeners()` |
| 1b | `lib/screens/cart_screen.dart` | Tambahkan `trailing: IconButton(icon: Icon(Icons.delete), ...)` yang memanggil `cart.removeItem(item)` |

**Selesai jika:** item hilang dari daftar Keranjang dan total harga langsung berkurang.

### Tugas 2: Badge jumlah barang (wajib)

Tampilkan jumlah barang di ikon keranjang pada AppBar halaman Katalog.

| File | Yang dikerjakan |
|---|---|
| `lib/screens/catalog_screen.dart` | Bungkus `IconButton` keranjang dengan `Consumer<CartProvider>`, lalu bungkus `Icon` dengan widget `Badge`. Contoh kodenya ada di komentar TODO. |

**Selesai jika:** angka badge bertambah saat menekan `+` di Katalog, berkurang saat item dihapus di Keranjang, dan badge hilang saat keranjang kosong.

### Tugas 3: Format Rupiah (wajib)

Tampilkan harga sebagai `Rp 10.000.000`, bukan `Rp 10000000`.

| File | Yang dikerjakan |
|---|---|
| `lib/screens/catalog_screen.dart` | Format harga di subtitle setiap barang |
| `lib/screens/cart_screen.dart` | Format harga tiap item **dan** total harga |

Petunjuk:

```dart
import 'package:intl/intl.dart';

final rupiah = NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ', decimalDigits: 0);
Text(rupiah.format(item.price)); // Rp 10.000.000
```

**Selesai jika:** semua harga di kedua halaman memakai titik sebagai pemisah ribuan.

### Tugas 4: Refactoring challenge (nilai tambahan)

Buat ulang aplikasi yang sama dengan **Riverpod**, **Bloc**, atau **GetX**, misalnya di branch terpisah. Bandingkan hasilnya dengan Provider di laporan.

### Checklist

- [ ] Tugas 1a: `removeItem` di `CartProvider`
- [ ] Tugas 1b: tombol hapus di `CartScreen`
- [ ] Tugas 2: badge jumlah barang di AppBar Katalog
- [ ] Tugas 3: format Rupiah di Katalog dan Keranjang (termasuk total)
- [ ] Tugas 4 (opsional): versi Riverpod / Bloc / GetX
- [ ] `flutter analyze` tanpa error
- [ ] `flutter test` lulus

## 6. Menguji Aplikasi

1. Jalankan `flutter run -d chrome`.
2. Tambahkan beberapa barang di Katalog. Badge harus bertambah (Tugas 2).
3. Buka Keranjang. Barang muncul dan total terhitung otomatis dalam format Rupiah (Tugas 3).
4. Hapus satu item. Item hilang dan total berkurang (Tugas 1).
5. Tekan **Checkout**. Keranjang kosong kembali.

Cek kualitas kode:

```bash
flutter analyze
flutter test
```

## 7. Laporan Praktikum 4

1. Judul dan tujuan.
2. **Perbandingan teori:** perbedaan `setState` dan Provider berdasarkan pengalaman praktikum. Mengapa `setState` tidak efisien untuk kasus ini?
3. **Penjelasan kode:** fungsi `ChangeNotifier`, `notifyListeners`, `Consumer`, dan `context.read` pada kode yang dibuat.
4. **Screenshot:** Katalog dengan badge, Keranjang berisi item, dan fitur hapus item.
5. Link repository GitHub (**public**).
6. Kesimpulan.

Laporan dikumpulkan melalui e-learning.

## 8. Troubleshooting

| Masalah | Solusi |
|---|---|
| `fatal: detected dubious ownership in repository` saat menjalankan `flutter` | `git config --global --add safe.directory <path-flutter-sdk>` |
| `flutter` tidak dikenali | Tambahkan `<path-flutter-sdk>\bin` ke PATH, lalu buka terminal baru |
| Error `Target of URI doesn't exist: 'package:intl/intl.dart'` | Jalankan `flutter pub get` |
| Error ratusan baris `'Matrix4' isn't a type` | Package tidak terbaca. Jalankan `flutter clean` lalu `flutter pub get`, dan jalankan dari terminal biasa (PowerShell / terminal VS Code) |
