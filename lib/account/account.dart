// import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Food Ordering App',
//       theme: ThemeData(
//         primarySwatch: Colors.green,
//       ),
//       home: MyHomePage(),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: Icon(Icons.menu),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.shopping_cart),
//             onPressed: () {},
//           ),
//         ],
//         title: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             CircleAvatar(
//               backgroundImage: AssetImage('assets/profile.png'), // Replace with your profile image
//             ),
//             Text('Ninn - 宝婵'),
//             Container(
//               padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(16),
//                 color: Colors.green[400],
//               ),
//               child: Text('VIP', style: TextStyle(color: Colors.white)),
//             ),
//           ],
//         ),
//         backgroundColor: Colors.green[300],
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Container(
//               padding: EdgeInsets.all(16),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     'Rp 980.528',
//                     style: TextStyle(
//                       fontSize: 24,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   SizedBox(height: 8),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Column(
//                         children: [
//                           Text('186', style: TextStyle(fontSize: 16)),
//                           Text('Buy