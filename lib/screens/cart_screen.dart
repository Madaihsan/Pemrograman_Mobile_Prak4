// Langkah 6 — Halaman Keranjang
// Halaman ini harus bereaksi saat data berubah, sehingga memakai Consumer.
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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
          final rupiah = NumberFormat.currency(
            locale: 'id_ID',
            symbol: 'Rp ',
            decimalDigits: 0,
          );
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
                            // Tugas 3: Format Rupiah tiap item.
                            subtitle: Text(rupiah.format(item.price)),
                            // Tugas 1b: Hapus per item — bagian tampilan.
                            trailing: IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () {
                                cart.removeItem(item);
                              },
                            ),
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
                      // Tugas 3: Format Rupiah untuk total harga.
                      'Total: ${rupiah.format(cart.totalPrice)}',
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
