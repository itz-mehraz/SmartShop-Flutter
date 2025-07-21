import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_shop/models/product_model.dart';

class FavoritesProvider with ChangeNotifier {
  static const FAVORITES_KEY = "favorites_key";
  List<Product> _favoriteProducts = [];
  List<int> _favoriteProductIds = [];

  List<Product> get favoriteProducts => _favoriteProducts;

  FavoritesProvider() {
    _loadFavorites();
  }

  bool isFavorite(int productId) {
    return _favoriteProductIds.contains(productId);
  }

  void toggleFavorite(Product product) {
    if (isFavorite(product.id)) {
      _favoriteProducts.removeWhere((p) => p.id == product.id);
      _favoriteProductIds.remove(product.id);
    } else {
      _favoriteProducts.add(product);
      _favoriteProductIds.add(product.id);
    }
    _saveFavorites();
    notifyListeners();
  }

  void _loadFavorites() async {
    // This is a simplified load. In a real app, you would fetch full product details
    // based on the saved IDs, perhaps from a local DB or by re-fetching.
    // For this project, we just keep the IDs to check the favorite status.
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> favIdStrings = prefs.getStringList(FAVORITES_KEY) ?? [];
    _favoriteProductIds = favIdStrings.map((id) => int.parse(id)).toList();
    notifyListeners();
  }

  void _saveFavorites() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> favIdStrings = _favoriteProductIds.map((id) => id.toString()).toList();
    await prefs.setStringList(FAVORITES_KEY, favIdStrings);
  }
}