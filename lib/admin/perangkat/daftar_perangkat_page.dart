import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';
import 'detail_perangkat_page.dart';
import 'tambah_perangkat_page.dart';

class DaftarPerangkatPage extends StatefulWidget {
  const DaftarPerangkatPage({super.key});

  @override
  State<DaftarPerangkatPage> createState() =>
      _DaftarPerangkatPageState();
}

class _DaftarPerangkatPageState
    extends State<DaftarPerangkatPage> {
  String selectedFilter = 'Semua';

  final List<Map<String, String>> daftarPerangkat = [
    {
      'nama': 'Laptop Lenovo ThinkPad',
      'kode': 'LPT-001',
      'kategori': 'Laptop',
      'status': 'Tersedia',
      'kondisi': 'Baik',
    },
    {
      'nama': 'HT Motorola GP328',
      'kode': 'HT-002',
      'kategori': 'Radio Komunikasi',
      'status': 'Dipinjam',
      'kondisi': 'Baik',
    },
    {
      'nama': 'Laptop ASUS VivoBook',
      'kode': 'LPT-003',
      'kategori': 'Laptop',
      'status': 'Maintenance',
      'kondisi': 'Perlu Perbaikan',
    },
    {
      'nama': 'Kamera Canon EOS',
      'kode': 'KMR-004',
      'kategori': 'Kamera',
      'status': 'Tersedia',
      'kondisi': 'Baik',
    },
    {
      'nama': 'Radio HT Icom',
      'kode': 'HT-005',
      'kategori': 'Radio Komunikasi',
      'status': 'Tersedia',
      'kondisi': 'Baik',
    },
  ];

  List<Map<String, String>> get perangkatTampil {
    if (selectedFilter == 'Semua') {
      return daftarPerangkat;
    }

    return daftarPerangkat
        .where(
          (perangkat) =>
              perangkat['status'] ==
              selectedFilter,
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      appBar: AppBar(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,

        title: const Text(
          'Daftar Perangkat',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      floatingActionButton:
          FloatingActionButton.extended(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,

        onPressed: () async {

            final perangkatBaru =
                await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    const TambahPerangkatPage(),
              ),
            );

            if (perangkatBaru != null) {
              setState(() {
                daftarPerangkat.add(
                  Map<String, String>.from(
                    perangkatBaru,
                  ),
                );
              });

              ScaffoldMessenger.of(context)
                  .showSnackBar(
                const SnackBar(
                  content: Text(
                    'Perangkat berhasil ditambahkan',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
              );
            }
          },

        icon: const Icon(
          Icons.add_rounded,
          size: 27,
        ),

        label: const Text(
          'Tambah',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: Column(
        children: [
          // =========================
          // HEADER RINGKASAN
          // =========================

          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(18),

            decoration: const BoxDecoration(
              color: AppColors.primary,

              borderRadius:
                  BorderRadius.only(
                bottomLeft:
                    Radius.circular(25),

                bottomRight:
                    Radius.circular(25),
              ),
            ),

            child: Row(
              children: [
                Container(
                  width: 58,
                  height: 58,

                  decoration:
                      BoxDecoration(
                    color:
                        Colors.white
                            .withOpacity(
                      0.18,
                    ),

                    borderRadius:
                        BorderRadius
                            .circular(
                      16,
                    ),
                  ),

                  child: const Icon(
                    Icons
                        .devices_other_rounded,

                    color: Colors.white,

                    size: 33,
                  ),
                ),

                const SizedBox(width: 15),

                Column(
                  crossAxisAlignment:
                      CrossAxisAlignment
                          .start,

                  children: [
                    Text(
                      '${daftarPerangkat.length} Perangkat',

                      style:
                          const TextStyle(
                        color:
                            Colors.white,

                        fontSize: 23,

                        fontWeight:
                            FontWeight
                                .bold,
                      ),
                    ),

                    const SizedBox(
                      height: 3,
                    ),

                    const Text(
                      'Kelola data perangkat',
                      style: TextStyle(
                        color:
                            Colors.white70,

                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: 18),

          // =========================
          // JUDUL
          // =========================

          const Padding(
            padding:
                EdgeInsets.symmetric(
              horizontal: 16,
            ),

            child: Align(
              alignment:
                  Alignment.centerLeft,

              child: Text(
                'Daftar Perangkat',

                style: TextStyle(
                  color:
                      AppColors.textPrimary,

                  fontSize: 21,

                  fontWeight:
                      FontWeight.bold,
                ),
              ),
            ),
          ),

          const SizedBox(height: 12),

          // =========================
          // FILTER
          // =========================

          SizedBox(
            height: 45,

            child: ListView(
              scrollDirection:
                  Axis.horizontal,

              padding:
                  const EdgeInsets
                      .symmetric(
                horizontal: 16,
              ),

              children: [
                FilterButton(
                  title: 'Semua',
                  selected:
                      selectedFilter ==
                          'Semua',

                  onTap: () {
                    setState(() {
                      selectedFilter =
                          'Semua';
                    });
                  },
                ),

                const SizedBox(width: 9),

                FilterButton(
                  title: 'Tersedia',
                  selected:
                      selectedFilter ==
                          'Tersedia',

                  onTap: () {
                    setState(() {
                      selectedFilter =
                          'Tersedia';
                    });
                  },
                ),

                const SizedBox(width: 9),

                FilterButton(
                  title: 'Dipinjam',
                  selected:
                      selectedFilter ==
                          'Dipinjam',

                  onTap: () {
                    setState(() {
                      selectedFilter =
                          'Dipinjam';
                    });
                  },
                ),

                const SizedBox(width: 9),

                FilterButton(
                  title: 'Maintenance',
                  selected:
                      selectedFilter ==
                          'Maintenance',

                  onTap: () {
                    setState(() {
                      selectedFilter =
                          'Maintenance';
                    });
                  },
                ),
              ],
            ),
          ),

          const SizedBox(height: 13),

          // =========================
          // LIST PERANGKAT
          // =========================

          Expanded(
            child: perangkatTampil.isEmpty
                ? const Center(
                    child: Text(
                      'Tidak ada perangkat',
                      style: TextStyle(
                        color:
                            AppColors
                                .textSecondary,

                        fontSize: 17,
                      ),
                    ),
                  )
                : ListView.separated(
                    padding:
                        const EdgeInsets
                            .fromLTRB(
                      16,
                      0,
                      16,
                      90,
                    ),

                    itemCount:
                        perangkatTampil
                            .length,

                    separatorBuilder:
                        (context,
                            index) {
                      return const SizedBox(
                        height: 13,
                      );
                    },

                    itemBuilder:
                        (context,
                            index) {
                      final perangkat =
                          perangkatTampil[
                              index];

                      return PerangkatCard(
                        nama: perangkat['nama']!,
                        kode: perangkat['kode']!,
                        kategori: perangkat['kategori']!,
                        status: perangkat['status']!,
                        kondisi: perangkat['kondisi']!,

                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailPerangkatPage(
                                nama: perangkat['nama']!,
                                kode: perangkat['kode']!,
                                kategori: perangkat['kategori']!,
                                status: perangkat['status']!,
                                kondisi: perangkat['kondisi']!,
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}

// =================================
// TOMBOL FILTER
// =================================

class FilterButton
    extends StatelessWidget {
  final String title;
  final bool selected;
  final VoidCallback onTap;

  const FilterButton({
    super.key,
    required this.title,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(
    BuildContext context,
  ) {
    return InkWell(
      onTap: onTap,

      borderRadius:
          BorderRadius.circular(22),

      child: Container(
        padding:
            const EdgeInsets
                .symmetric(
          horizontal: 17,
        ),

        alignment:
            Alignment.center,

        decoration:
            BoxDecoration(
          color: selected
              ? AppColors.primary
              : AppColors.card,

          borderRadius:
              BorderRadius.circular(
            22,
          ),

          border: Border.all(
            color: selected
                ? AppColors.primary
                : AppColors.border,
          ),
        ),

        child: Text(
          title,

          style: TextStyle(
            color: selected
                ? Colors.white
                : AppColors
                    .textSecondary,

            fontSize: 15,

            fontWeight:
                FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

// =================================
// CARD PERANGKAT
// =================================

class PerangkatCard
    extends StatelessWidget {
  final String nama;
  final String kode;
  final String kategori;
  final String status;
  final String kondisi;
  final VoidCallback onTap;

  const PerangkatCard({
    super.key,
    required this.nama,
    required this.kode,
    required this.kategori,
    required this.status,
    required this.kondisi,
    required this.onTap,
  });

  Color get statusColor {
    if (status == 'Tersedia') {
      return AppColors.success;
    }

    if (status == 'Dipinjam') {
      return AppColors.warning;
    }

    return AppColors.danger;
  }

  IconData get perangkatIcon {
    if (kategori == 'Laptop') {
      return Icons.laptop_mac_rounded;
    }

    if (kategori ==
        'Radio Komunikasi') {
      return Icons
          .settings_input_antenna_rounded;
    }

    if (kategori == 'Kamera') {
      return Icons
          .camera_alt_outlined;
    }

    return Icons
        .devices_other_rounded;
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    return InkWell(
      onTap: onTap,

      borderRadius:
          BorderRadius.circular(18),

      child: Container(
        padding:
            const EdgeInsets.all(
          16,
        ),

        decoration:
            BoxDecoration(
          color: AppColors.card,

          borderRadius:
              BorderRadius.circular(
            18,
          ),

          border: Border.all(
            color:
                AppColors.border,
          ),

          boxShadow: const [
            BoxShadow(
              color:
                  AppColors.shadow,

              blurRadius: 7,

              offset:
                  Offset(0, 3),
            ),
          ],
        ),

        child: Column(
          children: [
            Row(
              children: [
                Container(
                  width: 56,
                  height: 56,

                  decoration:
                      BoxDecoration(
                    color:
                        AppColors
                            .primaryLight,

                    borderRadius:
                        BorderRadius
                            .circular(
                      15,
                    ),
                  ),

                  child: Icon(
                    perangkatIcon,

                    color:
                        Colors.white,

                    size: 30,
                  ),
                ),

                const SizedBox(
                  width: 13,
                ),

                Expanded(
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment
                            .start,

                    children: [
                      Text(
                        nama,

                        maxLines: 2,

                        overflow:
                            TextOverflow
                                .ellipsis,

                        style:
                            const TextStyle(
                          color:
                              AppColors
                                  .textPrimary,

                          fontSize:
                              18,

                          fontWeight:
                              FontWeight
                                  .bold,
                        ),
                      ),

                      const SizedBox(
                        height: 5,
                      ),

                      Text(
                        '$kode • $kategori',

                        style:
                            const TextStyle(
                          color:
                              AppColors
                                  .textSecondary,

                          fontSize:
                              14,
                        ),
                      ),
                    ],
                  ),
                ),

                const Icon(
                  Icons
                      .chevron_right_rounded,

                  color:
                      AppColors
                          .textSecondary,

                  size: 30,
                ),
              ],
            ),

            const SizedBox(
              height: 14,
            ),

            const Divider(
              color:
                  AppColors.border,
            ),

            const SizedBox(
              height: 7,
            ),

            Row(
              children: [
                const Icon(
                  Icons
                      .verified_outlined,

                  color:
                      AppColors
                          .textSecondary,

                  size: 20,
                ),

                const SizedBox(
                  width: 7,
                ),

                Text(
                  'Kondisi: $kondisi',

                  style:
                      const TextStyle(
                    color:
                        AppColors
                            .textSecondary,

                    fontSize:
                        14,
                  ),
                ),

                const Spacer(),

                Container(
                  padding:
                      const EdgeInsets
                          .symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),

                  decoration:
                      BoxDecoration(
                    color:
                        statusColor
                            .withOpacity(
                      0.13,
                    ),

                    borderRadius:
                        BorderRadius
                            .circular(
                      20,
                    ),
                  ),

                  child: Text(
                    status,

                    style:
                        TextStyle(
                      color:
                          statusColor,

                      fontSize:
                          13,

                      fontWeight:
                          FontWeight
                              .bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}