import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_shop/providers/cart_provider.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/cart';
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    final cartItems = cart.items.values.toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Cart'),
      ),
      body: Column(
        children: <Widget>[
          Card(
            margin: const EdgeInsets.all(15),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  const Text('Total', style: TextStyle(fontSize: 20)),
                  const Spacer(),
                  Chip(
                    label: Text(
                      '\$${cart.totalPrice.toStringAsFixed(2)}',
                      style: TextStyle(
                        color: Theme.of(context).primaryTextTheme.titleLarge?.color,
                      ),
                    ),
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                  TextButton(
                    child: const Text('ORDER NOW'),
                    onPressed: () {
                      // Implement order logic
                    },
                  )
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: cartItems.isEmpty
                ? const Center(child: Text("Your cart is empty."))
                : ListView.builder(
              itemCount: cart.itemCount,
              itemBuilder: (ctx, i) => ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(cartItems[i].image),
                ),
                title: Text(cartItems[i].title),
                subtitle: Text('Total: \$${(cartItems[i].price).toStringAsFixed(2)}'),
                trailing: IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red),
                  onPressed: () {
                    cart.removeItem(cartItems[i].id);
                  },
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}