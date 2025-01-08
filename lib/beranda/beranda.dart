import 'package:flutter/material.dart';

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
    );
  }
}

class BerandaScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Beranda'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Aksi pencarian
              print('Mencari...');
            },
          ),
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              // Aksi notifikasi
              print('Notifikasi');
            },
          ),
        ],
      ),
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
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              children: [
                menuItem('Fitur 1', Icons.access_alarm),
                menuItem('Fitur 2', Icons.account_circle),
                menuItem('Fitur 3', Icons.add_a_photo),
                menuItem('Fitur 4', Icons.approval),
                menuItem('Fitur 5', Icons.bookmark),
                menuItem('Fitur 6', Icons.cake),
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
                    'Berita Terbaru',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Berikut adalah beberapa berita terbaru yang bisa Anda baca.',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 10),
                  ListTile(
                    title: Text('Berita 1: Judul Berita'),
                    subtitle: Text('Deskripsi singkat berita...'),
                    leading: Icon(Icons.article),
                    onTap: () {
                      // Aksi saat berita dipilih
                      print('Berita 1 dipilih');
                    },
                  ),
                  ListTile(
                    title: Text('Berita 2: Judul Berita'),
                    subtitle: Text('Deskripsi singkat berita...'),
                    leading: Icon(Icons.article),
                    onTap: () {
                      // Aksi saat berita dipilih
                      print('Berita 2 dipilih');
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget untuk membuat menu item di GridView
  Widget menuItem(String title, IconData icon) {
    return GestureDetector(
      onTap: () {
        print('$title dipilih');
      },
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 40, color: Colors.blue),
              SizedBox(height: 8),
              Text(title, style: TextStyle(fontSize: 14)),
            ],
          ),
        ),
      ),
    );
  }
}
