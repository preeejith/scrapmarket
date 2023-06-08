import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:scrap_market/homescreen.dart';
import 'package:scrap_market/ui/buyer/buyerhome.dart';
import 'package:scrap_market/ui/buyerregistration.dart';
import 'package:scrap_market/ui/sellerregistration.dart';

import 'bloc/authbloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Welcome to the Left Over',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20.0),
                TextFormField(
                  controller: email,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                  ),
                ),
                const SizedBox(height: 20.0),
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
                    if (email.text.isEmpty) {
                      Fluttertoast.showToast(msg: "Pls enter your gmail ");
                    } else if (password.text.isEmpty) {
                      Fluttertoast.showToast(msg: "Pls enter your password ");
                    } else {
                      BlocProvider.of<LoginBloc>(context).add(GetLoginEvent(
                        email: email.text,
                        password: password.text,
                      ));
                    }

                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => const HomePage()));
                  },
                  child: BlocConsumer<LoginBloc, LoginState>(
                    builder: (context, state) {
                      if (state is Requesting) {
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
                        return const Text('Login');
                      }
                    },
                    listener: (context, state) {
                      if (state is LoginSuccess) {
                        if (state.loginModel.role == "User") {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const HomePage()));
                        } else {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const BuyerHomePage()));
                        }
                      } else if (state is LoginError) {
                        Fluttertoast.showToast(
                          msg: state.error,
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                        );
                      }
                    },
                  ),
                ),
                // const SizedBox(height: 20.0),
                // ElevatedButton(
                //   onPressed: () {
                //     Navigator.push(
                //         context,
                //         MaterialPageRoute(
                //             builder: (context) => const BuyerHomePage()));
                //   },
                //   child: const Text('BuyerLogin'),
                // ),
                const SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const BuyerRegistration()));
                      },
                      child: const Text('Register as Buyer'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const SelleRegistration()));
                      },
                      child: const Text('Register as Seller'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
