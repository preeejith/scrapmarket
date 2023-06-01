import 'package:flutter/material.dart';

class BuyerRegistration extends StatefulWidget {
  const BuyerRegistration({super.key});

  @override
  State<BuyerRegistration> createState() => _BuyerRegistrationState();
}

class _BuyerRegistrationState extends State<BuyerRegistration> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController organizationController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController pincodeController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController districtController = TextEditingController();
  final TextEditingController townController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // title: const Text('Buyer Registration'),
          ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Registration Form',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20.0),
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: 'Name',
                ),
              ),
              const SizedBox(height: 10.0),
              TextField(
                controller: organizationController,
                decoration: const InputDecoration(
                  labelText: 'Organization',
                ),
              ),
              const SizedBox(height: 10.0),
              TextField(
                controller: phoneController,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  labelText: 'Phone',
                ),
              ),
              const SizedBox(height: 10.0),
              TextField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: 'Email',
                ),
              ),
              const SizedBox(height: 10.0),
              TextField(
                controller: pincodeController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Pincode',
                ),
              ),
              const SizedBox(height: 10.0),
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Password',
                ),
              ),
              const SizedBox(height: 10.0),
              TextField(
                controller: districtController,
                decoration: const InputDecoration(
                  labelText: 'District',
                ),
              ),
              const SizedBox(height: 10.0),
              TextField(
                controller: townController,
                decoration: const InputDecoration(
                  labelText: 'Town',
                ),
              ),
              const SizedBox(height: 20.0),
              const SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  // Add registration functionality here
                },
                child: const Text('Register'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
