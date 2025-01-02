import 'package:flutter/material.dart';
import 'dart:math';

class AllReviewsPage extends StatelessWidget {
  final Random random = Random();

  Color getRandomColor() {
    return Color.fromARGB(
      255,
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Semua Ulasan"),
        backgroundColor: Color(0xFFD32F2F),
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          ReviewCard(
            nama: 'Dedy',
            penggunaSejak: '11 September 2024',
            rating: '5.0',
            komentar:
                'Tumpeng Merah Putih ini luar biasa! Penyajian sangat cantik, dan rasanya benar-benar otentik khas Nusantara.',
            menu: 'Promo Hari Kemerdekaan',
            tanggalBeli: '13 Desember 2024',
            avatarColor: Colors.brown,
          ),
          ReviewCard(
            nama: 'Hafizh',
            penggunaSejak: '25 Februari 2019',
            rating: '3.0',
            komentar:
                'Tumpengnya lumayan enak, tapi menurut saya porsinya agak kecil untuk harga yang ditawarkan.',
            menu: 'Promo Hari Kemerdekaan',
            tanggalBeli: '20 September 2024',
            avatarColor: Colors.purple,
          ),
          ReviewCard(
            nama: 'Wati',
            penggunaSejak: '5 Juni 2022',
            rating: '1.0',
            komentar:
                'Saya sangat kecewa dengan menu ini. Nasi kuningnya terasa hambar, dan beberapa lauk terlihat tidak segar.',
            menu: 'Promo Hari Kemerdekaan',
            tanggalBeli: '1 Januari 2025',
            avatarColor: getRandomColor(),
          ),
          ReviewCard(
            nama: 'Mamat',
            penggunaSejak: '21 maret 2018',
            rating: '2.0',
            komentar: 'Rasanya biasa saja, kurang spesial.',
            menu: 'Promo Hari Kemerdekaan',
            tanggalBeli: '2 Januari 2025',
            avatarColor: getRandomColor(),
          ),
          ReviewCard(
            nama: 'Budi',
            penggunaSejak: '25 Agustus 2020',
            rating: '5.0',
            komentar: 'Nasi kuningnya harum, lauknya juga mantap!',
            menu: 'Promo Hari Kemerdekaan',
            tanggalBeli: '2 Januari 2025',
            avatarColor: getRandomColor(),
          ),
          ReviewCard(
            nama: 'Putri',
            penggunaSejak: '17 September 2023',
            rating: '4.0',
            komentar: 'Menu ini cocok banget buat acara resmi.',
            menu: 'Promo Hari Kemerdekaan',
            tanggalBeli: '5 Januari 2025',
            avatarColor: getRandomColor(),
          ),
          ReviewCard(
            nama: 'Eka',
            penggunaSejak: '23 September 2016',
            rating: '3.0',
            komentar: 'Pelayanan cepat, tapi rasa tumpeng kurang pas.',
            menu: 'Promo Hari Kemerdekaan',
            tanggalBeli: '5 Januari 2025',
            avatarColor: getRandomColor(),
          ),
          ReviewCard(
            nama: 'Suhendra',
            penggunaSejak: '10 November 2022',
            rating: '5.0',
            komentar: 'Sambalnya pedas, cocok buat pecinta pedas.',
            menu: 'Promo Hari Kemerdekaan',
            tanggalBeli: '5 Januari 2025',
            avatarColor: getRandomColor(),
          ),
          ReviewCard(
            nama: 'Misya',
            penggunaSejak: '02 September 2020',
            rating: '1.0',
            komentar: 'Hambar dan tidak sesuai ekspektasi.',
            menu: 'Promo Hari Kemerdekaan',
            tanggalBeli: '5 Januari 2025',
            avatarColor: getRandomColor(),
          ),
          ReviewCard(
            nama: 'Idah',
            penggunaSejak: '09 Januari 2023',
            rating: '2.0',
            komentar: 'Presentasi cantik, tapi rasa kurang maksimal.',
            menu: 'Promo Hari Kemerdekaan',
            tanggalBeli: '6 Januari 2025',
            avatarColor: getRandomColor(),
          ),
        ],
      ),
    );
  }
}

class ReviewCard extends StatelessWidget {
  final String nama;
  final String penggunaSejak;
  final String rating;
  final String komentar;
  final String menu;
  final String tanggalBeli;
  final Color avatarColor;

  ReviewCard({
    required this.nama,
    required this.penggunaSejak,
    required this.rating,
    required this.komentar,
    required this.menu,
    required this.tanggalBeli,
    required this.avatarColor,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundColor: avatarColor,
                  child: Text(
                    nama[0].toUpperCase(),
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        nama,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Pengguna sejak $penggunaSejak',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.amber),
                    Text(
                      rating,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 10),
            Text(
              komentar,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Icon(Icons.restaurant, size: 16, color: Colors.grey),
                SizedBox(width: 5),
                Text(menu, style: TextStyle(color: Colors.grey)),
              ],
            ),
            SizedBox(height: 10),
            Text(
              'Dibeli tanggal $tanggalBeli',
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
