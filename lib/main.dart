import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:tugas_akhir_pemesanan_makanan/login/login.dart';
import 'package:tugas_akhir_pemesanan_makanan/submain.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToStartup();
  }

  void _navigateToStartup() async {
    await Future.delayed(Duration(seconds: 3)); // Durasi animasi loading
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => StartupPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFD32F2F), Colors.white], // Gradien merah-putih
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset(
                'assets/loading.json',
                width: 250,
                height: 250,
                fit: BoxFit.contain,
              ),
              SizedBox(height: 20),
              Text(
                'Loading, please wait...',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class StartupPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFD32F2F), Colors.white], // Gradien merah-putih
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Gambar/logo aplikasi
              Image.asset(
                'assets/images/kidnapp_logo.png', // Sesuaikan dengan path gambar Anda
                width: 180,
                height: 180,
              ),
              SizedBox(height: 20),
              // Judul aplikasi
              Text(
                'Selamat Datang di KidNapp',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black, // Warna hitam untuk teks judul
                  letterSpacing: 1.2,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),
              // Subjudul/deskripsi singkat
              Text(
                'Aplikasi Pemesanan Makanan Terbaik!',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.black87, // Warna hitam lembut untuk subjudul
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 30),
              // Tombol mulai aplikasi
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SplashScreen1()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black, // Warna tombol hitam
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(30), // Tombol melengkung
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  elevation: 5, // Efek bayangan
                ),
                child: Text(
                  'Mulai Aplikasi',
                  style: TextStyle(
                    color: Colors.white, // Warna teks putih pada tombol
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 20),
              // Teks hak cipta atau info tambahan
              Text(
                '© 2025 KidNapp App',
                style: TextStyle(
                  color: Colors.black54, // Warna teks hak cipta hitam
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SplashScreen1 extends StatefulWidget {
  @override
  _SplashScreen1State createState() => _SplashScreen1State();
}

class _SplashScreen1State extends State<SplashScreen1> {
  @override
  void initState() {
    super.initState();
    _navigateToStartup();
  }

  void _navigateToStartup() async {
    await Future.delayed(Duration(seconds: 3)); // Durasi animasi loading
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFD32F2F), Colors.white], // Gradien merah-putih
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset(
                'assets/loading.json',
                width: 250,
                height: 250,
                fit: BoxFit.contain,
              ),
              SizedBox(height: 20),
              Text(
                'Loading, please wait...',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
