import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String name;
  final double price;
  final String image;

  const ProductCard({
    required this.name,
    required this.price,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: Image.asset(image, width: 50, height: 50, fit: BoxFit.cover),
        title: Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text('R\$${price.toStringAsFixed(2)}'),
        trailing: IconButton(
          icon: Icon(Icons.edit),
          onPressed: () {
            // Navegar para a tela de edição
          },
        ),
      ),
    );
  }
}
