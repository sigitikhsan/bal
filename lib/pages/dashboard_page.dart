import 'package:flutter/material.dart'; 
import 'ajukan_peminjaman.dart';
import 'device_page.dart';

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

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              //================ HEADER =================//
              Container(
                width: double.infinity,

                padding: const EdgeInsets.fromLTRB(20, 20, 20, 35),

                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [AppColors.primaryDark, AppColors.primary],

                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),

                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                ),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    Row(
                      children: [
                        const CircleAvatar(
                          radius: 28,

                          backgroundColor: Colors.white,

                          child: Icon(
                            Icons.person,
                            color: AppColors.primary,
                            size: 30,
                          ),
                        ),

                        const SizedBox(width: 15),

                        const Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,

                            children: [
                              Text(
                                "Halo, Andi Pratama 👋",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              SizedBox(height: 4),

                              Text(
                                "Selamat datang di Balai Monitor",
                                style: TextStyle(color: Colors.white70),
                              ),
                            ],
                          ),
                        ),

                        IconButton(
                          onPressed: () {},

                          icon: const Icon(
                            Icons.notifications_none,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              //================ BODY =================//
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
                            builder: (context) => const AjukanPeminjamanPage(),
                          ),
                        );
                      }, 
                        // menuju halaman peminjaman
                    ),

                    MenuCard(
                      icon: Icons.pending_actions,

                      title: "Status Peminjaman",

                      subtitle: "Lihat status permohonan",

                      onTap: () {},
                    ),

                    MenuCard(
                      icon: Icons.history,

                      title: "Riwayat Peminjaman",

                      subtitle: "Riwayat peminjaman perangkat",

                      onTap: () {},
                    ),

                    MenuCard(
                      icon: Icons.keyboard_return,

                      title: "Pengembalian Perangkat",

                      subtitle: "Kembalikan perangkat",

                      onTap: () {},
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

      bottomNavigationBar: CustomBottomNav(
        currentIndex: selectedIndex,

        onTap: (index) {
          if (index == 0) {
            return;
          }

          if (index == 1) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const DevicePage(),
                ),
              );
            }

          if (index == 2) {
              // Nanti menuju halaman riwayat
            }

          if (index == 3) {
          // Nanti menuju halaman profil
          }
        },
      ),
    );
  }
}
