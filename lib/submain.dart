import 'package:flutter/material.dart';
import 'beranda/beranda.dart';
import 'menu/daftar_menu.dart';
import 'account/account.dart';

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
  int _currentIndex = 1; // Indeks halaman aktif

  // Daftar halaman
  final List<Widget> _pages = [
    DaftarMenuPage(),
    BerandaScreen(), // Halaman Home
    HomePage(), // Halaman Account
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
      padding: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        color: const Color(0xFFD32F2F), // Warna utama navbar menjadi merah
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            blurRadius: 12,
            offset: Offset(0, -4), // Bayangan lebih besar
          ),
        ],
        // borderRadius: const BorderRadius.only(
        //   topLeft: Radius.circular(20),
        //   topRight: Radius.circular(20),
        // ), // Sudut melingkar
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem(
            icon: Icons.food_bank,
            index: 0,
            isSelected: currentIndex == 0,
          ),
          _buildHomeNavItem(
            icon: Icons.home,
            index: 1,
            isSelected: currentIndex == 1,
          ),
          _buildNavItem(
            icon: Icons.person,
            index: 2,
            isSelected: currentIndex == 2,
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem({
    required IconData icon,
    required int index,
    required bool isSelected,
  }) {
    return Flexible(
      child: GestureDetector(
        onTap: () => onItemSelected(index),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.all(2),
          decoration: BoxDecoration(
            color:
                isSelected ? Colors.white.withOpacity(0.2) : Colors.transparent,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(
            icon,
            size: isSelected ? 30 : 25, // Ukuran ikon aktif lebih besar
            color: isSelected ? Colors.white : Colors.black, // Warna aktif
          ),
        ),
      ),
    );
  }

  Widget _buildHomeNavItem({
    required IconData icon,
    required int index,
    required bool isSelected,
  }) {
    return Flexible(
      child: GestureDetector(
        onTap: () => onItemSelected(index),
        child: Container(
          height: 70, // Sesuaikan dengan tinggi navbar
          width: 70, // Sesuaikan dengan lebar navbar
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.black,
          ),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            child: Icon(
              icon,
              size: isSelected ? 28 : 24, // Ukuran ikon aktif lebih besar
              color: Colors.red, // Warna ikon tetap putih
            ),
          ),
        ),
      ),
    );
  }
}
