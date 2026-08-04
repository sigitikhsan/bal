import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import 'ajukan_peminjaman.dart';

class DevicePage extends StatefulWidget {
  const DevicePage({super.key});

  @override
  State<DevicePage> createState() => _DevicePageState();
}

class _DevicePageState extends State<DevicePage> {
  final TextEditingController searchController =
      TextEditingController();

  String selectedCategory = 'Semua';

  final List<String> categories = [
    'Semua',
    'Radio',
    'Monitoring',
    'Komputer',
    'Antena',
  ];

  final List<Map<String, dynamic>> devices = [
    {
      'name': 'Handy Talky Motorola',
      'code': 'HT-001',
      'category': 'Radio',
      'status': 'Tersedia',
      'icon': Icons.radio,
    },
    {
      'name': 'Spectrum Analyzer',
      'code': 'SA-002',
      'category': 'Monitoring',
      'status': 'Tersedia',
      'icon': Icons.graphic_eq,
    },
    {
      'name': 'Laptop Monitoring',
      'code': 'LP-003',
      'category': 'Komputer',
      'status': 'Dipinjam',
      'icon': Icons.laptop_mac,
    },
    {
      'name': 'Antena Monitoring',
      'code': 'AT-004',
      'category': 'Antena',
      'status': 'Tersedia',
      'icon': Icons.settings_input_antenna,
    },
    {
      'name': 'Radio Receiver',
      'code': 'RR-005',
      'category': 'Radio',
      'status': 'Dipinjam',
      'icon': Icons.settings_remote,
    },
    {
      'name': 'Portable Receiver',
      'code': 'PR-006',
      'category': 'Monitoring',
      'status': 'Tersedia',
      'icon': Icons.sensors,
    },
  ];

  List<Map<String, dynamic>> get filteredDevices {
    final keyword =
        searchController.text.toLowerCase().trim();

    return devices.where((device) {
      final name =
          device['name'].toString().toLowerCase();

      final code =
          device['code'].toString().toLowerCase();

      final category =
          device['category'].toString();

      final cocokPencarian =
          name.contains(keyword) ||
          code.contains(keyword);

      final cocokKategori =
          selectedCategory == 'Semua' ||
          category == selectedCategory;

      return cocokPencarian && cocokKategori;
    }).toList();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  void bukaDetail(
    Map<String, dynamic> device,
  ) {
    final bool tersedia =
        device['status'] == 'Tersedia';

    showModalBottomSheet(
      context: context,

      isScrollControlled: true,

      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25),
        ),
      ),

      builder: (context) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(
            22,
            18,
            22,
            30,
          ),

          child: Column(
            mainAxisSize: MainAxisSize.min,

            children: [
              Container(
                width: 45,
                height: 5,

                decoration: BoxDecoration(
                  color: Colors.grey.shade300,

                  borderRadius:
                      BorderRadius.circular(20),
                ),
              ),

              const SizedBox(height: 22),

              CircleAvatar(
                radius: 38,

                backgroundColor:
                    AppColors.primary
                        .withOpacity(0.12),

                child: Icon(
                  device['icon'],
                  size: 40,
                  color: AppColors.primary,
                ),
              ),

              const SizedBox(height: 15),

              Text(
                device['name'],

                textAlign: TextAlign.center,

                style: const TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 6),

              Text(
                'Kode: ${device['code']}',

                style: const TextStyle(
                  color:
                      AppColors.textSecondary,
                ),
              ),

              const SizedBox(height: 20),

              _detailRow(
                Icons.category_outlined,
                'Kategori',
                device['category'],
              ),

              const SizedBox(height: 12),

              _detailRow(
                tersedia
                    ? Icons.check_circle
                    : Icons.cancel,

                'Status',
                device['status'],

                color: tersedia
                    ? AppColors.success
                    : AppColors.danger,
              ),

              const SizedBox(height: 25),

              if (tersedia)
                SizedBox(
                  width: double.infinity,
                  height: 52,

                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.pop(context);

                      Navigator.push(
                        context,

                        MaterialPageRoute(
                          builder: (context) =>
                              const AjukanPeminjamanPage(),
                        ),
                      );
                    },

                    icon: const Icon(
                      Icons.assignment_add,
                    ),

                    label: const Text(
                      'Ajukan Peminjaman',
                    ),
                  ),
                )
              else
                Container(
                  width: double.infinity,

                  padding:
                      const EdgeInsets.all(15),

                  decoration: BoxDecoration(
                    color: const Color(
                      0xFFFFEBEE,
                    ),

                    borderRadius:
                        BorderRadius.circular(14),
                  ),

                  child: const Row(
                    children: [
                      Icon(
                        Icons.info_outline,
                        color: AppColors.danger,
                      ),

                      SizedBox(width: 10),

                      Expanded(
                        child: Text(
                          'Perangkat sedang '
                          'dipinjam dan belum '
                          'tersedia.',
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        );
      },
    );
  }

  Widget _detailRow(
    IconData icon,
    String title,
    String value, {
    Color? color,
  }) {
    return Row(
      children: [
        Icon(
          icon,
          color: color ?? AppColors.primary,
        ),

        const SizedBox(width: 12),

        Text(
          '$title:',
          style: const TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),

        const Spacer(),

        Text(
          value,
          style: TextStyle(
            color:
                color ?? AppColors.textPrimary,

            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final hasil = filteredDevices;

    return Scaffold(
      backgroundColor:
          AppColors.background,

      appBar: AppBar(
        title: const Text(
          'Daftar Perangkat',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),

        backgroundColor:
            AppColors.primary,

        foregroundColor:
            Colors.white,

        elevation: 0,
      ),

      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(
              18,
              12,
              18,
              20,
            ),

            decoration: const BoxDecoration(
              color: AppColors.primary,

              borderRadius:
                  BorderRadius.vertical(
                bottom: Radius.circular(25),
              ),
            ),

            child: Column(
              children: [
                TextField(
                  controller:
                      searchController,

                  onChanged: (value) {
                    setState(() {});
                  },

                  decoration:
                      InputDecoration(
                    hintText:
                        'Cari nama atau kode perangkat',

                    prefixIcon: const Icon(
                      Icons.search,
                    ),

                    suffixIcon:
                        searchController
                                .text
                                .isNotEmpty
                            ? IconButton(
                                icon: const Icon(
                                  Icons.clear,
                                ),

                                onPressed: () {
                                  searchController
                                      .clear();

                                  setState(() {});
                                },
                              )
                            : null,

                    filled: true,

                    fillColor:
                        Colors.white,

                    border:
                        OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(
                        15,
                      ),

                      borderSide:
                          BorderSide.none,
                    ),
                  ),
                ),

                const SizedBox(height: 15),

                SizedBox(
                  height: 38,

                  child: ListView.separated(
                    scrollDirection:
                        Axis.horizontal,

                    itemCount:
                        categories.length,

                    separatorBuilder:
                        (context, index) {
                      return const SizedBox(
                        width: 9,
                      );
                    },

                    itemBuilder:
                        (context, index) {
                      final category =
                          categories[index];

                      final selected =
                          selectedCategory ==
                              category;

                      return ChoiceChip(
                        label: Text(
                          category,
                        ),

                        selected: selected,

                        selectedColor:
                            Colors.white,

                        backgroundColor:
                            Colors.white24,

                        labelStyle:
                            TextStyle(
                          color: selected
                              ? AppColors.primary
                              : Colors.white,

                          fontWeight:
                              FontWeight.w600,
                        ),

                        onSelected:
                            (value) {
                          setState(() {
                            selectedCategory =
                                category;
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
            padding:
                const EdgeInsets.fromLTRB(
              18,
              20,
              18,
              10,
            ),

            child: Row(
              children: [
                const Text(
                  'Perangkat Tersedia',

                  style: TextStyle(
                    fontSize: 18,
                    fontWeight:
                        FontWeight.bold,
                  ),
                ),

                const Spacer(),

                Text(
                  '${hasil.length} perangkat',

                  style: const TextStyle(
                    color:
                        AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),

          Expanded(
            child: hasil.isEmpty
                ? const Center(
                    child: Column(
                      mainAxisSize:
                          MainAxisSize.min,

                      children: [
                        Icon(
                          Icons.search_off,
                          size: 65,
                          color: Colors.grey,
                        ),

                        SizedBox(height: 12),

                        Text(
                          'Perangkat tidak ditemukan',
                        ),
                      ],
                    ),
                  )

                : ListView.builder(
                    padding:
                        const EdgeInsets.fromLTRB(
                      18,
                      5,
                      18,
                      25,
                    ),

                    itemCount:
                        hasil.length,

                    itemBuilder:
                        (context, index) {
                      final device =
                          hasil[index];

                      final tersedia =
                          device['status'] ==
                              'Tersedia';

                      return Card(
                        margin:
                            const EdgeInsets.only(
                          bottom: 13,
                        ),

                        child: InkWell(
                          borderRadius:
                              BorderRadius.circular(
                            18,
                          ),

                          onTap: () {
                            bukaDetail(
                              device,
                            );
                          },

                          child: Padding(
                            padding:
                                const EdgeInsets.all(
                              15,
                            ),

                            child: Row(
                              children: [
                                Container(
                                  width: 55,
                                  height: 55,

                                  decoration:
                                      BoxDecoration(
                                    color:
                                        AppColors
                                            .primary
                                            .withOpacity(
                                      0.10,
                                    ),

                                    borderRadius:
                                        BorderRadius
                                            .circular(
                                      15,
                                    ),
                                  ),

                                  child: Icon(
                                    device['icon'],

                                    color:
                                        AppColors
                                            .primary,

                                    size: 29,
                                  ),
                                ),

                                const SizedBox(
                                  width: 14,
                                ),

                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment
                                            .start,

                                    children: [
                                      Text(
                                        device[
                                            'name'],

                                        maxLines: 1,

                                        overflow:
                                            TextOverflow
                                                .ellipsis,

                                        style:
                                            const TextStyle(
                                          fontSize: 16,
                                          fontWeight:
                                              FontWeight
                                                  .bold,
                                        ),
                                      ),

                                      const SizedBox(
                                        height: 4,
                                      ),

                                      Text(
                                        '${device['code']} • ${device['category']}',

                                        style:
                                            const TextStyle(
                                          color:
                                              AppColors
                                                  .textSecondary,

                                          fontSize: 12,
                                        ),
                                      ),

                                      const SizedBox(
                                        height: 8,
                                      ),

                                      Container(
                                        padding:
                                            const EdgeInsets
                                                .symmetric(
                                          horizontal:
                                              9,

                                          vertical: 4,
                                        ),

                                        decoration:
                                            BoxDecoration(
                                          color: tersedia
                                              ? const Color(
                                                  0xFFE8F5E9,
                                                )
                                              : const Color(
                                                  0xFFFFEBEE,
                                                ),

                                          borderRadius:
                                              BorderRadius
                                                  .circular(
                                            20,
                                          ),
                                        ),

                                        child: Text(
                                          device[
                                              'status'],

                                          style:
                                              TextStyle(
                                            color: tersedia
                                                ? AppColors
                                                    .success
                                                : AppColors
                                                    .danger,

                                            fontSize:
                                                11,

                                            fontWeight:
                                                FontWeight
                                                    .bold,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                const Icon(
                                  Icons
                                      .arrow_forward_ios_rounded,

                                  size: 17,

                                  color:
                                      Colors.grey,
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
    );
  }
}