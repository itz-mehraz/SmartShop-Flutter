// lib/widgets/app_drawer.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_shop/providers/auth_provider.dart';
import 'package:smart_shop/providers/theme_provider.dart';
import 'package:smart_shop/screens/auth/login_screen.dart';
import 'package:smart_shop/screens/cart/cart_screen.dart';
import 'package:smart_shop/screens/favorites/favorites_screen.dart';
import 'package:smart_shop/screens/home/home_screen.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.blue),
            child: Text('Smart Shop', style: TextStyle(color: Colors.white, fontSize: 24)),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () => Navigator.of(context).pushReplacementNamed(HomeScreen.routeName),
          ),
          ListTile(
            leading: const Icon(Icons.shopping_cart),
            title: const Text('Cart'),
            onTap: () => Navigator.of(context).pushNamed(CartScreen.routeName),
          ),
          ListTile(
            leading: const Icon(Icons.favorite),
            title: const Text('Favorites'),
            onTap: () => Navigator.of(context).pushNamed(FavoritesScreen.routeName),
          ),
          const Divider(),
          Consumer<ThemeProvider>(
            builder: (context, themeProvider, child) => ListTile(
              leading: Icon(themeProvider.isDarkMode ? Icons.dark_mode : Icons.light_mode),
              title: const Text('Toggle Theme'),
              trailing: Switch(
                value: themeProvider.isDarkMode,
                onChanged: (value) => themeProvider.toggleTheme(),
              ),
            ),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Logout'),
            onTap: () {
              Provider.of<AuthProvider>(context, listen: false).logout();
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => const LoginScreen()),
                    (Route<dynamic> route) => false,
              );
            },
          ),
        ],
      ),
    );
  }
}