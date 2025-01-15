import 'package:flutter/material.dart';

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

class ShoppingCartPage extends StatefulWidget {
  @override
  _ShoppingCartPageState createState() => _ShoppingCartPageState();
}

class _ShoppingCartPageState extends State<ShoppingCartPage> {
  List<CartItem> cartItems = [
    CartItem(name: 'Promo Hari Merdeka', price: 150000, image: 'assets/images/menu/tumpeng.jpg', isSelected: false),
  ];

  bool isAllSelected = false;

  void toggleSelectAll(bool? value) {
    setState(() {
      isAllSelected = value ?? false;
      for (var item in cartItems) {
        item.isSelected = isAllSelected;
      }
    });
  }

  double calculateTotal() {
    return cartItems
        .where((item) => item.isSelected)
        .fold(0, (sum, item) => sum + item.price);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
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
                return CartItemWidget(
                  item: cartItems[index],
                  onChanged: (value) {
                    setState(() {
                      cartItems[index].isSelected = value ?? false;
                      isAllSelected =
                          cartItems.every((item) => item.isSelected);
                    });
                  },
                );
              },
            ),
          ),
          Divider(),
          Container(
            color: Colors.red,
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Row(
              children: [
                Checkbox(
                  value: isAllSelected,
                  onChanged: toggleSelectAll,
                ),
                const Text(
                  'Pilih Semua',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                const SizedBox(width: 8),
                const Text(
                  '|',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                const SizedBox(width: 8), // Jarak kecil sebelum teks "Hapus"
                GestureDetector(
                  onTap: () {
                    setState(() {
                      cartItems.removeWhere((item) => item.isSelected);
                      isAllSelected = false;
                    });
                  },
                  child: const Text(
                    'Hapus',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: Colors.red,
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total Harga: Rp${formatCurrency(calculateTotal())}',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
                  child: const Text(
                    'Checkout',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String formatCurrency(double amount) {
    return amount.toStringAsFixed(0).replaceAllMapped(
        RegExp(r'\B(?=(\d{3})+(?!\d))'), (Match m) => '.');
  }
}

class CartItem {
  final String name;
  final double price;
  final String image;
  bool isSelected;

  CartItem({
    required this.name,
    required this.price,
    required this.image,
    this.isSelected = false,
  });
}

class CartItemWidget extends StatelessWidget {
  final CartItem item;
  final ValueChanged<bool?> onChanged;

  CartItemWidget({required this.item, required this.onChanged});

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
      subtitle: Text('Rp${formatCurrency(item.price)}'),
      trailing: Checkbox(
        value: item.isSelected,
        onChanged: onChanged,
      ),
    );
  }

  String formatCurrency(double amount) {
    return amount.toStringAsFixed(0).replaceAllMapped(
        RegExp(r'\B(?=(\d{3})+(?!\d))'), (Match m) => '.');
  }
}
