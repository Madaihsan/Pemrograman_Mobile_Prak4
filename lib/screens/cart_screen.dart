import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../controllers/cart_controller.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final CartController cartController = Get.find<CartController>();
    final rupiah = NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp ',
      decimalDigits: 0,
    );

    return Scaffold(
      appBar: AppBar(title: const Text('Keranjang Saya (GetX)')),
      body: Obx(
        () => Column(
          children: [
            Expanded(
              child: cartController.items.isEmpty
                  ? const Center(child: Text('Keranjang kosong'))
                  : ListView.builder(
                      itemCount: cartController.items.length,
                      itemBuilder: (context, index) {
                        final item = cartController.items[index];
                        return ListTile(
                          title: Text(item.name),
                          subtitle: Text(rupiah.format(item.price)),
                          trailing: IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () {
                              cartController.removeItem(item);
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
                    'Total: ${rupiah.format(cartController.totalPrice)}',
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  FilledButton(
                    onPressed: cartController.items.isEmpty
                        ? null
                        : cartController.clearCart,
                    child: const Text('Checkout'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
