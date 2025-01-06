import 'package:flutter/material.dart';
import 'detail_menu.dart';

class chatwidget extends StatelessWidget {
  const chatwidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: chatappbar(),
      body: TodaySection(),
    );
  }
}

class chatappbar extends StatefulWidget implements PreferredSizeWidget {
  @override
  _chatappbarState createState() => _chatappbarState();

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _chatappbarState extends State<chatappbar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: Icon(Icons.arrow_back, color: Colors.black),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DetailMenu()),
          );
        },
      ),
      title: Row(
        children: [
          CircleAvatar(
            backgroundImage: AssetImage(
                'assets/images/food.png'), // Ganti dengan gambar Anda
            radius: 20,
          ),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'KID APP',
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.white70,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                'Aktif 20 detik lalu',
                style: TextStyle(fontSize: 12, color: Colors.black),
              ),
            ],
          ),
        ],
      ),
      backgroundColor: Color(0xFFD32F2F),
    );
  }
}

class TodaySection extends StatefulWidget {
  @override
  _TodaySectionState createState() => _TodaySectionState();
}

class _TodaySectionState extends State<TodaySection> {
  final List<Map<String, dynamic>> messages = [
    {"text": "Apakah menu ini ready?", "isSender": true},
    {"text": "Ya, menu ini ready kak!", "isSender": false},
    {"text": "Berapa lama estimasi pengiriman?", "isSender": true},
    {"text": "Estimasi pengiriman 3-5 hari kerja.", "isSender": false},
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Center(
            child: Text(
              'Hari Ini',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 10),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Kamu bertanya tentang menu ini',
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  ListTile(
                    leading: Image.asset(
                      'assets/images/menu/tumpeng.jpg', // Ganti dengan gambar produk Anda
                      width: 50,
                      height: 50,
                    ),
                    title: Text(
                      'Promo Hari Kemerdekaan',
                      style: TextStyle(fontSize: 14),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    subtitle: Row(
                      children: [
                        Text(
                          'Rp150.000',
                          style: TextStyle(
                              color: Colors.red, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(width: 10),
                        Text(
                          'Rp200.000',
                          style: TextStyle(
                            color: Colors.grey,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final message = messages[index];
                return Align(
                  alignment: message['isSender']
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: message['isSender']
                          ? Colors.blue[100]
                          : Colors.grey[200],
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12),
                        topRight: Radius.circular(12),
                        bottomLeft: message['isSender']
                            ? Radius.circular(12)
                            : Radius.circular(0),
                        bottomRight: message['isSender']
                            ? Radius.circular(0)
                            : Radius.circular(12),
                      ),
                    ),
                    child: Text(
                      message['text'],
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
