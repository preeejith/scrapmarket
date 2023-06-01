import 'package:flutter/material.dart';

class ProductViewPage extends StatefulWidget {
  final String category;
  final String metal;
  final String quantity;
  final String description;
  final String location;

  const ProductViewPage({
    super.key,
    required this.category,
    required this.metal,
    required this.quantity,
    required this.description,
    required this.location,
  });

  @override
  State<ProductViewPage> createState() => _ProductViewPageState();
}

class _ProductViewPageState extends State<ProductViewPage> {
  final TextEditingController price = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Category:',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            Text(widget.category),
            const SizedBox(height: 16.0),
            const Text(
              'Metal:',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            Text(widget.metal),
            const SizedBox(height: 16.0),
            const Text(
              'Quantity:',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            Text(widget.quantity),
            const SizedBox(height: 16.0),
            const Text(
              'Description:',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            Text(widget.description),
            const SizedBox(height: 16.0),
            const Text(
              'Location:',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            Text(widget.location),
            const SizedBox(height: 8.0),
            Text(widget.location),
            const SizedBox(height: 32.0),
            Center(
              child: SizedBox(
                width: 100,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: price,
                    decoration: const InputDecoration(
                      labelText: 'Amount',
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 32.0),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Implement buy logic here
                },
                child: const Text('Buy Request'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: ProductViewPage(
      category: 'Category 1',
      metal: 'Metal 1',
      quantity: '10',
      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
      location: 'New York',
    ),
  ));
}
