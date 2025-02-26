import 'package:flutter/material.dart';
import 'package:tugas_akhir_pemesanan_makanan/menu/detail_menu.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DaftarMenuPage(),
    );
  }
}

class DaftarMenuPage extends StatelessWidget {
  const DaftarMenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFD32F2F),
        // leading: IconButton(
        //   icon: Icon(Icons.arrow_back, color: Colors.black),
        //   onPressed: () {
        //     Navigator.pop(context);
        //   },
        // ),
        title: Row(
          children: [
            Image.asset(
              'assets/images/judul1.png',
              width: 120,
              height: 120,
            ),
            const Spacer(),
            InkWell(
              onTap: () {},
              child: Row(
                children: [
                  const Text(
                    '0 poin',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(width: 5),
                  const Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.black,
                    size: 15,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10),
            Center(
              child: Poin(),
            ),
            SizedBox(
              height: 20,
            ),
            reward(),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ContainerReward(
                    imageUrl: 'assets/images/menu/esteh.jpeg',
                    points: '10 poin',
                    name: 'Es Teh',
                  ),
                  ContainerReward(
                    imageUrl: 'assets/images/menu/esteler.jpeg',
                    points: '25 poin',
                    name: 'Es Teler',
                  ),
                  ContainerReward(
                    imageUrl: 'assets/images/menu/martabakmanis.jpg',
                    points: '50 poin',
                    name: 'Martabak Manis',
                  ),
                  ContainerReward(
                    imageUrl: 'assets/images/menu/rendang.jpg',
                    points: '100 poin',
                    name: 'Rendang',
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Promo',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  PromoWidget(),
                  SizedBox(height: 30),
                  Column(
                    children: [
                      promocardmenu(
                          expirytext:
                              'Nikmati Lezatnya Cita Rasa Nusantara dengan Semangat Merdeka!',
                          imgurl: 'assets/images/menu/tumpeng.jpg',
                          promoname: 'Promo Hari Kemerdekaan',
                          validitydate: 'Berlaku hingga 31 desember'),
                      promocardmenu(
                          expirytext:
                              'Hangatkan Harimu dengan Hidangan Khas Indonesia!',
                          imgurl: 'assets/images/menu/bakso.jpg',
                          promoname: 'Promo Musim Hujan',
                          validitydate: 'Berlaku hingga 31 desember'),
                      promocardmenu(
                          expirytext:
                              'Akhir Pekan Lebih Seru dengan Hidangan Lezat!',
                          imgurl: 'assets/images/bubur.jpg',
                          promoname: 'Promo Weekend Spesial',
                          validitydate: 'Berlaku hingga 31 desember'),
                      promocardmenu(
                          expirytext: 'Jelajahi Rasa Tradisional Indonesia!',
                          imgurl: 'assets/images/soto.jpg',
                          promoname: 'Promo Kuliner Tradisional',
                          validitydate: 'Berlaku hingga 31 desember'),
                      promocardmenu(
                          expirytext:
                              'Buka Puasa Lebih Berkah dengan Menu Istimewa!',
                          imgurl: 'assets/images/menu/kolak_pisang.jpg',
                          promoname: 'Promo Ramadhan',
                          validitydate: 'Berlaku hingga 31 desember'),
                      promocardmenu(
                          expirytext: 'Enak, Murah, dan Mengenyangkan!',
                          imgurl: 'assets/images/menu/nasi_goreng_telur.jpg',
                          promoname: 'Promo Anak Kost',
                          validitydate: 'Berlaku hingga 31 desember'),
                      promocardmenu(
                          expirytext: 'Semakin Panas, Semakin Nikmat!',
                          imgurl: 'assets/images/menu/seblak.jpg',
                          promoname: 'Promo Cinta Pedas',
                          validitydate: 'Berlaku hingga 31 desember'),
                      promocardmenu(
                          expirytext:
                              'Santai Sore Lebih Seru dengan Cemilan Tradisional!',
                          imgurl: 'assets/images/menu/pisang_goreng.jpeg',
                          promoname: 'Promo Makanan Ringan',
                          validitydate: 'Berlaku hingga 31 desember'),
                      promocardmenu(
                          expirytext:
                              'Rayakan Hari Spesialmu dengan Hidangan Istimewa!',
                          imgurl: 'assets/images/menu/nasi_liwet.jpg',
                          promoname: 'Promo Hari Spesial',
                          validitydate: 'Berlaku hingga 31 desember'),
                      promocardmenu(
                          expirytext:
                              'Kembali ke Masa Lalu dengan Cita Rasa Autentik!',
                          imgurl: 'assets/images/menu/gado_gado.jpeg',
                          promoname: 'Promo Nostalgia',
                          validitydate: 'Berlaku hingga 31 desember'),
                    ],
                  ),
                  SizedBox(height: 50),
                  mymcdrewardscard(),
                  SizedBox(height: 20),
                  CouponCard(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Poin extends StatelessWidget {
  const Poin({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double mainContainerWidth = screenWidth * 0.8;
    final double innerContainerWidth = mainContainerWidth * 0.5;

    return Center(
      child: Container(
        width: mainContainerWidth,
        padding: EdgeInsets.all(16),
        color: Color(0xFFD32F2F),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: innerContainerWidth,
              padding: EdgeInsets.all(8),
              color: Colors.white,
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/poin.png',
                    width: 300,
                    height: 120,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    'M 189 016',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              'Pindai kode untuk mendapatkan Poin.',
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}

class reward extends StatelessWidget {
  const reward({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Text(
            'Reward',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Spacer(),
          Row(
            children: [
              InkWell(
                onTap: () {},
                child: Row(
                  children: [
                    Text(
                      'Lihat Semua',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.blue[900],
                      ),
                    ),
                    SizedBox(width: 5),
                    Icon(
                      Icons.arrow_forward_outlined,
                      color: Colors.blue[900],
                      size: 16,
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}

// class widget anak
class ContainerReward extends StatelessWidget {
  final String imageUrl;
  final String points;
  final String name;
  const ContainerReward({
    required this.imageUrl,
    required this.points,
    required this.name,
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Container(
              height: 100,
              width: double.infinity,
              child: Image.asset(
                imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(8)),
                child: Row(
                  children: [
                    Icon(
                      Icons.lock,
                      size: 16,
                    ),
                    Text(
                      points,
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 13,
          ),
          Text(
            name,
            style: TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }
}

class PromoWidget extends StatefulWidget {
  const PromoWidget({super.key});

  @override
  _PromoWidgetState createState() => _PromoWidgetState();
}

class _PromoWidgetState extends State<PromoWidget> {
  String selectedCategory = 'tukar sekarang';

  void _onCategorySelected(String category) {
    setState(() {
      selectedCategory = category;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          PromoCategory(
            title: 'tukar sekarang',
            isSelected: selectedCategory == 'tukar sekarang',
            onTap: () => _onCategorySelected('tukar sekarang'),
          ),
          PromoCategory(
            title: 'Nasi Nusantara',
            isSelected: selectedCategory == 'Nasi Nusantara',
            onTap: () => _onCategorySelected('Nasi Nusantara'),
          ),
          PromoCategory(
            title: 'Makanan Berkuah',
            isSelected: selectedCategory == 'Makanan Berkuah',
            onTap: () => _onCategorySelected('Makanan Berkuah'),
          ),
          PromoCategory(
            title: 'grill dan Sate',
            isSelected: selectedCategory == 'grill dan Sate',
            onTap: () => _onCategorySelected('grill dan Sate'),
          ),
          PromoCategory(
            title: 'Es Segar Nusantara',
            isSelected: selectedCategory == 'Es Segar Nusantara',
            onTap: () => _onCategorySelected('Es Segar Nusantara'),
          ),
          PromoCategory(
            title: 'Minuman Hangat Tradisional',
            isSelected: selectedCategory == 'Minuman Hangat Tradisional',
            onTap: () => _onCategorySelected('Minuman Hangat Tradisional'),
          ),
          PromoCategory(
            title: 'Kopi Nusantara',
            isSelected: selectedCategory == 'Kopi Nusantara',
            onTap: () => _onCategorySelected('Kopi Nusantara'),
          ),
        ],
      ),
    );
  }
}

class PromoCategory extends StatelessWidget {
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  const PromoCategory({
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8),
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? Color(0xFFD32F2F) : Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isSelected ? Color(0xFFD32F2F) : Colors.grey,
            width: 2,
          ),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: isSelected ? Colors.white : Colors.black,
            ),
          ),
        ),
      ),
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
            builder: (context) => DetailMenuPage(),
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

class mymcdrewardscard extends StatelessWidget {
  const mymcdrewardscard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(8),
          color: Colors.white),
      child: Row(
        children: [
          Image.asset(
            'assets/images/kidnapp_logo.png',
            width: 70,
            height: 70,
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Kuliner Rewards',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Bagaimana Cara kerjanya?',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[700],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class CouponCard extends StatelessWidget {
  const CouponCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16),
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 230,
            width: 260,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.red,
              image: DecorationImage(
                image: AssetImage(
                  'assets/images/kupon.png',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 16),
          Text(
            'Itu Saja untuk saat ini.',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 4),
          Text(
            'Segera Periksa lagi untuk Kelezatan tiada henti!',
            style: TextStyle(
              fontSize: 18,
            ),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
