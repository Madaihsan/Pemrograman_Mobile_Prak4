import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:state_management_demo/controllers/cart_controller.dart';
import 'package:state_management_demo/main.dart';

void main() {
  testWidgets('Tambah barang lalu checkout mengosongkan keranjang (GetX)',
      (tester) async {
    Get.reset();
    Get.put(CartController());

    await tester.pumpWidget(const MyApp());

    await tester.tap(find.byIcon(Icons.add).first); // tambah Laptop
    await tester.pumpAndSettle(); // animasi SnackBar muncul
    await tester.pump(const Duration(seconds: 5)); // tunggu SnackBar hilang
    await tester.pumpAndSettle();
    await tester.tap(find.byIcon(Icons.shopping_cart));
    await tester.pumpAndSettle();

    expect(find.text('Laptop'), findsOneWidget);
    await tester.tap(find.text('Checkout'));
    await tester.pumpAndSettle();
    expect(find.text('Keranjang kosong'), findsOneWidget);
  });
}
