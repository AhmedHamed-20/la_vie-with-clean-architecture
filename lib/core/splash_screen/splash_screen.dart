import 'dart:async';

import 'package:flutter/material.dart';

import '../constants/constants.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key, required this.accessToken}) : super(key: key);
  final String accessToken;
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(milliseconds: 1500), () async {
      String startApp;

      if (widget.accessToken == '') {
        startApp = AppRoutesNames.loginScreen;
      } else {
        startApp = AppRoutesNames.homeScreen;
      }
      Navigator.of(context).pushNamedAndRemoveUntil(startApp, (route) => false);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Center(
        child: Container(
          width: 200,
          height: 200,
          padding: const EdgeInsets.all(30),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: Theme.of(context).backgroundColor,
          ),
          child: Center(
            child: Image.asset(
              'assets/images/logo.png',
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}
