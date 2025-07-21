import 'package:flutter/material.dart';
import 'package:smart_shop/models/product_model.dart';
import 'package:smart_shop/services/api_service.dart';

class ProductProvider with ChangeNotifier {
  List<Product> _products = [];
  bool _isLoading = false;

  List<Product> get products => _products;
  bool get isLoading => _isLoading;

  // Fetch Products from API
  Future<void> fetchProducts() async {
    _isLoading = true;
    notifyListeners();
    try {
      // Fetch data from API using the ApiService
      List<Product> fetchedProducts = await ApiService().getProducts();
      _products = fetchedProducts;  // Update the products list with fetched data
    } catch (error) {
      print('Error fetching products: $error');
      _products = [];  // Set products to an empty list in case of error
    }
    _isLoading = false;
    notifyListeners();
  }

  // Sort products by price in ascending order
  void sortProductsByPriceAsc() {
    _products.sort((a, b) => a.price.compareTo(b.price));
    notifyListeners();
  }

  // Sort products by price in descending order
  void sortProductsByPriceDesc() {
    _products.sort((a, b) => b.price.compareTo(a.price));
    notifyListeners();
  }

  // Sort products by rating
  void sortProductsByRating() {
    _products.sort((a, b) => b.rating.rate.compareTo(a.rating.rate));
    notifyListeners();
  }
}
