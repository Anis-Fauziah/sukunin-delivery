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
}