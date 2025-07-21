// lib/widgets/product_card.dart
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';
import 'package:smart_shop/models/product_model.dart';
import 'package:smart_shop/providers/cart_provider.dart';
import 'package:smart_shop/providers/favorites_provider.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context, listen: false);
    final favProvider = Provider.of<FavoritesProvider>(context);

    return Card(
      elevation: 4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Stack(
              children: [
                Image.network(product.image, fit: BoxFit.contain, width: double.infinity),
                Positioned(
                  top: 5,
                  right: 5,
                  child: IconButton(
                    icon: Icon(
                      favProvider.isFavorite(product.id) ? Icons.favorite : Icons.favorite_border,
                      color: Colors.red,
                    ),
                    onPressed: () {
                      favProvider.toggleFavorite(product);
                    },
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(product.title, maxLines: 2, overflow: TextOverflow.ellipsis),
                const SizedBox(height: 4),
                Text('\$${product.price.toStringAsFixed(2)}', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                const SizedBox(height: 4),
                RatingBarIndicator(
                  rating: product.rating.rate,
                  itemBuilder: (context, index) => const Icon(Icons.star, color: Colors.amber),
                  itemCount: 5,
                  itemSize: 16.0,
                  direction: Axis.horizontal,
                ),
                ElevatedButton(
                  onPressed: () {
                    cartProvider.addItem(product);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('${product.title} added to cart!'), duration: const Duration(seconds: 1)),
                    );
                  },
                  child: const Text('Add to Cart'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}