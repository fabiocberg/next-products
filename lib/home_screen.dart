import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'edit_create_product_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map<String, dynamic>> products = [];

  @override
  void initState() {
    super.initState();

    _loadData();
  }

  Future<void> _loadData() async {
    final products = FirebaseDatabase.instance.ref('products');
    products.onValue.listen((event) {
      final data = event.snapshot.value as Map;
      products.set(data);
    });
  }

  EditCreateProductScreen _navigateToEditScreen(BuildContext context) {
    return EditCreateProductScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return ListTile(
            title: Text(product['name']),
            subtitle: Text(product['description']),
            trailing: Text('\$${product['price']}'),
            onTap: () {
              // Navigate to Edit Screen with product data
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => _navigateToEditScreen(context)),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          // Navigate to Create Screen (no product data passed)
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => _navigateToEditScreen(context),
            ),
          );
        },
      ),
    );
  }
}
