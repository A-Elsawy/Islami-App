import 'dart:async';
import 'package:flutter/material.dart';
import 'package:islamic_app/layout/home_layout.dart';
import 'package:provider/provider.dart';

import '../provider/app_provider.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = "splash-screen";

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(
      const Duration(seconds: 3),
      () {
        Navigator.pushReplacementNamed(context, HomeScreen.routeName);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    var appProvider = Provider.of<AppProvider>(context);
    return Scaffold(
      backgroundColor: appProvider.splashBgColor(),
      body: Center(
        child: Image(
          image: AssetImage(
            appProvider.splashImage(),
          ),
          width: mediaQuery.width,
          height: mediaQuery.height,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
