import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';
import 'pemilihan_form_page.dart';

class PemilihanPeminjamanPage extends StatefulWidget {
  const PemilihanPeminjamanPage({super.key});

  @override
  State<PemilihanPeminjamanPage> createState() =>
      _PemilihanPeminjamanPageState();
}

class _PemilihanPeminjamanPageState extends State<PemilihanPeminjamanPage> {
  final TextEditingController searchController = TextEditingController();

  String selectedCategory = "Semua";

  final List<String> categories = ["Semua", "Radio", "Laptop", "Monitoring"];

  final List<Map<String, dynamic>> devices = [
    {
      "name": "Laptop Lenovo ThinkPad",
      "code": "LP-001",
      "category": "Laptop",
      "status": "Tersedia",
      "icon": Icons.laptop_mac,
    },
    {
      "name": "HT Motorola GP2000",
      "code": "HT-002",
      "category": "Radio",
      "status": "Dipinjam",
      "icon": Icons.settings_remote,
    },
    {
      "name": "Spectrum Analyzer",
      "code": "MN-003",
      "category": "Monitoring",
      "status": "Tersedia",
      "icon": Icons.graphic_eq,
    },
    {
      "name": "Laptop Dell Latitude",
      "code": "LP-004",
      "category": "Laptop",
      "status": "Tersedia",
      "icon": Icons.laptop,
    },
  ];

  List<Map<String, dynamic>> get filteredDevices {
    return devices.where((device) {
      final keyword = searchController.text.toLowerCase();

      final cocokNama = device["name"].toLowerCase().contains(keyword);

      final cocokKategori =
          selectedCategory == "Semua" || device["category"] == selectedCategory;

      return cocokNama && cocokKategori;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final hasil = filteredDevices;

    return Scaffold(
      backgroundColor: AppColors.background,

      appBar: AppBar(
        title: const Text(
          "Ajukan Peminjaman",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),

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
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
          ),

          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Kategori",
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
            ),
          ),

          const SizedBox(height: 10),

          SizedBox(
            height: 40,

            child: ListView.builder(
              scrollDirection: Axis.horizontal,

              padding: const EdgeInsets.symmetric(horizontal: 16),

              itemCount: categories.length,

              itemBuilder: (context, index) {
                final category = categories[index];

                final selected = selectedCategory == category;

                return Padding(
                  padding: const EdgeInsets.only(right: 8),

                  child: ChoiceChip(
                    label: Text(category),

                    selected: selected,

                    selectedColor: AppColors.primary,

                    labelStyle: TextStyle(
                      color: selected ? Colors.white : Colors.black,
                    ),

                    onSelected: (_) {
                      setState(() {
                        selectedCategory = category;
                      });
                    },
                  ),
                );
              },
            ),
          ),

          const SizedBox(height: 15),

          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),

              itemCount: hasil.length,

              itemBuilder: (context, index) {
                final item = hasil[index];

                final tersedia = item["status"] == "Tersedia";

                return Card(
                  margin: const EdgeInsets.only(bottom: 15),

                  elevation: 2,

                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),

                  child: Padding(
                    padding: const EdgeInsets.all(16),

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 24,

                              backgroundColor: AppColors.primary.withOpacity(
                                .1,
                              ),

                              child: Icon(
                                item["icon"],
                                color: AppColors.primary,
                              ),
                            ),

                            const SizedBox(width: 14),

                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,

                                children: [
                                  Text(
                                    item["name"],

                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,

                                      fontSize: 16,
                                    ),
                                  ),

                                  const SizedBox(height: 4),

                                  Text("Kode : ${item["code"]}"),
                                ],
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 15),

                        Row(
                          children: [
                            const Text(
                              "Status : ",
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),

                            Icon(
                              Icons.circle,
                              size: 12,
                              color: tersedia ? Colors.green : Colors.red,
                            ),

                            const SizedBox(width: 6),

                            Text(item["status"]),
                          ],
                        ),

                        const SizedBox(height: 18),

                        Row(
                          children: [
                            Expanded(
                              child: OutlinedButton(
                                onPressed: () {
                                  // nanti menuju detail barang
                                },

                                child: const Text("Lihat Detail"),
                              ),
                            ),

                            const SizedBox(width: 10),

                            Expanded(
                              child: ElevatedButton(
                                onPressed: tersedia
                                    ? () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (_) => LoanFormPage(
                                              deviceName: item["name"],
                                            ),
                                          ),
                                        );
                                      }
                                    : null,

                                child: Text(
                                  tersedia ? "Pilih" : "Tidak Tersedia",
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
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
