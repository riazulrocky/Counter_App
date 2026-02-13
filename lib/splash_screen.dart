import 'dart:async';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  final bool isDarkMode;
  final VoidCallback onFinished;

  const SplashScreen({super.key, required this.isDarkMode, required this.onFinished});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);

    _controller.forward();

    // Navigate to home after 3 seconds
    Timer(const Duration(seconds: 3), () {
      widget.onFinished();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final primaryGreen = Colors.green.shade600;

    return Scaffold(
      backgroundColor: widget.isDarkMode ? const Color(0xFF020617) : Colors.white,
      body: Center(
        child: FadeTransition(
          opacity: _fadeAnimation,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // 🌙 Moon Icon on top of the name
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: primaryGreen.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: const Text(
                  "🌙",
                  style: TextStyle(fontSize: 60),
                ),
              ),
              const SizedBox(height: 24),
              // App Name - Only text, no icon here
              Text(
                "Noorify",
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: widget.isDarkMode ? Colors.white : primaryGreen,
                  letterSpacing: 1.5,
                ),
              ),
              const SizedBox(height: 12),
              // Slogan
              const Text(
                "ইবাদতের পথে নূরের আলো",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 50),
              // Loading Indicator
              SizedBox(
                width: 40,
                height: 40,
                child: CircularProgressIndicator(
                  strokeWidth: 3,
                  color: primaryGreen,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
