// import 'package:flutter/material.dart';
// import '../models/product.dart';
// import '../widgets/product_card.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'login_screen.dart';

// class HomeScreen extends StatelessWidget {
//   // Lista de productos simulados
//   final List<Product> products = [
//     Product(
//       id: '1',
//       title: 'Casco de Moto',
//       description: 'Casco para motociclistas de alta calidad.',
//       price: 120.00,
//       imageUrl:
//           'https://http2.mlstatic.com/D_NQ_NP_726973-MCO74423431126_022024-O.webp',
//     ),
//     Product(
//       id: '2',
//       title: 'Guantes para moto',
//       description: 'Guantes resistentes al agua y al frío.',
//       price: 35.00,
//       imageUrl:
//           'https://http2.mlstatic.com/D_NQ_NP_958195-MCO46079244250_052021-O.webp',
//     ),
//     Product(
//       id: '3',
//       title: 'Chaqueta para moto',
//       description: 'Chaqueta protectora para motociclistas.',
//       price: 85.00,
//       imageUrl:
//           'https://http2.mlstatic.com/D_NQ_NP_869554-MCO70088068745_062023-O.webp',
//     ),
//   ];

//   Future<void> _logout(BuildContext context) async {
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.clear();

//     Navigator.of(
//       context,
//     ).pushReplacement(MaterialPageRoute(builder: (ctx) => LoginScreen()));
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Tienda de Motocicletas'),
//         actions: [
//           IconButton(
//             onPressed: () => _logout(context),
//             icon: const Icon(Icons.exit_to_app),
//           ),
//         ],
//       ),
//       body: GridView.builder(
//         padding: const EdgeInsets.all(10),
//         itemCount: products.length,
//         itemBuilder: (ctx, index) => ProductCard(product: products[index]),
//         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 2, // Dos columnas
//           childAspectRatio: 3 / 2,
//           crossAxisSpacing: 10,
//           mainAxisSpacing: 10,
//         ),
//       ),
//     );
//   }
// }
