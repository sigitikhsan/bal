import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';

class PengembalianPage extends StatefulWidget {
  const PengembalianPage({super.key});

  @override
  State<PengembalianPage> createState() =>
      _PengembalianPageState();
}

class _PengembalianPageState
    extends State<PengembalianPage> {
  final List<Map<String, String>> data = [
    {
      'nama': 'Laptop Lenovo ThinkPad',
      'kode': 'LPT-001',
      'peminjam': 'Sigit Ikhsan',
      'tanggal': '5 Agustus 2026',
      'status': 'Menunggu',
    },
    {
      'nama': 'HT Motorola GP328',
      'kode': 'HT-002',
      'peminjam': 'Ahmad Rizky',
      'tanggal': '6 Agustus 2026',
      'status': 'Menunggu',
    },
    {
      'nama': 'Kamera Canon EOS',
      'kode': 'KMR-004',
      'peminjam': 'Budi Santoso',
      'tanggal': '3 Agustus 2026',
      'status': 'Terlambat',
    },
  ];

  Color statusColor(String status) {
    if (status == 'Terlambat') {
      return AppColors.danger;
    }

    if (status == 'Dikembalikan') {
      return AppColors.success;
    }

    return AppColors.warning;
  }

  void konfirmasiPengembalian(
    int index,
  ) {
    final perangkat = data[index];

    showDialog(
      context: context,

      builder: (context) {
        return AlertDialog(
          title: const Text(
            'Konfirmasi Pengembalian',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),

          content: Text(
            'Apakah ${perangkat['nama']} '
            'sudah dikembalikan?',
            style: const TextStyle(
              fontSize: 16,
            ),
          ),

          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },

              child: const Text(
                'Batal',
              ),
            ),

            ElevatedButton(
              style:
                  ElevatedButton.styleFrom(
                backgroundColor:
                    AppColors.success,

                foregroundColor:
                    Colors.white,
              ),

              onPressed: () {
                setState(() {
                  data[index]['status'] =
                      'Dikembalikan';
                });

                Navigator.pop(context);

                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(
                  const SnackBar(
                    content: Text(
                      'Perangkat berhasil dikembalikan',
                    ),
                  ),
                );
              },

              child: const Text(
                'Konfirmasi',
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
      backgroundColor:
          AppColors.background,

      appBar: AppBar(
        backgroundColor:
            AppColors.primary,

        foregroundColor:
            Colors.white,

        centerTitle: true,

        title: const Text(
          'Pengembalian',
          style: TextStyle(
            fontSize: 22,
            fontWeight:
                FontWeight.bold,
          ),
        ),
      ),

      body: Column(
        children: [
          // HEADER

          Container(
            width:
                double.infinity,

            padding:
                const EdgeInsets.all(
              20,
            ),

            color:
                AppColors.primary,

            child: Row(
              children: [
                const Icon(
                  Icons
                      .assignment_return_rounded,

                  color:
                      Colors.white,

                  size: 42,
                ),

                const SizedBox(
                  width: 15,
                ),

                Column(
                  crossAxisAlignment:
                      CrossAxisAlignment
                          .start,

                  children: [
                    Text(
                      '${data.length} Perangkat',

                      style:
                          const TextStyle(
                        color:
                            Colors.white,

                        fontSize:
                            23,

                        fontWeight:
                            FontWeight
                                .bold,
                      ),
                    ),

                    const Text(
                      'Menunggu pengembalian',

                      style:
                          TextStyle(
                        color:
                            Colors.white70,

                        fontSize:
                            15,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(
            height: 18,
          ),

          const Padding(
            padding:
                EdgeInsets.symmetric(
              horizontal: 16,
            ),

            child: Align(
              alignment:
                  Alignment.centerLeft,

              child: Text(
                'Daftar Pengembalian',

                style:
                    TextStyle(
                  fontSize:
                      21,

                  fontWeight:
                      FontWeight.bold,

                  color:
                      AppColors
                          .textPrimary,
                ),
              ),
            ),
          ),

          const SizedBox(
            height: 12,
          ),

          // LIST

          Expanded(
            child:
                ListView.builder(
              padding:
                  const EdgeInsets
                      .fromLTRB(
                16,
                0,
                16,
                20,
              ),

              itemCount:
                  data.length,

              itemBuilder:
                  (context, index) {
                final item =
                    data[index];

                final status =
                    item['status']!;

                final warna =
                    statusColor(
                  status,
                );

                return Container(
                  margin:
                      const EdgeInsets
                          .only(
                    bottom:
                        14,
                  ),

                  padding:
                      const EdgeInsets
                          .all(
                    16,
                  ),

                  decoration:
                      BoxDecoration(
                    color:
                        Colors.white,

                    borderRadius:
                        BorderRadius
                            .circular(
                      17,
                    ),

                    border:
                        Border.all(
                      color:
                          AppColors
                              .border,
                    ),
                  ),

                  child:
                      Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            width:
                                55,

                            height:
                                55,

                            decoration:
                                BoxDecoration(
                              color:
                                  AppColors
                                      .primaryLight,

                              borderRadius:
                                  BorderRadius
                                      .circular(
                                14,
                              ),
                            ),

                            child:
                                const Icon(
                              Icons
                                  .laptop_mac_rounded,

                              color:
                                  Colors
                                      .white,

                              size:
                                  30,
                            ),
                          ),

                          const SizedBox(
                            width:
                                13,
                          ),

                          Expanded(
                            child:
                                Column(
                              crossAxisAlignment:
                                  CrossAxisAlignment
                                      .start,

                              children: [
                                Text(
                                  item[
                                      'nama']!,

                                  style:
                                      const TextStyle(
                                    fontSize:
                                        18,

                                    fontWeight:
                                        FontWeight
                                            .bold,
                                  ),
                                ),

                                const SizedBox(
                                  height:
                                      4,
                                ),

                                Text(
                                  item[
                                      'kode']!,

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

                          Container(
                            padding:
                                const EdgeInsets
                                    .symmetric(
                              horizontal:
                                  10,

                              vertical:
                                  6,
                            ),

                            decoration:
                                BoxDecoration(
                              color:
                                  warna
                                      .withOpacity(
                                0.12,
                              ),

                              borderRadius:
                                  BorderRadius
                                      .circular(
                                20,
                              ),
                            ),

                            child:
                                Text(
                              status,

                              style:
                                  TextStyle(
                                color:
                                    warna,

                                fontWeight:
                                    FontWeight
                                        .bold,
                              ),
                            ),
                          ),
                        ],
                      ),

                      const Divider(
                        height:
                            25,
                      ),

                      Row(
                        children: [
                          const Icon(
                            Icons
                                .person_outline,

                            color:
                                AppColors
                                    .textSecondary,
                          ),

                          const SizedBox(
                            width:
                                8,
                          ),

                          Text(
                            item[
                                'peminjam']!,
                          ),
                        ],
                      ),

                      const SizedBox(
                        height:
                            8,
                      ),

                      Row(
                        children: [
                          const Icon(
                            Icons
                                .calendar_today_outlined,

                            size:
                                19,

                            color:
                                AppColors
                                    .textSecondary,
                          ),

                          const SizedBox(
                            width:
                                8,
                          ),

                          Text(
                            'Batas: '
                            '${item['tanggal']}',
                          ),
                        ],
                      ),

                      const SizedBox(
                        height:
                            15,
                      ),

                      if (status !=
                          'Dikembalikan')

                        SizedBox(
                          width:
                              double
                                  .infinity,

                          height:
                              48,

                          child:
                              ElevatedButton
                                  .icon(
                            onPressed:
                                () {
                              konfirmasiPengembalian(
                                index,
                              );
                            },

                            icon:
                                const Icon(
                              Icons
                                  .assignment_return_rounded,
                            ),

                            label:
                                const Text(
                              'Proses Pengembalian',

                              style:
                                  TextStyle(
                                fontSize:
                                    16,

                                fontWeight:
                                    FontWeight
                                        .bold,
                              ),
                            ),

                            style:
                                ElevatedButton
                                    .styleFrom(
                              backgroundColor:
                                  AppColors
                                      .primary,

                              foregroundColor:
                                  Colors
                                      .white,
                            ),
                          ),
                        )

                      else

                        const Row(
                          mainAxisAlignment:
                              MainAxisAlignment
                                  .center,

                          children: [
                            Icon(
                              Icons
                                  .check_circle,

                              color:
                                  AppColors
                                      .success,
                            ),

                            SizedBox(
                              width:
                                  8,
                            ),

                            Text(
                              'Sudah Dikembalikan',

                              style:
                                  TextStyle(
                                color:
                                    AppColors
                                        .success,

                                fontSize:
                                    16,

                                fontWeight:
                                    FontWeight
                                        .bold,
                              ),
                            ),
                          ],
                        ),
                    ],
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