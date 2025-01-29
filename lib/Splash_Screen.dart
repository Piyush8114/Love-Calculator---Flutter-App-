import 'dart:async';
import 'package:flutter/material.dart';
import 'package:love_calculator/HomePage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _animatedContainer;
  late Animation<double> _scaleController;

  @override
  void initState() {
    super.initState();

    // Initialize AnimationController
    _animatedContainer = AnimationController(
      vsync: this, // This provides a Ticker
      duration: const Duration(seconds: 2),
    );

    // Define the animation curve
    _scaleController = CurvedAnimation(
      parent: _animatedContainer,
      curve: Curves.bounceInOut,
    );

    // Start the animation
    _animatedContainer.forward();

    // Navigate to Homepage after 3 seconds
    Timer(
      const Duration(seconds: 3),
          () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const Homepage(),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    // Dispose of the AnimationController
    _animatedContainer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomSheet: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(8.0),
        child: const Text(
          "Powered By Piyush",
          style: TextStyle(fontSize: 15, color: Colors.black, fontWeight: FontWeight.w600),
        ),
      ),
      body: Center(
        child: ScaleTransition(
          scale: _scaleController,
          child: Image.asset('assets/splashLove.png'),
        ),
      ),
    );
  }
}
