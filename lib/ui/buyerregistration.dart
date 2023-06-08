import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:scrap_market/loginscreen.dart';

import '../bloc/authbloc.dart';

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
              // const SizedBox(height: 20.0),
              // TextField(
              //   controller: pincodeController,
              //   decoration: const InputDecoration(
              //     labelText: 'Pincode',
              //   ),
              // ),
              const SizedBox(height: 20.0),
              const SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  BlocProvider.of<LoginBloc>(context).add(
                      GetUserRegistrationEvent(
                          isuser: false,
                          name: nameController.text,
                          phone: phoneController.text,
                          email: emailController.text,
                          password: passwordController.text,
                          district: districtController.text,
                          town: townController.text,
                          pincode: pincodeController.text,
                          place: townController.text,
                          orgaisation: organizationController.text

                          // orgaisation: orgaisation.text,
                          ));
                },
                child: BlocConsumer<LoginBloc, LoginState>(
                  builder: (context, state) {
                    if (state is UserRegistering) {
                      return const SizedBox(
                        height: 18.0,
                        width: 18.0,
                        child: CircularProgressIndicator(
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.black),
                          strokeWidth: 2,
                        ),
                      );
                    } else {
                      return const Text('Register');
                    }
                  },
                  listener: (context, state) {
                    if (state is RegUserSucces) {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginScreen()));
                    } else if (state is UserRegError) {
                      Fluttertoast.showToast(
                        msg: state.error,
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
