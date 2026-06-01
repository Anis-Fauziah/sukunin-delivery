import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {

  final List<Map<String, dynamic>>
      cartItems = [];

  void addToCart(
    Map product,
    String size,
    int quantity,
    int price,
  ) {

    cartItems.add({
      'product': product,
      'size': size,
      'quantity': quantity,
      'price': price,
      'isSelected': true,
    });

    notifyListeners();
  }

  void toggleSelection(int index) {

    cartItems[index]['isSelected'] =
        !cartItems[index]['isSelected'];

    notifyListeners();
  }

  void removeItem(int index) {

    cartItems.removeAt(index);

    notifyListeners();
  }

  int get totalPrice {

    int total = 0;

    for (var item in cartItems) {

      if (item['isSelected']) {

        total +=
            (item['price'] as int) *
            (item['quantity'] as int);
      }
    }

    return total;
  }

  int get selectedCount {

    int count = 0;

    for (var item in cartItems) {

      if (item['isSelected']) {
        count++;
      }
    }

    return count;
  }
}