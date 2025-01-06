import 'package:flutter/material.dart';
import 'menu/daftar_menu.dart'; // Import halaman daftar menu

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
          DaftarMenuPage(), // Hanya menampilkan halaman daftar menu untuk sementara
    );
  }
}
