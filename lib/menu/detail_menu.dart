import 'package:flutter/material.dart';

void main() {
  runApp(DetailMenu());
}

class DetailMenu extends StatelessWidget {
  const DetailMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DetailMenuPage(),
    );
  }
}

class DetailMenuPage extends StatelessWidget {
  const DetailMenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarKustom(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MenuWidget(),
            Padding(
              padding: const EdgeInsets.all(16),
              child: DeskripsiWidget(),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Penilaianwidget(),
            )
          ],
        ),
      ),
    );
  }
}

class AppBarKustom extends StatefulWidget implements PreferredSizeWidget {
  @override
  _AppBarKustomState createState() => _AppBarKustomState();

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _AppBarKustomState extends State<AppBarKustom> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: Icon(Icons.arrow_back, color: Colors.orange),
        onPressed: () {},
      ),
      title: TextField(
        decoration: InputDecoration(
          hintText: 'Paket Panas',
          border: InputBorder.none,
        ),
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.share, color: Colors.orange),
          onPressed: () {},
        ),
        Stack(
          children: [
            IconButton(
              icon: Icon(Icons.shopping_cart, color: Colors.orange),
              onPressed: () {},
            ),
            Positioned(
              right: 0,
              child: Container(
                padding: EdgeInsets.all(1),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(6),
                ),
                constraints: BoxConstraints(
                  minWidth: 12,
                  minHeight: 12,
                ),
                child: Text(
                  '5',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 8,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}

class MenuWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin:
          EdgeInsets.all(16), // Padding untuk menambahkan ruang di sekitar card
      child: Column(
        children: [
          Image.asset('assets/images/sushi1.png'),
          SizedBox(height: 10),
          Text(
            'Nikmati PaNas 1 hanya Dengan 25 Ribu',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 10), // Menambahkan jarak setelah teks
        ],
      ),
    );
  }
}

class DeskripsiWidget extends StatefulWidget {
  @override
  _DeskripsiWidgetState createState() => _DeskripsiWidgetState();
}

class _DeskripsiWidgetState extends State<DeskripsiWidget> {
  bool _showFullDeskripsi = false;

  void _toggleDescription() {
    setState(() {
      _showFullDeskripsi = !_showFullDeskripsi;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(
          vertical: 10), // Padding untuk menambahkan ruang vertikal
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start, // Pastikan posisi teks di kiri
          children: [
            Text(
              'Deskripsi',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Spesifikasi Dasar',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Warna',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text('Titanium Silver'),
            Text('Carbon Black'),
            SizedBox(height: 16),
            Text(_showFullDeskripsi
                ? 'Deskripsi lengkap makanan: Ini adalah makanan yang sangat lezat dan bergizi. Cocok untuk semua kalangan usia dan dapat dinikmati kapan saja.'
                : 'Deskripsi lengkap makanan: Ini adalah makanan yang sangat lezat...'),
            Divider(),
            Align(
              alignment: Alignment.center,
              child: GestureDetector(
                onTap: _toggleDescription,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      _showFullDeskripsi ? 'Ringkasan' : 'Selengkapnya',
                      style: TextStyle(color: Colors.blue),
                    ),
                    Icon(
                      _showFullDeskripsi
                          ? Icons.arrow_upward
                          : Icons.arrow_downward,
                      color: Colors.blue,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Penilaianwidget extends StatefulWidget {
  @override
  _PenilaianwidgetState createState() => _PenilaianwidgetState();
}

class _PenilaianwidgetState extends State<Penilaianwidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Semua Ulasan',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        RatingCard(
          nama: 'Dedy',
          penggunaSejak: '11 September 2024',
          rating: '5.0',
          komentar: 'Mantap pelayanan cepat dan driver gacor',
          menu: 'Nasi Goreng Mawut',
          tanggal: '13 Desember 2024',
        ),
        RatingCard(
          nama: 'Hafizh',
          penggunaSejak: '25 Februari 2019',
          rating: '3.0',
          komentar:
              'Kirain spesial dapat hati atau apa ternyata cuman telur sama ayam ak',
          menu: 'Nasi Goreng Saos Merah Spesial',
          tanggal: '20 September 2024',
        ),
        RatingCard(
          nama: 'Hafizh',
          penggunaSejak: '25 Februari 2019',
          rating: '3.0',
          komentar:
              'Kirain spesial dapat hati atau apa ternyata cuman telur sama ayam ak',
          menu: 'Nasi Goreng Saos Merah Spesial',
          tanggal: '20 September 2024',
        ),
      ],
    );
  }
}

class RatingCard extends StatelessWidget {
  final String nama;
  final String penggunaSejak;
  final String rating;
  final String komentar;
  final String menu;
  final String tanggal;

  RatingCard({
    required this.nama,
    required this.penggunaSejak,
    required this.rating,
    required this.komentar,
    required this.menu,
    required this.tanggal,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              nama,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 4),
            Text(
              'Pengguna MCD App sejak $penggunaSejak',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            SizedBox(height: 8),
            Text(
              'Rating: $rating',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(
              height: 4,
            ),
            Text(komentar),
            SizedBox(height: 8),
            Text(
              menu,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 4),
            Text(
              tanggal,
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
