import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../controllers/cart_controller.dart';
import '../models/item.dart';

class CatalogScreen extends StatelessWidget {
  const CatalogScreen({super.key});

  static const List<Item> catalog = [
    Item(name: 'Laptop', price: 10000000),
    Item(name: 'Mouse', price: 200000),
    Item(name: 'Keyboard', price: 500000),
  ];

  @override
  Widget build(BuildContext context) {
    final CartController cartController = Get.find<CartController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Katalog Barang (GetX)'),
        actions: [
          // Badge reaktif menggunakan Obx dari GetX
          Obx(
            () => IconButton(
              onPressed: () => Navigator.pushNamed(context, '/cart'),
              icon: Badge(
                isLabelVisible: cartController.items.isNotEmpty,
                label: Text('${cartController.items.length}'),
                child: const Icon(Icons.shopping_cart),
              ),
            ),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: catalog.length,
        itemBuilder: (context, index) {
          final item = catalog[index];
          return ListTile(
            title: Text(item.name),
            subtitle: Text(
              NumberFormat.currency(
                locale: 'id_ID',
                symbol: 'Rp ',
                decimalDigits: 0,
              ).format(item.price),
            ),
            trailing: IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                cartController.addItem(item);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('${item.name} ditambahkan!')),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
