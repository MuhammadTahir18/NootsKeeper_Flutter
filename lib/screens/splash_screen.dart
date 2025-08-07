import 'dart:async';
import 'package:flutter/material.dart';
import 'package:notes_keeper_app_flutter/screens/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState(); // Always call super.initState()
    Timer(Duration(seconds: 2), () {
      Navigator.pushReplacement( // Replaces splash screen
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 80,
          height: 80,
          child: Image.asset('assets/logo.jpeg'), // cleaner way
        ),
      ),
    );
  }
}
