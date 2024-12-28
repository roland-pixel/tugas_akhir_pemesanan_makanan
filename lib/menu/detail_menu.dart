import 'package:flutter/material.dart';
import 'chat.dart';
import 'daftar_menu.dart';

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
        padding: const EdgeInsets.only(top: 10),
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
      bottomNavigationBar: customnavigationbar(),
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
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DaftarMenuPage()),
          );
        },
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
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (context) => ShareWidget(),
            );
          },
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
    return Container(
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.symmetric(horizontal: 16),
        child: Card(
          child: Column(
            children: [
              Image.asset(
                'assets/images/sushi1.png',
                height: 250,
              ),
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
        ));
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
    double cardWidth = MediaQuery.of(context).size.width * 0.8;

    return Center(
      child: Card(
        margin: EdgeInsets.symmetric(vertical: 20),
        child: Container(
          width: cardWidth,
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                nama,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 4),
              Text(
                'Pengguna MCD App sejak $penggunaSejak',
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
              SizedBox(height: 6),
              Text(
                'Rating: $rating',
                style: TextStyle(fontSize: 14),
              ),
              SizedBox(height: 4),
              Text(komentar, style: TextStyle(fontSize: 14)),
              SizedBox(height: 6),
              Text(
                menu,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 4),
              Text(
                tanggal,
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class customnavigationbar extends StatelessWidget {
  const customnavigationbar({super.key});
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.white,
      padding: EdgeInsets.zero,
      child: Container(
        height: 40,
        color: Colors.tealAccent,
        child: Row(
          children: [
            Container(
              width: 120,
              child: IconButton(
                icon: Icon(Icons.chat),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => chatwidget()),
                  );
                },
              ),
            ),
            Container(
              width: 1,
              height: 40,
              color: Colors.grey,
            ),
            Container(
              width: 120,
              child: IconButton(
                icon: Icon(Icons.shopping_cart),
                onPressed: () {},
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) => ProductWidget(),
                  );
                },
                child: Container(
                  color: Colors.orange,
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Beli Dengan',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Voucher Rp5.524.053',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ShareWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.5,
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Center(
                  child: Text(
                    'Share ke teman dan keluargamu!',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              IconButton(
                icon: Icon(Icons.close),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
          SizedBox(height: 24),
          Row(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundColor: Colors.yellow,
                child: Icon(Icons.perm_contact_cal, color: Colors.white),
              ),
              SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Lontak Saya',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Bagikan ke Teman Shopee dan kontak lainnya',
                    style: TextStyle(fontSize: 14),
                  ),
                ],
              )
            ],
          ),
          SizedBox(height: 24),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Wrap(
              spacing: 16,
              children: [
                ShareButton(icon: Icons.wechat_sharp, label: 'WhatsApp'),
                ShareButton(icon: Icons.camera_alt, label: 'Story'),
                ShareButton(icon: Icons.photo, label: 'Feed Instagram'),
                ShareButton(icon: Icons.send, label: 'Telegram'),
                ShareButton(icon: Icons.facebook, label: 'Facebook'),
                ShareButton(icon: Icons.wechat_sharp, label: 'WhatsApp'),
                ShareButton(icon: Icons.camera_alt, label: 'Story'),
                ShareButton(icon: Icons.photo, label: 'Feed Instagram'),
                ShareButton(icon: Icons.send, label: 'Telegram'),
                ShareButton(icon: Icons.facebook, label: 'Facebook'),
              ],
            ),
          ),
          SizedBox(height: 24),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Wrap(
              spacing: 16,
              children: [
                ShareButton(icon: Icons.link, label: 'Salin Tautan'),
                ShareButton(icon: Icons.save_alt, label: 'simpan Foto'),
                ShareButton(icon: Icons.more_horiz, label: 'Lainnya'),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ShareButton extends StatelessWidget {
  final IconData icon;
  final String label;
  ShareButton({required this.icon, required this.label});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 25,
          child: IconButton(
            icon: Icon(
              icon,
              size: 25,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
        ),
        Text(label),
      ],
    );
  }
}

class ProductWidget extends StatefulWidget {
  @override
  _ProductWidgetState createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<ProductWidget> {
  int quantity = 1;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.45,
      padding: EdgeInsets.all(16),
      child: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            child: Container(
              child: IconButton(
                icon: Icon(Icons.close),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 100,
                    child: Stack(
                      children: [
                        Image.asset(
                          'assets/images/sushi1.png',
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                        Positioned(
                          top: 8,
                          right: 8,
                          child: Icon(
                            Icons.zoom_out_map,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Harga: Rp5.524.053',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Stok: 1080',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Jumlah:',
                    style: TextStyle(fontSize: 16),
                  ),
                  Row(
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                        ),
                        child: IconButton(
                          icon: Icon(Icons.remove),
                          onPressed: () {
                            setState(() {
                              if (quantity > 1) quantity--;
                            });
                          },
                        ),
                      ),
                      Container(
                        width: 40,
                        height: 40,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                        ),
                        child: Text(
                          quantity.toString(),
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                        ),
                        child: IconButton(
                          icon: Icon(Icons.add),
                          onPressed: () {
                            setState(() {
                              quantity++;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Divider(),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {},
                child: Text('Beli Sekarang'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  foregroundColor: Colors.white,
                  minimumSize: Size(MediaQuery.of(context).size.width - 32, 50),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
