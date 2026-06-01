import 'package:flutter/material.dart';

class OrderProvider extends ChangeNotifier {

  final List<Map<String, dynamic>>
      orders = [];

  void addOrder({
    required List<Map<String, dynamic>>
        items,
    required int total,
  }) {

    orders.insert(0, {
      'id':
          DateTime.now()
              .millisecondsSinceEpoch,

      'items': items,

      'total': total,

      'status': 'Diproses',

      'payment': 'COD',

      'date':
          DateTime.now(),
    });

    notifyListeners();
  }
}