import 'package:flutter/material.dart';
import 'package:scrap_market/ui/buyer/buyscrappage.dart';

class BuyerHomePage extends StatelessWidget {
  const BuyerHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scrap  Buy'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Welcome to Scrap Buy',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20.0),
              // ElevatedButton(
              //   onPressed: () {
              //     Navigator.push(
              //       context,
              //       MaterialPageRoute(
              //         builder: (context) => const SellScrapPage(),
              //       ),
              //     );
              //   },
              //   child: const Text('Sell Scrap'),
              // ),
              const SizedBox(height: 10.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const BuyScrapPage(),
                    ),
                  );
                },
                child: const Text('Buy Scrap'),
              ),
              const Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Our Services',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 20.0),
                    ServiceCard(
                      icon: Icons.local_shipping,
                      title: 'Door-to-Door Transport',
                      description:
                          'We provide convenient door-to-door transport services to pick up and deliver your scrap materials.',
                    ),
                    SizedBox(height: 10.0),
                    ServiceCard(
                      icon: Icons.security,
                      title: 'Secure Payments',
                      description:
                          'We ensure secure and reliable payment methods to protect your transactions during scrap buying and selling.',
                    ),
                    SizedBox(height: 10.0),
                    ServiceCard(
                      icon: Icons.airport_shuttle,
                      title: 'Deportations',
                      description:
                          'We handle all necessary deportations and legal procedures to ensure compliance and smooth scrap transactions.',
                    ),
                    SizedBox(height: 10.0),
                    ServiceCard(
                      icon: Icons.verified_user,
                      title: 'Verified Professionals',
                      description:
                          'We work exclusively with verified professionals in the scrap industry to ensure reliable and trustworthy transactions.',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ServiceCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const ServiceCard({
    Key? key,
    required this.icon,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              icon,
              size: 40,
            ),
            const SizedBox(height: 10.0),
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10.0),
            Text(
              description,
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
