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
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
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
              color: const Color.fromARGB(255, 214, 75, 65 ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Selamat Datang!',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Temukan berbagai informasi dan fitur aplikasi di sini.',
                    style: TextStyle(fontSize: 16, color: Colors.white),
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
                MenuItem(title: 'Daftar Menu', icon: Icons.food_bank, route: '/daftarMenu'),
                MenuItem(title: 'Keranjang', icon: Icons.shopping_cart, route: '/keranjang'),
                MenuItem(title: 'Riwayat', icon: Icons.history, route: '/riwayat'),
              ],
            ),
            SizedBox(height: 20),

            // Konten Tambahan
            Container(
              padding: EdgeInsets.all(16.0),
              color: Colors.red[50],
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
                    expirytext: 'Nikmati Lezatnya Cita Rasa Nusantara dengan Semangat Merdeka!',
                    imgurl: 'assets/images/menu/tumpeng.jpg',
                    promoname: 'Promo Hari Kemerdekaan',
                    validitydate: 'Berlaku hingga 31 desember',
                  ),
                  promocardmenu(
                    expirytext: 'Hangatkan Harimu dengan Hidangan Khas Indonesia!',
                    imgurl: 'assets/images/sushi1.png',
                    promoname: 'Promo Musim Hujan',
                    validitydate: 'Berlaku hingga 31 desember',
                  ),
                  promocardmenu(
                    expirytext: 'Akhir Pekan Lebih Seru dengan Hidangan Lezat!',
                    imgurl: 'assets/images/sushi1.png',
                    promoname: 'Promo Weekend Spesial',
                    validitydate: 'Berlaku hingga 31 desember',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// MenuItem widget for the grid view
class MenuItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final String route;

  const MenuItem({
    Key? key,
    required this.title,
    required this.icon,
    required this.route,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, route); // Navigate to the respective route
      },
      child: Card(
        elevation: 5,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 30,
                color: Colors.blue,
              ),
              SizedBox(height: 10),
              Text(
                title,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.blue,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  @override
  _CustomAppBarState createState() => _CustomAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _CustomAppBarState extends State<CustomAppBar> {
  bool _isSearching = false;
  TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AppBar(
       backgroundColor: const Color.fromARGB(255, 214, 75, 65),
      title: Row(
        children: [
          Text('9 11 Meals', style: TextStyle( fontWeight: FontWeight.bold),),

          Spacer(),
          if (_isSearching)
            Container(
              width: 200,
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  hintText: 'Cari...',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: const Color.fromARGB(255, 255, 0, 0),
                ),
                style: TextStyle(color: Colors.black),
                autofocus: true,
              ),
            ),
          IconButton(
            icon: Icon(_isSearching ? Icons.cancel : Icons.search),
            onPressed: () {
              setState(() {
                _isSearching = !_isSearching;
                if (!_isSearching) _searchController.clear();
              });
            },
          ),
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
              print('Notifikasi');
            },
          ),
        ],
      ),
    );
  }
}

// Promo Card Widget
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
