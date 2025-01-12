import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PaymentPage(),
    );
  }
}

class PaymentPage extends StatefulWidget {
  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  String _selectedPaymentMethod;
  List<Map<String, dynamic>> orderItems = [
    {'name': 'Nasi Goreng', 'price': 25000},
    {'name': 'Mie Ayam', 'price': 20000},
  ];
  int deliveryFee = 12000;
  int serviceFee = 5000;
  int additionalFee = 2000;
  int shippingDiscount = 10000;
  int foodDiscount = 20000;

  int get subtotal {
    return orderItems.fold(0, (sum, item) => sum + item['price']);
  }

  int get totalPrice {
    return subtotal + deliveryFee + serviceFee + additionalFee - shippingDiscount - foodDiscount;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pembayaran'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Ringkasan Pesanan',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: orderItems.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(orderItems[index]['name']),
                    trailing: Text('Rp ${orderItems[index]['price']}'),
                  );
                },
              ),
            ),
            Divider(),
            Text(
              'Subtotal untuk 2 item: Rp $subtotal',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'Biaya Pengiriman: Rp $deliveryFee',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'Biaya Layanan: Rp $serviceFee',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'Biaya Tambahan Restoran: Rp $additionalFee',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'Diskon Pengiriman: -Rp $shippingDiscount',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'Diskon Makanan: -Rp $foodDiscount',
              style: TextStyle(fontSize: 16),
            ),
            Divider(),
            Text(
              'Total Pembayaran: Rp $totalPrice',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              'Metode Pembayaran',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            RadioListTile(
              title: Text('Tunai saat pengambilan'),
              value: 'cash',
              groupValue: _selectedPaymentMethod,
              onChanged: (value) {
                setState(() {
                  _selectedPaymentMethod = value;
                });
              },
            ),
            RadioListTile(
              title: Text('Transfer Bank'),
              value: 'bank_transfer',
              groupValue: _selectedPaymentMethod,
              onChanged: (value) {
                setState(() {
                  _selectedPaymentMethod = value;
                });
              },
            ),
            RadioListTile(
              title: Text('E-Wallet'),
              value: 'e_wallet',
              groupValue: _selectedPaymentMethod,
              onChanged: (value) {
                setState(() {
                  _selectedPaymentMethod = value;
                });
              },
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Logika pembayaran bisa ditambahkan di sini
                  print('Pesanan dibayar dengan $_selectedPaymentMethod');
                },
                child: Text('Bayar'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}