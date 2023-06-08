import 'package:flutter/material.dart';
import 'package:scrap_market/homescreen.dart';
import 'package:scrap_market/loginscreen.dart';
import 'package:scrap_market/prefmanager/prefmanager.dart';
import 'package:scrap_market/ui/buyer/buyerhome.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    getToken();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 200,
          height: 200,
          child: Image.asset(
            'assets/tree.png',
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }

  Future<void> getToken() async {
    // Helper.pushReplacement(context, const Authentication());
    var token = await PrefManager.getToken();
    var role = await PrefManager.getRole();
    debugPrint(token);
    if (token != null) {
      debugPrint("token $token ${DateTime.now()}");
      await Future.delayed(const Duration(seconds: 2));
      if (mounted) {
        if (role == "User") {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const HomePage()));
        } else {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const BuyerHomePage()));
        }
      }
    } else {
      await Future.delayed(const Duration(seconds: 2));
      if (mounted) {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const LoginScreen()));
      }
    }
  }
}
