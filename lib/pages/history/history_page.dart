import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';
import '../../widgets/custom_button_nav.dart';
import '../dashboard_page.dart';
import '../device_page.dart';
import 'history_detail_page.dart';
import '../profil/profil_page.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  final searchController = TextEditingController();

  String filter = "Semua";
  int selectedIndex = 2; // Indeks untuk halaman riwayat (HistoryPage)

  final List<String> filters = ["Semua", "Selesai", "Ditolak"];

  final List<Map<String, dynamic>> history = [
    {
      "device": "Laptop Lenovo ThinkPad",
      "borrow": "10 Agustus 2026",
      "return": "17 Agustus 2026",
      "status": "Selesai",
      "icon": Icons.laptop_mac,
    },
    {
      "device": "Spectrum Analyzer",
      "borrow": "25 Juli 2026",
      "return": "30 Juli 2026",
      "status": "Selesai",
      "icon": Icons.graphic_eq,
    },
    {
      "device": "Handy Talky Motorola",
      "borrow": "15 Juli 2026",
      "return": "-",
      "status": "Ditolak",
      "icon": Icons.radio,
    },
  ];

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final hasil = history.where((item) {
      final cocokFilter = filter == "Semua" || item["status"] == filter;

      final cocokCari = item["device"].toLowerCase().contains(
            searchController.text.toLowerCase(),
          );

      return cocokFilter && cocokCari;
    }).toList();

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // <-- Menghilangkan tombol back/kembali
        title: const Text("Riwayat Peminjaman"),
      ),
      body: Column(
        children: [
          // Search Field
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              controller: searchController,
              onChanged: (_) {
                setState(() {});
              },
              decoration: InputDecoration(
                hintText: "Cari perangkat",
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
            ),
          ),

          // Filter List
          SizedBox(
            height: 45,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: filters.length,
              itemBuilder: (_, index) {
                final item = filters[index];

                return Padding(
                  padding: const EdgeInsets.only(left: 12),
                  child: ChoiceChip(
                    label: Text(item),
                    selected: filter == item,
                    onSelected: (_) {
                      setState(() {
                        filter = item;
                      });
                    },
                  ),
                );
              },
            ),
          ),

          const SizedBox(height: 10),

          // History List
          Expanded(
            child: ListView.builder(
              itemCount: hasil.length,
              itemBuilder: (_, index) {
                final item = hasil[index];

                return Card(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: AppColors.primary.withOpacity(.15),
                      child: Icon(item["icon"], color: AppColors.primary),
                    ),
                    title: Text(item["device"]),
                    subtitle: Text("Pinjam : ${item["borrow"]}"),
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          item["status"],
                          style: TextStyle(
                            color: item["status"] == "Selesai"
                                ? Colors.green
                                : Colors.red,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Icon(Icons.arrow_forward_ios, size: 14),
                      ],
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => HistoryDetailPage(
                            device: item["device"],
                            borrow: item["borrow"],
                            returns: item["return"],
                            status: item["status"],
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),

      // Bottom Navigation Bar
      bottomNavigationBar: CustomBottomNav(
        currentIndex: selectedIndex,
        onTap: (index) {
          if (index == selectedIndex) return;

          setState(() {
            selectedIndex = index;
          });

          if (index == 0) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const DashboardPage(),
              ),
            );
          } else if (index == 1) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const DevicePage(),
              ),
            );
          } else if (index == 2) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const HistoryPage(),
              ),
            );
          } else if (index == 3) {
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