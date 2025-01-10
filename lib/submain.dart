import 'package:flutter/material.dart';
import 'beranda/beranda.dart';
import 'menu/daftar_menu.dart';
import 'riwayat_pesanan/history.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0; // Indeks halaman aktif

  // Daftar halaman
  final List<Widget> _pages = [
    BerandaScreen(), // Halaman Home
    DaftarMenuPage(),
    RiwayatPemesananPage(), // Halaman Account
  ];

  // Fungsi untuk mengganti halaman
  void _onNavItemSelected(int index) {
    setState(() {
      _currentIndex = index; // Ganti indeks aktif
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex], // Tampilkan halaman aktif
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _currentIndex,
        onItemSelected: _onNavItemSelected, // Tangkap event dari navbar
      ),
    );
  }
}

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onItemSelected;

  const CustomBottomNavBar({
    Key? key,
    required this.currentIndex,
    required this.onItemSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      decoration: BoxDecoration(
        color: const Color(0xFFD32F2F), // Warna utama navbar
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: Offset(0, -2), // Bayangan ke atas
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem(
            icon: Icons.home,
            index: 0,
            label: 'Home',
            isSelected: currentIndex == 0,
          ),
          _buildNavItem(
            icon: Icons.food_bank,
            index: 1,
            label: 'menu',
            isSelected: currentIndex == 1,
          ),
          _buildNavItem(
            icon: Icons.person,
            index: 2,
            label: 'Account',
            isSelected: currentIndex == 2,
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem({
    required IconData icon,
    required int index,
    required String label,
    required bool isSelected,
  }) {
    return GestureDetector(
      onTap: () => onItemSelected(index), // Panggil callback untuk navigasi
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: isSelected ? 28 : 24, // Ukuran ikon aktif lebih besar
            color: isSelected ? Colors.white : Colors.black54, // Warna aktif
          ),
          Text(
            label,
            style: TextStyle(
              fontSize: isSelected ? 14 : 12, // Ukuran teks aktif lebih besar
              color: isSelected ? Colors.white : Colors.black54, // Warna teks
            ),
          ),
        ],
      ),
    );
  }
}
