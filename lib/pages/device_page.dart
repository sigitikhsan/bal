import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import 'detail_barang.dart';

class DevicePage extends StatefulWidget {
  const DevicePage({super.key});

  @override
  State<DevicePage> createState() => _DevicePageState();
}

class _DevicePageState extends State<DevicePage> {
  final TextEditingController searchController = TextEditingController();

  String selectedCategory = "Semua";

  final List<String> categories = [
    "Semua",
    "Radio",
    "Monitoring",
    "Komputer",
    "Antena",
  ];

  final List<Map<String, dynamic>> devices = [
    {
      "nama": "Laptop Lenovo ThinkPad X1",
      "kode": "LP001",
      "kategori": "Komputer",
      "kondisi": "Baik",
      "status": "Tersedia",
      "icon": Icons.laptop_mac,
    },
    {
      "nama": "Spectrum Analyzer",
      "kode": "SA002",
      "kategori": "Monitoring",
      "kondisi": "Baik",
      "status": "Dipinjam",
      "icon": Icons.graphic_eq,
    },
    {
      "nama": "Handy Talky Motorola",
      "kode": "HT003",
      "kategori": "Radio",
      "kondisi": "Baik",
      "status": "Tersedia",
      "icon": Icons.radio,
    },
    {
      "nama": "Antena Monitoring",
      "kode": "AT004",
      "kategori": "Antena",
      "kondisi": "Baik",
      "status": "Tersedia",
      "icon": Icons.settings_input_antenna,
    },
    {
      "nama": "Laptop Dell Latitude",
      "kode": "LP005",
      "kategori": "Komputer",
      "kondisi": "Rusak Ringan",
      "status": "Dipinjam",
      "icon": Icons.laptop,
    },
  ];

  List<Map<String, dynamic>> get filteredDevices {
    return devices.where((device) {
      final keyword = searchController.text.toLowerCase();

      final cocokCari =
          device["nama"].toLowerCase().contains(keyword) ||
          device["kode"].toLowerCase().contains(keyword);

      final cocokKategori =
          selectedCategory == "Semua" ||
          device["kategori"] == selectedCategory;

      return cocokCari && cocokKategori;
    }).toList();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  Future<void> refreshData() async {
    await Future.delayed(
      const Duration(seconds: 1),
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final hasil = filteredDevices;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Daftar Perangkat",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primary,
        child: const Icon(Icons.refresh),
        onPressed: () {
          setState(() {});
        },
      ),
      body: RefreshIndicator(
        onRefresh: refreshData,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(
                18,
                15,
                18,
                20,
              ),
              decoration: const BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(25),
                ),
              ),
              child: Column(
                children: [
                  TextField(
                    controller: searchController,
                    onChanged: (value) {
                      setState(() {});
                    },
                    decoration: InputDecoration(
                      hintText: "Cari nama atau kode perangkat",
                      prefixIcon: const Icon(Icons.search),
                      suffixIcon: searchController.text.isNotEmpty
                          ? IconButton(
                              icon: const Icon(Icons.clear),
                              onPressed: () {
                                searchController.clear();
                                setState(() {});
                              },
                            )
                          : null,
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  SizedBox(
                    height: 40,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: categories.length,
                      separatorBuilder: (_, __) =>
                          const SizedBox(width: 8),
                      itemBuilder: (_, index) {
                        final category = categories[index];

                        return ChoiceChip(
                          label: Text(category),
                          selected: selectedCategory == category,
                          selectedColor: Colors.white,
                          backgroundColor: Colors.white24,
                          labelStyle: TextStyle(
                            color: selectedCategory == category
                                ? AppColors.primary
                                : Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                          onSelected: (_) {
                            setState(() {
                              selectedCategory = category;
                            });
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(
                18,
                18,
                18,
                10,
              ),
              child: Row(
                children: [
                  const Text(
                    "Daftar Perangkat",
                    style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    "${hasil.length} perangkat",
                    style: const TextStyle(
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: hasil.isEmpty
                  ? const Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.search_off,
                            size: 70,
                            color: Colors.grey,
                          ),
                          SizedBox(height: 15),
                          Text(
                            "Perangkat tidak ditemukan",
                          ),
                        ],
                      ),
                    )
                  : ListView.builder(
                      padding: const EdgeInsets.fromLTRB(
                        18,
                        0,
                        18,
                        25,
                      ),
                      itemCount: hasil.length,
                      itemBuilder: (context, index) {
                        final item = hasil[index];

                        final tersedia =
                            item["status"] == "Tersedia";

                        return Card(
                          margin: const EdgeInsets.only(
                            bottom: 15,
                          ),
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(18),
                          ),
                          child: InkWell(
                            borderRadius:
                                BorderRadius.circular(18),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => DetailBarangPage(
                                    nama: item["nama"],
                                    kode: item["kode"],
                                    kondisi: item["kondisi"],
                                    status: item["status"],
                                  ),
                                ),
                              );
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(15),
                              child: Row(
                                children: [
                                  Container(
                                    width: 58,
                                    height: 58,
                                    decoration: BoxDecoration(
                                      color: AppColors.primary
                                          .withOpacity(0.12),
                                      borderRadius:
                                          BorderRadius.circular(15),
                                    ),
                                    child: Icon(
                                      item["icon"],
                                      color: AppColors.primary,
                                      size: 30,
                                    ),
                                  ),
                                  const SizedBox(width: 15),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          item["nama"],
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight:
                                                FontWeight.bold,
                                          ),
                                        ),
                                        const SizedBox(height: 5),
                                        Text(
                                          "${item["kode"]} • ${item["kategori"]}",
                                          style: const TextStyle(
                                            color: AppColors
                                                .textSecondary,
                                          ),
                                        ),
                                        const SizedBox(height: 8),
                                        Container(
                                          padding:
                                              const EdgeInsets
                                                  .symmetric(
                                            horizontal: 10,
                                            vertical: 5,
                                          ),
                                          decoration:
                                              BoxDecoration(
                                            color: tersedia
                                                ? Colors.green
                                                    .shade100
                                                : Colors.red
                                                    .shade100,
                                            borderRadius:
                                                BorderRadius
                                                    .circular(20),
                                          ),
                                          child: Text(
                                            item["status"],
                                            style: TextStyle(
                                              color: tersedia
                                                  ? Colors.green
                                                  : Colors.red,
                                              fontWeight:
                                                  FontWeight.bold,
                                              fontSize: 12,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const Icon(
                                    Icons.arrow_forward_ios,
                                    size: 16,
                                    color: Colors.grey,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}