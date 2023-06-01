import 'package:flutter/material.dart';
import 'package:scrap_market/ui/seller/trackdetailed.dart';

class ScrapTrackerPage extends StatefulWidget {
  const ScrapTrackerPage({super.key});

  @override
  _ScrapTrackerPageState createState() => _ScrapTrackerPageState();
}

class _ScrapTrackerPageState extends State<ScrapTrackerPage> {
  List<ScrapProduct> scrapProducts = [
    ScrapProduct('29/05/2023', false),
    ScrapProduct('28/05/2023', true),
    ScrapProduct('27/05/2023', true),
    ScrapProduct('31/05/2023', false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scrap Tracker'),
      ),
      body: ListView.builder(
        itemCount: scrapProducts.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: InkWell(
              child: Text(scrapProducts[index].name),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const OrderTrackerPage()));
              },
            ),
            leading: Icon(
              scrapProducts[index].accepted ? Icons.check_circle : Icons.error,
              color: scrapProducts[index].accepted ? Colors.green : Colors.red,
            ),
          );
        },
      ),
    );
  }
}

class ScrapProduct {
  String name;
  bool accepted;

  ScrapProduct(this.name, this.accepted);
}
