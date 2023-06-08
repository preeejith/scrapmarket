import 'package:flutter/material.dart';
import 'package:scrap_market/loginscreen.dart';
import 'package:scrap_market/prefmanager/prefmanager.dart';
import 'package:scrap_market/ui/seller/sellscrappage.dart';
import 'package:scrap_market/ui/seller/trackmyscrap.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? name = "";
  @override
  void initState() {
    _getname();
    super.initState();
  }

  _getname() async {
    name = await PrefManager.getUserId();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scrap Sell & Buy'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: InkWell(
              child: const Icon(Icons.logout),
              onTap: () async {
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                        builder: (context) => const LoginScreen()),
                    (Route<dynamic> route) => false);
                await PrefManager.clearToken();
              },
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Welcome $name',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SellScrapPage(),
                    ),
                  );
                },
                child: const Text('Sell Scrap'),
              ),
              const SizedBox(height: 10.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ScrapTrackerPage(),
                    ),
                  );
                },
                child: const Text('Track my Scrap'),
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
