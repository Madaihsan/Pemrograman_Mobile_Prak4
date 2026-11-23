import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import 'package:state_management_demo/main.dart';
import 'package:state_management_demo/providers/cart_provider.dart';

void main() {
  testWidgets('Tambah barang lalu checkout mengosongkan keranjang',
      (tester) async {
    await tester.pumpWidget(ChangeNotifierProvider(
      create: (_) => CartProvider(),
      child: const MyApp(),
    ));

    await tester.tap(find.byIcon(Icons.add).first); // tambah Laptop
    await tester.pumpAndSettle(); // animasi SnackBar muncul
    await tester.pump(const Duration(seconds: 5)); // tunggu SnackBar hilang
    await tester.pumpAndSettle();
    await tester.tap(find.byIcon(Icons.shopping_cart));
    await tester.pumpAndSettle();

    expect(find.text('Laptop'), findsOneWidget);
    await tester.tap(find.text('Checkout'));
    await tester.pump();
    expect(find.text('Keranjang kosong'), findsOneWidget);
  });

  // TODO(Opsional): setelah Tugas 1 selesai, tambahkan test untuk removeItem.
  // Contoh: tambah 1 barang, buka keranjang, tap Icons.delete,
  // lalu pastikan teks 'Keranjang kosong' muncul.
}
