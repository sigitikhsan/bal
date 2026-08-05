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

    animation = Tween<double>(
      begin: 0.7,
      end: 1.0,
    ).animate(controller);

    Timer(const Duration(seconds: 3, milliseconds: 500), () {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => const LoginPage(),
          ),
        );
      }
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
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              'assets/images/background_screen_image.png',
              fit: BoxFit.cover,
            ),
          ),

          // Overlay biru agar teks tetap jelas
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.blue.shade900.withOpacity(0.65),
              ),
            ),
          ),

          SafeArea(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // FITUR LOGO IMAGE (Dengan Efek Animasi)
                  CircleAvatar(
                    radius: 60, // Setengah dari lebar yang diinginkan (120 / 2)
                    backgroundImage: AssetImage('assets/images/logo_apk.png'),
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
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}