import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class CustomBottomNav extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNav({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,

      selectedItemColor: AppColors.primary,

      unselectedItemColor: Colors.grey,

      type: BottomNavigationBarType.fixed,

      onTap: onTap,

      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_rounded),
          label: "Beranda",
        ),

        BottomNavigationBarItem(icon: Icon(Icons.devices), label: "Perangkat"),

        BottomNavigationBarItem(icon: Icon(Icons.history), label: "Riwayat"),

        BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profil"),
      ],
    );
  }
}
