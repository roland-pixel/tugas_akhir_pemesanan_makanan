import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DaftarMenuPage(),
    );
  }
}

class DaftarMenuPage extends StatelessWidget {
  const DaftarMenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Row(
          children: [
            Image.asset(
              'assets/images/logo_mcd.png',
              width: 40,
              height: 40,
            ),
            const SizedBox(width: 10),
            const Text(
              'MyM',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.yellow,
              ),
            ),
            const Spacer(),
            const Text(
              '0 poin',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
            const Icon(Icons.arrow_forward_ios),
          ],
        ),
      ), // Panggil fungsi AppBar
    );
  }
}
