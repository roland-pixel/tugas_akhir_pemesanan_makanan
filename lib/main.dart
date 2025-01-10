import 'package:flutter/material.dart';
import 'menu/daftar_menu.dart'; // Import halaman daftar menu\
import 'cart/cart.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:
          ShoppingCartPage()
    );
  }
}
