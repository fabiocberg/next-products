import 'dart:io';
import 'dart:convert';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class EditCreateProductScreen extends StatefulWidget {
  final Map<String, dynamic>?
      product; // Pass null for create, or a product map for edit.

  const EditCreateProductScreen({Key? key, this.product}) : super(key: key);

  @override
  State<EditCreateProductScreen> createState() =>
      _EditCreateProductScreenState();
}

class _EditCreateProductScreenState extends State<EditCreateProductScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  String? _imageUrl;
  String? base64Image;

  @override
  void initState() {
    super.initState();
    if (widget.product != null) {
      _nameController.text = widget.product!['name'] ?? '';
      _descriptionController.text = widget.product!['description'] ?? '';
      _priceController.text = widget.product!['price']?.toString() ?? '';
      _imageUrl = widget.product!['imageUrl'];
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    _priceController.dispose();
    super.dispose();
  }

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();

    // Capture an image using the camera
    final XFile? image = await picker.pickImage(source: ImageSource.camera);

    if (image != null) {
      // Read image as bytes
      final bytes = await image.readAsBytes();

      // Convert bytes to Base64
      setState(() {
        base64Image = base64Encode(bytes);
      });

      print("Base64 Encoded Image: $base64Image");
    } else {
      print("No image selected.");
    }
  }

  Future<void> _addProduct() async {
    if (_nameController.text.isEmpty || _priceController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please enter all fields!')),
      );
      return;
    }

    DatabaseReference ref = FirebaseDatabase.instance.ref("products");

    await ref.set({
      'picture': base64Image,
      'name': _nameController.text.trim(),
      'price': double.tryParse(_priceController.text.trim()) ?? 0.0,
      'createdAt': FieldValue.serverTimestamp(),
    });

    // return to previous screen
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.product == null ? 'Create Product' : 'Edit Product'),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: _addProduct,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              if (_imageUrl != null)
                Image.file(
                  File(_imageUrl!),
                  height: 150,
                  fit: BoxFit.cover,
                )
              else
                Placeholder(
                  fallbackHeight: 150,
                  strokeWidth: 2,
                ),
              TextButton.icon(
                icon: Icon(Icons.camera_alt),
                label: Text('Take Photo'),
                onPressed: _pickImage,
              ),
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Product Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a product name.';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _descriptionController,
                decoration: InputDecoration(labelText: 'Description'),
                maxLines: 3,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a product description.';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _priceController,
                decoration: InputDecoration(labelText: 'Price'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a price.';
                  }
                  if (double.tryParse(value) == null) {
                    return 'Please enter a valid number.';
                  }
                  return null;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
