import 'package:flutter/widgets.dart';
import 'package:smart_shop/screens/auth/login_screen.dart';
import 'package:smart_shop/screens/cart/cart_screen.dart';
import 'package:smart_shop/screens/favorites/favorites_screen.dart';
import 'package:smart_shop/screens/home/home_screen.dart';

class AppRoutes {
  static final Map<String, WidgetBuilder> routes = {
    LoginScreen.routeName: (ctx) => const LoginScreen(),
    HomeScreen.routeName: (ctx) => const HomeScreen(),
    CartScreen.routeName: (ctx) => const CartScreen(),
    FavoritesScreen.routeName: (ctx) => const FavoritesScreen(),
  };
}