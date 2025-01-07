import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RiwayatPemesananPage(),
    );
  }
}

class RiwayatPemesananPage extends StatelessWidget {
  final List<Map<String, dynamic>> riwayatPemesanan = [
    {
      'name': 'Bubur Ayam',
      'description': 'Nasi lembek dengan suwiran ayam dan kerupuk.',
      'price': 'Rp 10.000',
      'image': 'assets/images/bubur.jpg',
      'quantity': 2, 
    },
    {
      'name': 'Soto Ayam',
      'description': 'Makanan berkuah dengan bumbu khas.',
      'price': 'Rp 12.000',
      'image': 'assets/images/soto.jpg',
    },
    {
      'name': 'Pecel Lele',
      'description': 'Lele goreng dengan sambal dan lalapan.',
      'price': 'Rp 15.000',
      'image': 'assets/images/pecel.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Kembali ke halaman sebelumnya
          },
        ),
        title: Row(
          children: [
            const SizedBox(width: 350), // Jarak antara logo dan teks
            const Text(
              'Riwayat Pemesanan',
              style: TextStyle(fontSize: 20, color: Colors.black),
            ),
            const SizedBox(width: 380), // Jarak 100 piksel antara teks dan ikon
            const Icon(
              Icons.history,
              color: Colors.black, // Anda dapat mengubah warna ikon sesuai kebutuhan
            ),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: riwayatPemesanan.length,
        itemBuilder: (context, index) {
          final item = riwayatPemesanan[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailPage(
                    name: item['name'],
                    description: item['description'],
                    price: item['price'],
                    image: item['image'],
                  ),
                ),
              );
            },
            child: Card(
              elevation: 4,
              margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
              child: ListTile(
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset(
                    item['image'],
                    width: 60,
                    height: 60,
                    fit: BoxFit.cover,
                  ),
                ),
                title: Text(
                  item['name'],
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(item['description']),
                    const SizedBox(height: 4),
                    Text(
                      item['price'],
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
                trailing: const Icon(
                  Icons.history,
                  color: Colors.red,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class DetailPage extends StatelessWidget {
  final String name;
  final String description;
  final String price;
  final String image;

  const DetailPage({
    Key? key,
    required this.name,
    required this.description,
    required this.price,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        title: Text(name),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Kembali ke halaman sebelumnya
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                image,
                width: 200,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              name,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              description,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            Text(
              price,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
