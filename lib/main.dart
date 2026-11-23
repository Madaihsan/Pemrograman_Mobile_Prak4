// Langkah 4 — Mendaftarkan Provider
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/cart_provider.dart';
import 'screens/cart_screen.dart';
import 'screens/catalog_screen.dart';

void main() {
  runApp(
    // Bungkus aplikasi agar CartProvider bisa diakses dari semua halaman.
    ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'State Management',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorSchemeSeed: Colors.blue),
      home: const CatalogScreen(),
      routes: {
        '/cart': (context) => const CartScreen(),
      },
    );
  }
}

// TODO(Tugas 4 - nilai tambahan): Refactoring challenge.
// Buat ulang aplikasi yang sama dengan Riverpod, Bloc, atau GetX
// (sebaiknya di branch/proyek terpisah), lalu bandingkan di laporan.
