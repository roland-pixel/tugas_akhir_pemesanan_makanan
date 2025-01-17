import 'package:flutter/material.dart';
import 'package:tugas_akhir_pemesanan_makanan/submain.dart';

void main() {
  runApp(const LoginApp());
}

class LoginApp extends StatelessWidget {
  const LoginApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const LoginScreen(),
    );
  }
}

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF5F5), // Warna latar putih lembut
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Log In",
              style: TextStyle(
                fontSize: 34,
                fontWeight: FontWeight.bold,
                color: Color(0xFFD32F2F), // Merah Indonesia
              ),
            ),
            const SizedBox(height: 40),
            const TextField(
              style: TextStyle(color: Color(0xFFD32F2F)),
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.person, color: Color(0xFFD32F2F)),
                hintText: "Username",
                hintStyle: TextStyle(color: Colors.grey),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFFD32F2F)),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const TextField(
              obscureText: true,
              style: TextStyle(color: Color(0xFFD32F2F)),
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.lock, color: Color(0xFFD32F2F)),
                hintText: "Password",
                hintStyle: TextStyle(color: Colors.grey),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFFD32F2F)),
                ),
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "Incorrect password.",
              style: TextStyle(color: Color(0xFFD32F2F), fontSize: 14),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MainScreen(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFD32F2F), // Merah Indonesia
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Center(
                child: Text(
                  "Log in",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: TextButton(
                onPressed: () {
                  // Action untuk tombol Sign up
                },
                child: const Text(
                  "First time here? Sign up.",
                  style: TextStyle(color: Color(0xFFD32F2F)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
