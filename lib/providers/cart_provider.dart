// Langkah 3 — State Management ("otak" aplikasi)
import 'package:flutter/foundation.dart';

import '../models/item.dart';

class CartProvider extends ChangeNotifier {
  // Daftar item (private, hanya bisa diubah dari kelas ini)
  final List<Item> _items = [];

  // Getter untuk dibaca dari luar (tidak bisa diubah langsung)
  List<Item> get items => List.unmodifiable(_items);

  int get totalPrice => _items.fold(0, (sum, item) => sum + item.price);

  void addItem(Item item) {
    _items.add(item);
    notifyListeners(); // PENTING: memberi tahu UI bahwa data berubah
  }

  // TODO(Tugas 1a - wajib): Hapus per item — bagian logika.
  // Tambahkan method removeItem(Item item) yang:
  //   1. memanggil _items.remove(item)
  //   2. lalu memanggil notifyListeners()
  // Lanjutkan ke Tugas 1b di lib/screens/cart_screen.dart.

  void clearCart() {
    _items.clear();
    notifyListeners();
  }
}
