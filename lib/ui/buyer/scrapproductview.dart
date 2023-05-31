import 'package:flutter/material.dart';

class ProductUploadPage extends StatefulWidget {
  const ProductUploadPage({super.key});

  @override
  _ProductUploadPageState createState() => _ProductUploadPageState();
}

class _ProductUploadPageState extends State<ProductUploadPage> {
  String? selectedCategory;
  String? selectedMetal;
  String? quantity;
  String? description;
  String? location;

  List<String> categories = [
    'Category 1',
    'Category 2',
    'Category 3',
    // Add more categories here
  ];

  List<String> metals = [
    'Metal 1',
    'Metal 2',
    'Metal 3',
    // Add more metals here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Upload'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Select Category:',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            DropdownButtonFormField<String>(
              value: selectedCategory,
              items: categories.map((category) {
                return DropdownMenuItem<String>(
                  value: category,
                  child: Text(category),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedCategory = value;
                });
              },
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Select Metal:',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            DropdownButtonFormField<String>(
              value: selectedMetal,
              items: metals.map((metal) {
                return DropdownMenuItem<String>(
                  value: metal,
                  child: Text(metal),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedMetal = value;
                });
              },
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Quantity',
              ),
              onChanged: (value) {
                setState(() {
                  quantity = value;
                });
              },
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Description',
              ),
              onChanged: (value) {
                setState(() {
                  description = value;
                });
              },
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Location',
              ),
              onChanged: (value) {
                setState(() {
                  location = value;
                });
              },
            ),
            const SizedBox(height: 32.0),
            ElevatedButton(
              onPressed: () {
                // Implement upload logic here
              },
              child: const Text('Upload Product'),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: ProductUploadPage(),
  ));
}
