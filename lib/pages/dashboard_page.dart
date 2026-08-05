import 'package:flutter/material.dart'; 
import 'device_page.dart';
import 'loan/pemilihan_peminjaman_page.dart';
import 'profil/profil_page.dart';
import 'status/status_page.dart';
import 'history/history_page.dart';
import 'return/pengembalian_page.dart';

import '../theme/app_colors.dart';
import '../widgets/custom_button_nav.dart';
import '../widgets/info_card.dart';
import '../widgets/menu_card.dart';
import '../widgets/section_title.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      //================ APPBAR / HEADER BERGRADIEN =================//
      appBar: AppBar(
        automaticallyImplyLeading: false, // <-- Menghilangkan tombol back
        elevation: 0,
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.white,
        centerTitle: false,
        toolbarHeight: 90,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [AppColors.primaryDark, AppColors.primary],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        title: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ProfilePage(),
              ),
            );
          },
          child: Row(
            children: [
              const CircleAvatar(
                radius: 24,
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.person,
                  color: AppColors.primary,
                  size: 28,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "Halo, Andi Pratama ",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 2),
                    Text(
                      "Selamat datang di Balai Monitor",
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notifications_none,
              color: Colors.white,
            ),
          ),
          const SizedBox(width: 8),
        ],
      ),

      //================ BODY =================//
      body: SafeArea(
        top: false,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SectionTitle(title: "Informasi Peminjaman"),

                    Row(
                      children: const [
                        InfoCard(
                          title: "Sedang Dipinjam",
                          value: "2",
                          color: Colors.blue,
                          icon: Icons.inventory,
                        ),

                        SizedBox(width: 12),

                        InfoCard(
                          title: "Menunggu",
                          value: "1",
                          color: Colors.orange,
                          icon: Icons.schedule,
                        ),
                      ],
                    ),

                    const SizedBox(height: 12),

                    Row(
                      children: const [
                        InfoCard(
                          title: "Selesai",
                          value: "5",
                          color: Colors.green,
                          icon: Icons.check_circle,
                        ),

                        SizedBox(width: 12),

                        InfoCard(
                          title: "Ditolak",
                          value: "0",
                          color: Colors.red,
                          icon: Icons.cancel,
                        ),
                      ],
                    ),

                    const SizedBox(height: 25),

                    const SectionTitle(title: "Menu"),

                    MenuCard(
                      icon: Icons.assignment,
                      title: "Ajukan Peminjaman",
                      subtitle: "Ajukan perangkat yang dibutuhkan",
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const PemilihanPeminjamanPage(),
                          ),
                        );
                      },
                    ),

                    MenuCard(
                      icon: Icons.pending_actions,
                      title: "Status Peminjaman",
                      subtitle: "Lihat status permohonan",
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const StatusPage(),
                          ),
                        );
                      },
                    ),

                    MenuCard(
                      icon: Icons.keyboard_return,
                      title: "Pengembalian Perangkat",
                      subtitle: "Kembalikan perangkat",
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ReturnPage(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

      //================ BOTTOM NAVIGATION =================//
      bottomNavigationBar: CustomBottomNav(
        currentIndex: selectedIndex,
        onTap: (index) {
          if (index == 0) {
            return;
          }

          if (index == 1) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const DevicePage(),
              ),
            );
          }

          if (index == 2) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const HistoryPage(),
              ),
            );
          }

          if (index == 3) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const ProfilePage(),
              ),
            );
          }
        },
      ),
    );
  }
}