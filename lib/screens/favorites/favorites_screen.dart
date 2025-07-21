import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_shop/providers/favorites_provider.dart';
import 'package:smart_shop/widgets/product_card.dart';

class FavoritesScreen extends StatelessWidget {
  static const routeName = '/favorites';
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final favoritesProvider = Provider.of<FavoritesProvider>(context);
    final favoriteProducts = favoritesProvider.favoriteProducts;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Favorites'),
      ),
      body: favoriteProducts.isEmpty
          ? const Center(
        child: Text('You have no favorites yet!'),
      )
          : GridView.builder(
        padding: const EdgeInsets.all(10.0),
        itemCount: favoriteProducts.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2 / 3,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (ctx, i) => ProductCard(product: favoriteProducts[i]),
      ),
    );
  }
}