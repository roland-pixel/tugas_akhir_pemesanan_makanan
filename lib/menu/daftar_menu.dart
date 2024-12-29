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
        backgroundColor: Colors.black87,
        title: Row(
          children: [
            const Text(
              'My',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.yellow,
              ),
            ),
            const SizedBox(width: 5),
            Image.asset(
              'assets/images/logo_mcd.png',
              width: 40,
              height: 40,
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
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(width: 5),
                  const Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
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
                  containerreward(),
                  containerreward(),
                  containerreward(),
                  containerreward(),
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
                          expirytext: 'segera Habis masa berlaku nya',
                          imgurl: 'assets/images/sushi1.png',
                          promoname: 'Promo Menu 1',
                          validitydate: 'Berlaku hingga 31 desember'),
                      promocardmenu(
                          expirytext: 'segera Habis masa berlaku nya',
                          imgurl: 'assets/images/sushi1.png',
                          promoname: 'Promo Menu 1',
                          validitydate: 'Berlaku hingga 31 desember'),
                      promocardmenu(
                          expirytext: 'segera Habis masa berlaku nya',
                          imgurl: 'assets/images/sushi1.png',
                          promoname: 'Promo Menu 1',
                          validitydate: 'Berlaku hingga 31 desember'),
                      promocardmenu(
                          expirytext: 'segera Habis masa berlaku nya',
                          imgurl: 'assets/images/sushi1.png',
                          promoname: 'Promo Menu 1',
                          validitydate: 'Berlaku hingga 31 desember'),
                      promocardmenu(
                          expirytext: 'segera Habis masa berlaku nya',
                          imgurl: 'assets/images/sushi1.png',
                          promoname: 'Promo Menu 1',
                          validitydate: 'Berlaku hingga 31 desember'),
                      promocardmenu(
                          expirytext: 'segera Habis masa berlaku nya',
                          imgurl: 'assets/images/sushi1.png',
                          promoname: 'Promo Menu 1',
                          validitydate: 'Berlaku hingga 31 desember'),
                      promocardmenu(
                          expirytext: 'segera Habis masa berlaku nya',
                          imgurl: 'assets/images/sushi1.png',
                          promoname: 'Promo Menu 1',
                          validitydate: 'Berlaku hingga 31 desember'),
                      promocardmenu(
                          expirytext: 'segera Habis masa berlaku nya',
                          imgurl: 'assets/images/sushi1.png',
                          promoname: 'Promo Menu 1',
                          validitydate: 'Berlaku hingga 31 desember'),
                      promocardmenu(
                          expirytext: 'segera Habis masa berlaku nya',
                          imgurl: 'assets/images/sushi1.png',
                          promoname: 'Promo Menu 1',
                          validitydate: 'Berlaku hingga 31 desember'),
                      promocardmenu(
                          expirytext: 'segera Habis masa berlaku nya',
                          imgurl: 'assets/images/sushi1.png',
                          promoname: 'Promo Menu 1',
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
    final double mainContainerWidth = screenWidth * 0.7;
    final double innerContainerWidth = mainContainerWidth * 0.5;

    return Center(
      child: Container(
        width: mainContainerWidth,
        padding: EdgeInsets.all(16),
        color: Colors.yellow,
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
                    height: 150,
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
              style: TextStyle(fontSize: 16),
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
class containerreward extends StatelessWidget {
  const containerreward({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
      ),
      child: Column(
        children: [
          Image.asset(
            'assets/images/drink14.jpg',
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
                      '10 poin',
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
            'Coco Top',
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
            title: 'ayam',
            isSelected: selectedCategory == 'ayam',
            onTap: () => _onCategorySelected('ayam'),
          ),
          PromoCategory(
            title: 'daging',
            isSelected: selectedCategory == 'daging',
            onTap: () => _onCategorySelected('daging'),
          ),
          PromoCategory(
            title: 'sarapan',
            isSelected: selectedCategory == 'sarapan',
            onTap: () => _onCategorySelected('sarapan'),
          ),
          PromoCategory(
            title: 'desert',
            isSelected: selectedCategory == 'desert',
            onTap: () => _onCategorySelected('desert'),
          ),
          PromoCategory(
            title: 'maincourse',
            isSelected: selectedCategory == 'maincourse',
            onTap: () => _onCategorySelected('maincourse'),
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
          color: isSelected ? Colors.yellow : Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isSelected ? Colors.yellow : Colors.grey,
            width: 2,
          ),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: isSelected ? Colors.black : Colors.grey,
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
      ),
      child: Row(
        children: [
          Image.asset(
            'assets/images/logo_mcd.png',
            width: 50,
            height: 50,
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'MyMcd Rewards',
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
          Image.asset(
            'assets/images/kupon.png',
            width: 200,
            height: 200,
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
