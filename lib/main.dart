// lib/main.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_shop/providers/auth_provider.dart';
import 'package:smart_shop/providers/cart_provider.dart';
import 'package:smart_shop/providers/favorites_provider.dart';
import 'package:smart_shop/providers/product_provider.dart';
import 'package:smart_shop/providers/theme_provider.dart';
import 'package:smart_shop/screens/splash_screen.dart';
import 'package:smart_shop/utils/app_routes.dart';
import 'package:smart_shop/utils/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => ProductProvider()),
        ChangeNotifierProvider(create: (_) => CartProvider()),
        ChangeNotifierProvider(create: (_) => FavoritesProvider()),
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp(
            title: 'Smart Shop',
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: themeProvider.isDarkMode ? ThemeMode.dark : ThemeMode.light,
            home: const SplashScreen(),
            routes: AppRoutes.routes,
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}