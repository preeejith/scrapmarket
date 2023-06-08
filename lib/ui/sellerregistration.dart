import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:scrap_market/loginscreen.dart';

import '../bloc/authbloc.dart';

class SelleRegistration extends StatefulWidget {
  const SelleRegistration({super.key});

  @override
  State<SelleRegistration> createState() => _SelleRegistrationState();
}

class _SelleRegistrationState extends State<SelleRegistration> {
  final TextEditingController name = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController district = TextEditingController();
  final TextEditingController town = TextEditingController();

  final TextEditingController street = TextEditingController();
  final TextEditingController buildingNo = TextEditingController();

  final TextEditingController houseNo = TextEditingController();
  final TextEditingController landmark = TextEditingController();

  final TextEditingController pincode = TextEditingController();
  final TextEditingController place = TextEditingController();
  final TextEditingController state = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // title: const Text('Registration Seller'),
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
              ),
              const SizedBox(height: 20.0),
              TextFormField(
                controller: name,
                decoration: const InputDecoration(
                  labelText: 'Name',
                ),
              ),
              const SizedBox(height: 10.0),
              TextFormField(
                controller: phone,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Phone',
                ),
              ),
              const SizedBox(height: 10.0),
              TextFormField(
                controller: email,
                decoration: const InputDecoration(
                  labelText: 'Email',
                ),
              ),
              const SizedBox(height: 10.0),
              TextFormField(
                controller: district,
                decoration: const InputDecoration(
                  labelText: 'District',
                ),
              ),
              const SizedBox(height: 10.0),
              TextFormField(
                controller: town,
                decoration: const InputDecoration(
                  labelText: 'Town',
                ),
              ),
              const SizedBox(height: 10.0),
              TextFormField(
                controller: street,
                decoration: const InputDecoration(
                  labelText: 'Street',
                ),
              ),
              const SizedBox(height: 10.0),
              TextFormField(
                controller: buildingNo,
                decoration: const InputDecoration(
                  labelText: 'Building No.',
                ),
              ),
              const SizedBox(height: 10.0),
              TextFormField(
                controller: houseNo,
                decoration: const InputDecoration(
                  labelText: 'House Number',
                ),
              ),
              const SizedBox(height: 10.0),
              TextFormField(
                controller: pincode,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Pincode',
                ),
              ),
              const SizedBox(height: 10.0),
              TextFormField(
                controller: landmark,
                decoration: const InputDecoration(
                  labelText: 'Landmark',
                ),
              ),
              const SizedBox(height: 10.0),
              TextFormField(
                controller: password,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Password',
                ),
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  BlocProvider.of<LoginBloc>(context)
                      .add(GetUserRegistrationEvent(
                    isuser: true,
                    name: name.text,
                    phone: phone.text,
                    email: email.text,
                    password: password.text,
                    district: district.text,
                    town: town.text,
                    street: street.text,
                    buildingNo: buildingNo.text,
                    houseNo: houseNo.text,
                    landmark: landmark.text,

                    pincode: pincode.text,
                    place: place.text,
                    // orgaisation: orgaisation.text,
                  ));
                  // Add registration functionality here
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
