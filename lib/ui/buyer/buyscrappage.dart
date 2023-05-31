import 'package:flutter/material.dart';
import 'package:scrap_market/ui/buyer/scrapdetailed.dart';

class BuyScrapPage extends StatefulWidget {
  const BuyScrapPage({super.key});

  @override
  _BuyScrapPageState createState() => _BuyScrapPageState();
}

class _BuyScrapPageState extends State<BuyScrapPage> {
  final List<String> _sellers = [
    'Seller 1',
    'Seller 2',
    'Seller 3',
    'Seller 4',
    'Seller 5',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buy Scrap'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Buy Scrap',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20.0),
            Expanded(
              child: ListView.builder(
                itemCount: _sellers.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(_sellers[index]),
                      trailing: const Icon(Icons.arrow_forward),
                      onTap: () {
                        // Add functionality to navigate to seller details page
                        navigateToSellerDetails(_sellers[index]);
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void navigateToSellerDetails(String sellerName) {
    // Add functionality to navigate to the seller details page
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const ProductViewPage(
            category: "dc",
            metal: "c",
            quantity: "3",
            description: "adc",
            location: "kdnsv"),

        // SellerDetailsPage(sellerName: sellerName),
      ),
    );
  }
}

class SellerDetailsPage extends StatelessWidget {
  final String sellerName;

  const SellerDetailsPage({super.key, required this.sellerName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Seller Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Seller Details',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20.0),
            Text(
              'Seller Name: $sellerName',
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
            // Add more seller details here as needed
          ],
        ),
      ),
    );
  }
}
