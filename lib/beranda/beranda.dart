import 'package:flutter/material.dart';
import 'package:tugas_akhir_pemesanan_makanan/cart/cart.dart';
import 'package:tugas_akhir_pemesanan_makanan/menu/daftar_menu.dart';
import 'package:tugas_akhir_pemesanan_makanan/riwayat_pesanan/history.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tampilan Beranda',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: BerandaScreen(),
      routes: {
        '/daftarMenu': (context) => DaftarMenuPage(),
        '/keranjang': (context) => ShoppingCartPage(),
        '/riwayat': (context) => RiwayatPemesananPage(),
      },
    );
  }
}

class BerandaScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Bagian Header
            Container(
              padding: EdgeInsets.all(16.0),
              color: Colors.blue[50],
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Selamat Datang!',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Temukan berbagai informasi dan fitur aplikasi di sini.',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),

            // Menu Navigasi
            GridView.count(
              crossAxisCount: 3,
              shrinkWrap: true,
              childAspectRatio: 1.0,
              crossAxisSpacing: 5,
              mainAxisSpacing: 5,
              children: [
          menuItem(context, 'Daftar Menu', Icons.food_bank, '/daftarMenu'),
          menuItem(context, 'Keranjang', Icons.shopping_cart, '/keranjang'),
          menuItem(context, 'Riwayat', Icons.history, '/riwayat'),
              ],
            ),
            SizedBox(height: 20),

            // Konten Tambahan
            Container(
              padding: EdgeInsets.all(16.0),
              color: Colors.blue[50],
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Menu Makanan & Minuman',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Berikut adalah beberapa makanan dan minuman yang dapat anda pilih.',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 10),
                  promocardmenu(
                          expirytext:
                              'Nikmati Lezatnya Cita Rasa Nusantara dengan Semangat Merdeka!',
                          imgurl: 'assets/images/menu/tumpeng.jpg',
                          promoname: 'Promo Hari Kemerdekaan',
                          validitydate: 'Berlaku hingga 31 desember'),
                      promocardmenu(
                          expirytext:
                              'Hangatkan Harimu dengan Hidangan Khas Indonesia!',
                          imgurl: 'assets/images/sushi1.png',
                          promoname: 'Promo Musim Hujan',
                          validitydate: 'Berlaku hingga 31 desember'),
                      promocardmenu(
                          expirytext:
                              'Akhir Pekan Lebih Seru dengan Hidangan Lezat!',
                          imgurl: 'assets/images/sushi1.png',
                          promoname: 'Promo Weekend Spesial',
                          validitydate: 'Berlaku hingga 31 desember'),


                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget untuk membuat menu item di GridView
   Widget menuItem(BuildContext context, String title, IconData icon, String route) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: () {
        // Navigate to the respective route when an item is clicked
        Navigator.pushNamed(context, route);
      },
    );
  }
}



class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  @override
  _CustomAppBarState createState() => _CustomAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight); // Standard AppBar height
}

class _CustomAppBarState extends State<CustomAppBar> {
  bool _isSearching = false;
  TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        children: [
          // Title "Beranda" on the left
          Text('Beranda'),
          // Spacer to push search box towards the center
          Spacer(),
          // Search Box
          if (_isSearching) 
            Container(
              width: 200, // Set width of the search box
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search), // Search icon inside the text field
                  hintText: 'Cari...',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: const Color.fromARGB(255, 255, 255, 255),
                ),
                style: TextStyle(color: Colors.black),
                autofocus: true,
              ),
            ),
          // Notification Icon on the right
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              // Action for notification
              print('Notifikasi');
            },
          ),
        ],
      ),
      actions: [
        IconButton(
          icon: Icon(_isSearching ? Icons.cancel : Icons.search),
          onPressed: () {
            setState(() {
              if (_isSearching) {
                _isSearching = false;
                _searchController.clear(); // Clear search text
              } else {
                _isSearching = true;
              }
            });
          },
        ),
      ],
    );
  }
}

class promocardmenu extends StatelessWidget {
  final String expirytext;
  final String imgurl;
  final String promoname;
  final String validitydate;
  const promocardmenu({
    required this.expirytext,
    required this.imgurl,
    required this.promoname,
    required this.validitydate,
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width * 0.9;
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DaftarMenuPage(),
          ),
        );
      },
      child: Center(
        child: Container(
          width: screenWidth,
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                expirytext,
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Image.asset(
                imgurl,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
              SizedBox(height: 8),
              Text(
                promoname,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 4),
              Text(
                validitydate,
                style: TextStyle(
                  color: Colors.grey,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}