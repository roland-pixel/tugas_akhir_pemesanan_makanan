import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage('assets/profile.jpg'), // Ganti dengan gambar profil
            ),
            SizedBox(width: 8),
            Text(
              'Hai,\nFoodie!',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
        color: Colors.black,
        child: ListView(
          padding: EdgeInsets.all(16),
          children: [
            // Pencarian
            TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[800],
                hintText: 'Search',
                hintStyle: TextStyle(color: Colors.grey),
                prefixIcon: Icon(Icons.search, color: Colors.grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            SizedBox(height: 16),
            // Bagian "Hari ini, Mau makan apa?"
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[900],
                borderRadius: BorderRadius.circular(8),
              ),
             child:  Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
    Expanded(
      child: Container(
        padding: EdgeInsets.all(16), // Memberikan padding di sekitar konten
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/food1.JPeG'), // Ganti dengan path gambar yang sesuai
            fit: BoxFit.cover, // Agar gambar memenuhi area latar belakang
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hari ini,\nMau makan apa?',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: () {},
              child: Text('Cari Makanan'),
            ),
          ],
        ),
      ),
    ),
  ],
)

            ),
            SizedBox(height: 16),
            // Pesanan Anda
            SectionTitle(title: 'Pesanan anda', onViewAll: () {}),
            SizedBox(height: 8),
            OrderCard(
              title: 'Steak Nusantara',
              address: 'Jalan vetran city no 299',
              time: '12 menit lagi',
              onTap: () {},
            ),
            SizedBox(height: 16),
            // Dekat dengan Anda
            SectionTitle(title: 'Dekat dengan anda', onViewAll: () {}),
            SizedBox(height: 8),
            NearbyPlaces(),
          ],
        ),
      ),
    );
  }
}

// Widget untuk Judul Bagian
class SectionTitle extends StatelessWidget {
  final String title;
  final VoidCallback onViewAll;

  const SectionTitle({required this.title, required this.onViewAll});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        TextButton(
          onPressed: onViewAll,
          child: Text('Selengkapnya', style: TextStyle(color: Colors.orange)),
        ),
      ],
    );
  }
}

// Widget untuk Kartu Pesanan
class OrderCard extends StatelessWidget {
  final String title;
  final String address;
  final String time;
  final VoidCallback onTap;

  const OrderCard({required this.title, required this.address, required this.time, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.grey[900],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.grey[700],
              radius: 24,
              child: Icon(Icons.restaurant, color: Colors.white),
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                  Text(address, style: TextStyle(color: Colors.grey, fontSize: 14)),
                  Text(time, style: TextStyle(color: Colors.grey, fontSize: 14)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Widget untuk Tempat di Sekitar
class NearbyPlaces extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          NearbyPlaceCard(
            name: 'Patty Paradise',
            distance: '1.1 km dari sini',
            imagePath: 'assets/images/food2.jpeg',
          ),
          NearbyPlaceCard(
            name: 'Pusako Minang',
            distance: '0.9 km dari sini',
            imagePath: 'assets/images/food3.jpg',
          ),
          NearbyPlaceCard(
            name: 'Warteg Bahari',
            distance: '1.4 km dari sini',
            imagePath: 'assets/images/food5.jpeg',
          ),
        ],
      ),
    );
  }
}

class NearbyPlaceCard extends StatelessWidget {
  final String name;
  final String distance;
  final String imagePath; // Tambahkan parameter untuk path gambar lokal

  const NearbyPlaceCard({
    required this.name,
    required this.distance,
    required this.imagePath, // Pastikan parameter ini wajib diisi
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      margin: EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Gunakan Image.asset untuk menampilkan gambar lokal
          Container(
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  distance,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

