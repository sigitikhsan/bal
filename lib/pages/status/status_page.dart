import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';
import 'status_detail_page.dart';

class StatusPage extends StatefulWidget {
  const StatusPage({super.key});

  @override
  State<StatusPage> createState() => _StatusPageState();
}

class _StatusPageState extends State<StatusPage> {
  final TextEditingController searchController = TextEditingController();

  String filter = "Semua";

  final List<String> filters = [
    "Semua",
    "Diproses",
    "Disetujui",
    "Ditolak",
    "Selesai",
  ];

  final List<Map<String, dynamic>> data = [
    {
      "device": "Laptop Lenovo ThinkPad",
      "date": "10 Agustus 2026",
      "status": "Diproses",
      "icon": Icons.laptop_mac,
    },
    {
      "device": "Spectrum Analyzer",
      "date": "05 Agustus 2026",
      "status": "Disetujui",
      "icon": Icons.graphic_eq,
    },
    {
      "device": "Handy Talky Motorola",
      "date": "01 Agustus 2026",
      "status": "Selesai",
      "icon": Icons.radio,
    },
  ];

  Color statusColor(String status) {
    switch (status) {
      case "Diproses":
        return Colors.orange;
      case "Disetujui":
        return Colors.green;
      case "Ditolak":
        return Colors.red;
      case "Selesai":
        return Colors.blue;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    final hasil = data.where((item) {
      final cocokFilter =
          filter == "Semua" || item["status"] == filter;

      final cocokCari = item["device"]
          .toString()
          .toLowerCase()
          .contains(searchController.text.toLowerCase());

      return cocokFilter && cocokCari;
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Status Peminjaman"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              controller: searchController,
              onChanged: (_) => setState(() {}),
              decoration: InputDecoration(
                hintText: "Cari perangkat...",
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
            ),
          ),

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
                      backgroundColor:
                          AppColors.primary.withOpacity(.15),
                      child: Icon(
                        item["icon"],
                        color: AppColors.primary,
                      ),
                    ),
                    title: Text(item["device"]),
                    subtitle: Text(item["date"]),
                    trailing: Column(
                      mainAxisAlignment:
                          MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: statusColor(item["status"])
                                .withOpacity(.15),
                            borderRadius:
                                BorderRadius.circular(20),
                          ),
                          child: Text(
                            item["status"],
                            style: TextStyle(
                              color: statusColor(item["status"]),
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => StatusDetailPage(
                            device: item["device"],
                            date: item["date"],
                            status: item["status"],
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}