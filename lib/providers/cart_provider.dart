import 'package:flutter/material.dart';
import 'package:smart_shop/models/product_model.dart';

class CartProvider with ChangeNotifier {
  final Map<int, Product> _items = {};

  Map<int, Product> get items => {..._items};

  int get itemCount => _items.length;

  double get totalPrice {
    var total = 0.0;
    _items.forEach((key, cartItem) {
      total += cartItem.price;
    });
    return total;
  }

  void addItem(Product product) {
    _items[product.id] = product;
    notifyListeners();
  }

  void removeItem(int productId) {
    _items.remove(productId);
    notifyListeners();
  }

  void clearCart() {
    _items.clear();
    notifyListeners();
  }
}