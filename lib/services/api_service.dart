import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:smart_shop/models/product_model.dart';

class ApiService {
  static const String _baseUrl = 'https://fakestoreapi.com';

  // Fetch Products from API
  Future<List<Product>> getProducts() async {
    try {
      final response = await http.get(Uri.parse('$_baseUrl/products'));

      if (response.statusCode == 200) {
        // If the server returns a 200 OK response, parse the JSON
        List<dynamic> body = json.decode(response.body);
        List<Product> products = body.map((dynamic item) => Product.fromJson(item)).toList();
        return products;
      } else {
        throw Exception('Failed to load products: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching products: $e');
      throw Exception('Failed to fetch products');
    }
  }
}
