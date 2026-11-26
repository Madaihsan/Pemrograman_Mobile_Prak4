import 'package:get/get.dart';
import '../models/item.dart';

class CartController extends GetxController {
  // Daftar item reaktif menggunakan .obs
  final RxList<Item> items = <Item>[].obs;

  int get totalPrice => items.fold(0, (sum, item) => sum + item.price);

  void addItem(Item item) {
    items.add(item);
  }

  void removeItem(Item item) {
    items.remove(item);
  }

  void clearCart() {
    items.clear();
  }
}
