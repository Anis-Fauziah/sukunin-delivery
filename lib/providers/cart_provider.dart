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

    int existingIndex =
        cartItems.indexWhere(
      (item) =>
          item['product']['id']
              .toString() ==
          product['id'].toString() &&
          item['size'] == size,
    );

    if (existingIndex != -1) {

      cartItems[existingIndex]
          ['quantity'] += quantity;

    } else {

      cartItems.add({
        'product': product,
        'size': size,
        'quantity': quantity,
        'price': price,
        'isSelected': true,
      });
    }

    notifyListeners();
  }

  void toggleSelection(int index) {

    cartItems[index]['isSelected'] =
        !cartItems[index]['isSelected'];

    notifyListeners();
  }

  void increaseQuantity(int index) {

    cartItems[index]['quantity']++;

    notifyListeners();
  }

  void decreaseQuantity(int index) {

    if (cartItems[index]['quantity'] > 1) {

      cartItems[index]['quantity']--;

      notifyListeners();
    }
  }

  void removeItem(int index) {

    cartItems.removeAt(index);

    notifyListeners();
  }

  void checkoutSelectedItems() {

    final itemsToRemove =
        cartItems
            .where(
              (item) =>
                  item['isSelected'] ==
                  true,
            )
            .toList();

    for (var item in itemsToRemove) {
      cartItems.remove(item);
    }

    notifyListeners();
  }

  void clearCart() {

    cartItems.clear();

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