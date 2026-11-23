// Langkah 6 — Halaman Keranjang
// Halaman ini harus bereaksi saat data berubah, sehingga memakai Consumer.
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/cart_provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Keranjang Saya')),
      body: Consumer<CartProvider>(
        builder: (context, cart, child) {
          return Column(
            children: [
              Expanded(
                child: cart.items.isEmpty
                    ? const Center(child: Text('Keranjang kosong'))
                    : ListView.builder(
                        itemCount: cart.items.length,
                        itemBuilder: (context, index) {
                          final item = cart.items[index];
                          return ListTile(
                            title: Text(item.name),
                            // TODO(Tugas 3 - wajib): Format Rupiah (sama seperti di Katalog).
                            subtitle: Text('Rp ${item.price}'),
                            // TODO(Tugas 1b - wajib): Hapus per item — bagian tampilan.
                            // Tambahkan properti trailing berupa IconButton dengan
                            // ikon tempat sampah (Icons.delete) yang memanggil
                            // cart.removeItem(item). Selesai jika item hilang dari
                            // daftar dan total harga ikut berkurang.
                          );
                        },
                      ),
              ),
              Container(
                padding: const EdgeInsets.all(16),
                color: Theme.of(context).colorScheme.surfaceContainerHighest,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      // TODO(Tugas 3 - wajib): Format Rupiah untuk total harga.
                      'Total: Rp ${cart.totalPrice}',
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    FilledButton(
                      onPressed: cart.items.isEmpty ? null : cart.clearCart,
                      child: const Text('Checkout'),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
