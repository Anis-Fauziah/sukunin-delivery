import 'package:flutter/material.dart';
import '../services/api_service.dart';

class ProductProvider extends ChangeNotifier {
  List<dynamic> products = [];

  bool isLoading = false;

  Future<void> fetchProducts() async {
    try {
      isLoading = true;
      notifyListeners();

      products = await ApiService.getProducts();

      isLoading = false;
      notifyListeners();
    } catch (e) {
      isLoading = false;
      notifyListeners();

      debugPrint('Error: $e');
    }
  }
}