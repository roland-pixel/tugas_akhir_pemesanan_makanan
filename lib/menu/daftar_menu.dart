import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DaftarMenuPage(),
    );
  }
}

class DaftarMenuPage extends StatelessWidget {
  final List<Map<String, String>> menuItems = [
    {
      'title': 'Nasi Goreng',
      'image': 'https://source.unsplash.com/featured/?friedrice',
      'description': 'Nasi goreng khas Indonesia dengan bumbu spesial.',
      'price': 'Rp 25.000'
    },
    {
      'title': 'Sate Ayam',
      'image': 'https://source.unsplash.com/featured/?satay',
      'description': 'Sate ayam lezat dengan saus kacang.',
      'price': 'Rp 20.000'
    },
    {
      'title': 'Es Teh Manis',
      'image': 'https://source.unsplash.com/featured/?icedtea',
      'description': 'Minuman segar es teh manis.',
      'price': 'Rp 10.000'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar Menu'),
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: menuItems.length,
          itemBuilder: (context, index) {
            final item = menuItems[index];
            return Card(
              margin: const EdgeInsets.symmetric(vertical: 8.0),
              child: ListTile(
                leading: Image.network(
                  item['image']!,
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,
                ),
                title: Text(item['title']!,
                    style: TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 5),
                    Text(item['description']!,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 12)),
                    SizedBox(height: 5),
                    Text(item['price']!,
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.green,
                            fontWeight: FontWeight.w600)),
                  ],
                ),
                trailing: Icon(Icons.chevron_right),
                onTap: () {
                  Navigator.pushNamed(context, '/detail-menu', arguments: item);
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
