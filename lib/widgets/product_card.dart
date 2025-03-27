import 'package:flutter/material.dart';
import '../models/product.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10), // Bordes redondeados
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: GridTile(
          footer: GridTileBar(
            backgroundColor: Colors.black87,
            title: Text(product.title, textAlign: TextAlign.center),
            subtitle: Text(
              '\$${product.price.toStringAsFixed(2)}',
              textAlign: TextAlign.center,
            ),
          ),
          child: Image.network(
            product.imageUrl,
            fit: BoxFit.cover, // La imagen se ajusta al tamaño del contenedor
            width: double.infinity,
            height: double.infinity,
            errorBuilder:
                (context, error, stackTrace) => const Icon(Icons.error),
          ),
        ),
      ),
    );
  }
}
