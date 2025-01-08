import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatefulWidget {
  final Function(int) onItemSelected;

  const CustomBottomNavBar({Key? key, required this.onItemSelected})
      : super(key: key);

  @override
  _CustomBottomNavBarState createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar>
    with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;

  void _onTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
    widget.onItemSelected(index);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      decoration: BoxDecoration(
        color: const Color(
            0xFFD32F2F), // Warna utama navbar (hijau seperti gambar)

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
          _buildNavItem(icon: Icons.food_bank, index: 0),
          _buildNavItem(icon: Icons.shopping_cart, index: 1),
          _buildCenterNavItem(
              icon: Icons.home, index: 2), // Ikon Home di tengah
          _buildNavItem(icon: Icons.history, index: 3),
          _buildNavItem(icon: Icons.person, index: 4),
        ],
      ),
    );
  }

  Widget _buildNavItem({
    required IconData icon,
    required int index,
  }) {
    final bool isSelected = _selectedIndex == index;

    return GestureDetector(
      onTap: () => _onTap(index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        padding: const EdgeInsets.all(8),
        decoration: isSelected
            ? BoxDecoration(
                color: Colors.white.withOpacity(0.2), // Warna highlight
                borderRadius: BorderRadius.circular(30),
              )
            : null,
        child: Icon(
          icon,
          size: isSelected ? 32 : 28, // Ukuran lebih besar saat dipilih
          color: isSelected ? Colors.white : Colors.black, // Warna aktif/pasif
        ),
      ),
    );
  }

  Widget _buildCenterNavItem({
    required IconData icon,
    required int index,
  }) {
    final bool isSelected = _selectedIndex == index;

    return GestureDetector(
      onTap: () => _onTap(index),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: 70,
            width: 70,
            decoration: BoxDecoration(
              color: Colors.black, // Warna background lingkaran
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  offset: Offset(0, 3), // Bayangan ke bawah
                ),
              ],
            ),
          ),
          Icon(
            icon,
            size: 36, // Ukuran ikon lebih besar untuk Home
            color: isSelected
                ? const Color(0xFFD32F2F)
                : Colors
                    .white, // Warna hijau untuk aktif, hitam untuk tidak aktif
          ),
        ],
      ),
    );
  }
}
