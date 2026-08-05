import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';
import 'pengembalian_detail_page.dart';

class ReturnPage extends StatefulWidget {
  const ReturnPage({super.key});

  @override
  State<ReturnPage> createState() => _ReturnPageState();
}

class _ReturnPageState extends State<ReturnPage> {
  final searchController = TextEditingController();

  final List<Map<String, dynamic>> borrowed = [
    {
      "device": "Laptop Lenovo ThinkPad",
      "borrow": "10 Agustus 2026",
      "deadline": "17 Agustus 2026",
      "icon": Icons.laptop_mac,
    },

    {
      "device": "Spectrum Analyzer",
      "borrow": "13 Agustus 2026",
      "deadline": "20 Agustus 2026",
      "icon": Icons.graphic_eq,
    },

    {
      "device": "Handy Talky Motorola",
      "borrow": "15 Agustus 2026",
      "deadline": "22 Agustus 2026",
      "icon": Icons.radio,
    },
  ];

  @override
  Widget build(BuildContext context) {
    final hasil = borrowed.where((item) {
      return item["device"].toLowerCase().contains(
        searchController.text.toLowerCase(),
      );
    }).toList();

    return Scaffold(
      appBar: AppBar(title: const Text("Pengembalian Perangkat")),

      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),

            child: TextField(
              controller: searchController,

              onChanged: (_) {
                setState(() {});
              },

              decoration: InputDecoration(
                hintText: "Cari perangkat...",

                prefixIcon: const Icon(Icons.search),

                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
            ),
          ),

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

                    subtitle: Text("Batas Pengembalian\n${item["deadline"]}"),

                    trailing: const Icon(Icons.arrow_forward_ios),

                    onTap: () {
                      Navigator.push(
                        context,

                        MaterialPageRoute(
                          builder: (_) => ReturnDetailPage(
                            device: item["device"],

                            borrow: item["borrow"],

                            deadline: item["deadline"],
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
    );
  }
}
