// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import '../models/product.dart';

// class ProductService {
//   final String baseUrl = 'https://tu-api.com';

//   Future<List<Product>> getProducts() async {
//     final response = await http.get(Uri.parse('$baseUrl/products'));

//     if (response.statusCode == 200) {
//       final List<dynamic> data = jsonDecode(response.body);
//       return data.map((item) => Product.fromJson(item)).toList();
//     } else {
//       throw Exception('Error al cargar productos');
//     }
//   }
// }
