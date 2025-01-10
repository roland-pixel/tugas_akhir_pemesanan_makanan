import 'package:flutter/material.dart';
import 'package:tugas_akhir_pemesanan_makanan/cart/cart.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shopping Cart',
      theme: ThemeData(primarySwatch: Colors.pink),
      home: ShoppingCartPage(),
    );
  }
}

class ShoppingCartPage extends StatelessWidget {
  final List<CartItem> cartItems = [
    CartItem(name: 'ES Teh...', points: 10, image: 'assets/images/menu/esteh.jpeg'),
    CartItem(name: 'Martabak Manis', points: 50, image: 'assets/images/menu/martabakmanis.jpg'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red, // Warna latar belakang
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            // Tambahkan logika untuk tombol kembali jika diperlukan
          },
        ),
        title: Row(
          children: [
            const Text(
              'Kuliner',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(width: 5),
            Image.asset(
              'assets/images/soup.png',
              width: 30,
              height: 30,
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
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                return CartItemWidget(item: cartItems[index]);
              },
            ),
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total: ${calculateTotal(cartItems)} poin',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pink,
                  ),
                  child: Text('Checkout', style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  int calculateTotal(List<CartItem> items) {
    return items.fold(0, (sum, item) => sum + item.points);
  }
}

class CartItem {
  final String name;
  final int points;
  final String image;

  CartItem({required this.name, required this.points, required this.image});
}

class CartItemWidget extends StatelessWidget {
  final CartItem item;

  CartItemWidget({required this.item});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(
        item.image,
        width: 50,
        height: 50,
        fit: BoxFit.cover,
      ),
      title: Text(item.name),
      subtitle: Text('${item.points} poin'),
      trailing: Checkbox(value: true, onChanged: (value) {}),
    );
  }
}
