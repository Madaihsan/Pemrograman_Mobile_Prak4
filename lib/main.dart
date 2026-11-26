import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controllers/cart_controller.dart';
import 'screens/cart_screen.dart';
import 'screens/catalog_screen.dart';

void main() {
  // Daftarkan CartController secara global menggunakan GetX Dependency Injection
  Get.put(CartController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'State Management (GetX)',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorSchemeSeed: Colors.blue),
      home: const CatalogScreen(),
      routes: {
        '/cart': (context) => const CartScreen(),
      },
    );
  }
}
