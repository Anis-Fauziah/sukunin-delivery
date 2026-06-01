import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {

  static const String baseUrl =
      'http://192.168.1.10/sukunin_api';

  static Future<List<dynamic>>
      getProducts() async {

    final response =
        await http.get(
      Uri.parse(
        '$baseUrl/get_products.php',
      ),
    );

    return jsonDecode(
      response.body,
    );
  }

  static Future<List<dynamic>>
    getProductSizes(
        int productId) async {

  final response =
      await http.get(
    Uri.parse(
      '$baseUrl/get_product_sizes.php?product_id=$productId',
    ),
  );

  return jsonDecode(
    response.body,
  );
}
}