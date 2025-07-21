import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_shop/providers/cart_provider.dart';
import 'package:smart_shop/providers/product_provider.dart';
import 'package:smart_shop/screens/cart/cart_screen.dart';
import 'package:smart_shop/widgets/app_drawer.dart';
import 'package:smart_shop/widgets/product_card.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _sortOption = 'Price Low to High';

  @override
  void initState() {
    super.initState();
    // Fetch products when the screen loads
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<ProductProvider>(context, listen: false).fetchProducts();
    });
  }

  // Method to handle sorting
  void _sortProducts(String sortOption, ProductProvider productProvider) {
    setState(() {
      _sortOption = sortOption;
    });

    if (sortOption == 'Price Low to High') {
      productProvider.sortProductsByPriceAsc();
    } else if (sortOption == 'Price High to Low') {
      productProvider.sortProductsByPriceDesc();
    } else if (sortOption == 'Rating') {
      productProvider.sortProductsByRating();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Smart Shop'),
        actions: [
          // Cart Badge
          Consumer<CartProvider>(
            builder: (context, cart, child) => badges.Badge(
              position: badges.BadgePosition.topEnd(top: 0, end: 3),
              badgeContent: Text(cart.itemCount.toString(), style: const TextStyle(color: Colors.white)),
              child: IconButton(
                icon: const Icon(Icons.shopping_cart),
                onPressed: () => Navigator.of(context).pushNamed(CartScreen.routeName),
              ),
            ),
          ),
        ],
      ),
      drawer: const AppDrawer(),
      body: Consumer<ProductProvider>(
        builder: (context, productProvider, child) {
          if (productProvider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (productProvider.products.isEmpty) {
            return const Center(child: Text("No products found."));
          }
          return RefreshIndicator(
            onRefresh: () => productProvider.fetchProducts(),
            child: Column(
              children: [
                // Sort options Row
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Sort By:',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      DropdownButton<String>(
                        value: _sortOption,
                        icon: const Icon(Icons.sort),
                        onChanged: (String? newValue) {
                          if (newValue != null) {
                            _sortProducts(newValue, productProvider);
                          }
                        },
                        items: <String>[
                          'Price Low to High',
                          'Price High to Low',
                          'Rating',
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ),
                // Product grid view
                Expanded(
                  child: GridView.builder(
                    padding: const EdgeInsets.all(10.0),
                    itemCount: productProvider.products.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 2 / 3,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemBuilder: (ctx, i) => ProductCard(product: productProvider.products[i]),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
