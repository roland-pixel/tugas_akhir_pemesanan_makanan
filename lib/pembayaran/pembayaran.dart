import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PaymentPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class PaymentPage extends StatefulWidget {
  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  String _selectedPaymentMethod = '';
  List<Map<String, dynamic>> orderItems = [
    {'name': 'Tumpeng Spesial Merah Putih', 'price': 150000, 'image': 'assets/images/menu/tumpeng.jpg'},
    {'name': 'Puding Buah', 'price': 30000, 'image': 'assets/images/menu/puding.jpg'},
    {'name': 'Lemon Tea', 'price': 20000, 'image': 'assets/images/menu/lemontea.jpg'},
  ];
  int deliveryFee = 12000;
  int serviceFee = 5000;
  int additionalFee = 2000;
  int shippingDiscount = 10000;
  int foodDiscount = 20000;

  int get subtotal {
    return orderItems.fold(0, (sum, item) {
      int price = item['price'] ?? 0; // Pastikan harga valid
      return sum + price;
    });
  }

  int get totalPrice {
    return subtotal +
        deliveryFee +
        serviceFee +
        additionalFee - 
        shippingDiscount - 
        foodDiscount;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pembayaran', style: TextStyle(color: Colors.white)),
        backgroundColor: Color(0xFFD32F2F), // Red color for consistency
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Ringkasan Pesanan',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              _buildOrderSummary(),
              Divider(),
              _buildPriceDetails(),
              Divider(),
              Text(
                'Total Pembayaran: Rp $totalPrice',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFFD32F2F)),
              ),
              SizedBox(height: 20),
              Text(
                'Metode Pembayaran',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              _buildPaymentOptions(),
              SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (_selectedPaymentMethod.isEmpty) {
                      _showErrorDialog(context, 'Silakan pilih metode pembayaran.');
                    } else {
                      _showSuccessDialog(context);
                    }
                  },
                  child: Text('Bayar'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFD32F2F), // Red button for consistency
                    minimumSize: Size(MediaQuery.of(context).size.width - 32, 50),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOrderSummary() {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: orderItems.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: Image.asset(
            orderItems[index]['image'],
            width: 50,
            height: 50,
            fit: BoxFit.cover,
          ),
          title: Text(orderItems[index]['name']),
          trailing: Text('Rp ${orderItems[index]['price']}'),
        );
      },
    );
  }

  Widget _buildPriceDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Subtotal untuk ${orderItems.length} item: Rp $subtotal', style: TextStyle(fontSize: 16)),
        Text('Biaya Pengiriman: Rp $deliveryFee', style: TextStyle(fontSize: 16)),
        Text('Biaya Layanan: Rp $serviceFee', style: TextStyle(fontSize: 16)),
        Text('Biaya Tambahan Restoran: Rp $additionalFee', style: TextStyle(fontSize: 16)),
        Text('Diskon Pengiriman: -Rp $shippingDiscount', style: TextStyle(fontSize: 16)),
        Text('Diskon Makanan: -Rp $foodDiscount', style: TextStyle(fontSize: 16)),
      ],
    );
  }

  Widget _buildPaymentOptions() {
    return Column(
      children: [
        RadioListTile(
          title: Text('Tunai saat pengambilan'),
          value: 'cash',
          groupValue: _selectedPaymentMethod,
          onChanged: (value) {
            setState(() {
              _selectedPaymentMethod = value!;
            });
          },
        ),
        RadioListTile(
          title: Text('Transfer Bank'),
          value: 'bank_transfer',
          groupValue: _selectedPaymentMethod,
          onChanged: (value) {
            setState(() {
              _selectedPaymentMethod = value!;
            });
          },
        ),
        RadioListTile(
          title: Text('E-Wallet'),
          value: 'e_wallet',
          groupValue: _selectedPaymentMethod,
          onChanged: (value) {
            setState(() {
              _selectedPaymentMethod = value!;
            });
          },
        ),
      ],
    );
  }

  void _showErrorDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Error'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

  void _showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Berhasil'),
        content: Text('Pesanan dibayar dengan $_selectedPaymentMethod.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('OK'),
          ),
        ],
      ),
    );
  }
}