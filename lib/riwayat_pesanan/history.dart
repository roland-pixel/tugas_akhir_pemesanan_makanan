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
      'description': 'Nasi lembek dengan perpaduan suwiran ayam dan kerupuk.',
      'price': 'Rp 10.000',
      'image': 'assets/images/bubur.jpg',
      'quantity': 2,
      'date': '10-Januari-2024',
    },
    {
      'name': 'Soto Ayam',
      'description': 'Makanan berkuah dengan bumbu khas.',
      'price': 'Rp 12.000',
      'image': 'assets/images/soto.jpg',
      'date': '25-Agustus-2024',
    },
    {
      'name': 'Pecel Sayur',
      'description': 'Sayur sayuran yang direbus dan dikasih bumbu kacang kental.',
      'price': 'Rp 15.000',
      'image': 'assets/images/pecel.jpg',
      'date': '19-Oktober-2024',
    },
    {
      'name': 'Es Teh',
      'description': 'Perpaduan Teh yang Manis bercampur dengan Es yang membuat sejuk.',
      'price': 'Rp 10.000',
      'image': 'assets/images/menu/esteh.jpeg',
      'date': '22-Oktober-2024',
    },

     {
      'name': 'Martabak Manis',
      'description': 'Perpaduan antara adonan manis dengan Topingan Keju dan Meses.',
      'price': 'Rp 50.000',
      'image': 'assets/images/menu/martabakmanis.jpg',
      'date': '22-Oktober-2024',
    },

    {
      'name': 'Seblak',
      'description': 'Perpaduan kuah Cikur pedas dan dengan berbagai macam Kerupuk yang menggoda lidah.',
      'price': 'Rp 20.000',
      'image': 'assets/images/menu/seblak.jpg',
      'date': '5-Desember-2024',
    },
    
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Row(
          children: [
            const Text(
              'Riwayat Pemesanan',
              style: TextStyle(fontSize: 20, color: Colors.black),
            ),
            const Spacer(),
            const Icon(
              Icons.history,
              color: Colors.black,
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
                    date: item.containsKey('date') ? item['date'] : null,
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
                    if (item.containsKey('date'))
                      Text(
                        'Tanggal: ${item['date']}',
                        style: const TextStyle(color: Colors.blueGrey),
                      ),
                    Text(
                      item['price'],
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.grey,
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
  final String? date;

  const DetailPage({
    Key? key,
    required this.name,
    required this.description,
    required this.price,
    required this.image,
    this.date,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(name),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16.0),
                  child: Image.asset(
                    image,
                    width: 250,
                    height: 250,
                    fit: BoxFit.cover,
                  ),
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
              if (date != null)
                Text(
                  'Tanggal Pemesanan: $date',
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.blueGrey,
                  ),
                ),
              const SizedBox(height: 20),
              Text(
                price,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
