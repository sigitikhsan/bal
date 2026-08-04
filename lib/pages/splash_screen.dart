import 'dart:async';
import 'package:flutter/material.dart';
import 'login_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {

  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    )..repeat(reverse: true);

    animation = Tween(
      begin: 0.7,
      end: 1.0,
    ).animate(controller);

    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => const LoginPage(),
        ),
      );
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(

        decoration: const BoxDecoration(

          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xff0D47A1),
              Color(0xff1565C0),
            ],
          ),

        ),

        child: SafeArea(

          child: Center(

            child: Column(

              mainAxisAlignment: MainAxisAlignment.center,

              children: [

                FadeTransition(

                  opacity: animation,

                  child: const Icon(
                    Icons.shield,
                    color: Colors.white,
                    size: 90,
                  ),

                ),

                const SizedBox(height: 20),

                const Text(
                  "BALAI MONITOR",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 8),

                const Text(
                  "Sistem Peminjaman Perangkat",
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 15,
                  ),
                ),

                const SizedBox(height: 45),

                const CircularProgressIndicator(
                  color: Colors.white,
                ),

                const SizedBox(height: 80),

                const Text(
                  "Versi 1.0.0",
                  style: TextStyle(
                    color: Colors.white54,
                  ),
                )

              ],
            ),
          ),
        ),
      ),
    );
  }
}