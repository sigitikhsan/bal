import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';
import 'detail_permohonan_page.dart';

class DaftarPermohonanPage extends StatelessWidget {
  const DaftarPermohonanPage({super.key});

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
          'Daftar Permohonan',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: Column(
        children: [
          // =================================
          // HEADER JUMLAH PERMOHONAN
          // =================================

          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(18),

            decoration: const BoxDecoration(
              color: AppColors.primary,

              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(24),
                bottomRight: Radius.circular(24),
              ),
            ),

            child: const Row(
              children: [
                Icon(
                  Icons.pending_actions_rounded,
                  color: Colors.white,
                  size: 42,
                ),

                SizedBox(width: 14),

                Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,

                  children: [
                    Text(
                      '5 Permohonan',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(height: 3),

                    Text(
                      'Menunggu persetujuan',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: 18),

          // =================================
          // JUDUL DAN STATUS
          // =================================

          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),

            child: Row(
              children: [
                const Text(
                  'Permohonan',
                  style: TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const Spacer(),

                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 7,
                  ),

                  decoration: BoxDecoration(
                    color: const Color(0xFFFFF3E0),
                    borderRadius: BorderRadius.circular(20),
                  ),

                  child: const Row(
                    children: [
                      Icon(
                        Icons.hourglass_empty_rounded,
                        color: AppColors.warning,
                        size: 19,
                      ),

                      SizedBox(width: 5),

                      Text(
                        'Menunggu',
                        style: TextStyle(
                          color: AppColors.warning,
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 12),

          // =================================
          // LIST PERMOHONAN
          // =================================

          Expanded(
            child: ListView(
              padding: const EdgeInsets.fromLTRB(
                16,
                0,
                16,
                25,
              ),

              children: const [
                PermohonanCard(
                  nama: 'Sigit Ikhsan',
                  perangkat: 'Laptop Lenovo ThinkPad',
                  tanggal: '5 Agustus 2026',
                ),

                SizedBox(height: 13),

                PermohonanCard(
                  nama: 'Siti Aisyah',
                  perangkat: 'HT Motorola GP328',
                  tanggal: '5 Agustus 2026',
                ),

                SizedBox(height: 13),

                PermohonanCard(
                  nama: 'Budi Santoso',
                  perangkat: 'Laptop ASUS VivoBook',
                  tanggal: '4 Agustus 2026',
                ),

                SizedBox(height: 13),

                PermohonanCard(
                  nama: 'Rina Amelia',
                  perangkat: 'Kamera Canon EOS',
                  tanggal: '4 Agustus 2026',
                ),

                SizedBox(height: 13),

                PermohonanCard(
                  nama: 'Doni Saputra',
                  perangkat: 'Radio HT Icom',
                  tanggal: '3 Agustus 2026',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// =================================
// CARD PERMOHONAN
// =================================

class PermohonanCard extends StatelessWidget {
  final String nama;
  final String perangkat;
  final String tanggal;

  const PermohonanCard({
    super.key,
    required this.nama,
    required this.perangkat,
    required this.tanggal,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailPermohonanPage(
              nama: nama,
              perangkat: perangkat,
              tanggalPengajuan: tanggal,
            ),
          ),
        );
      },

      borderRadius: BorderRadius.circular(18),

      child: Container(
        padding: const EdgeInsets.all(16),

        decoration: BoxDecoration(
          color: AppColors.card,

          borderRadius: BorderRadius.circular(18),

          border: Border.all(
            color: AppColors.border,
          ),

          boxShadow: const [
            BoxShadow(
              color: AppColors.shadow,
              blurRadius: 7,
              offset: Offset(0, 3),
            ),
          ],
        ),

        child: Column(
          children: [
            // =================================
            // NAMA DAN PERANGKAT
            // =================================

            Row(
              children: [
                CircleAvatar(
                  radius: 25,

                  backgroundColor:
                      AppColors.primaryLight,

                  child: Text(
                    nama[0],

                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                const SizedBox(width: 13),

                Expanded(
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,

                    children: [
                      Text(
                        nama,

                        style: const TextStyle(
                          color:
                              AppColors.textPrimary,

                          fontSize: 18,

                          fontWeight:
                              FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 4),

                      Text(
                        perangkat,

                        maxLines: 1,

                        overflow:
                            TextOverflow.ellipsis,

                        style: const TextStyle(
                          color:
                              AppColors.textSecondary,

                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),

                const Icon(
                  Icons.chevron_right_rounded,

                  color:
                      AppColors.textSecondary,

                  size: 30,
                ),
              ],
            ),

            const SizedBox(height: 14),

            const Divider(
              color: AppColors.border,
            ),

            const SizedBox(height: 8),

            // =================================
            // TANGGAL DAN STATUS
            // =================================

            Row(
              children: [
                const Icon(
                  Icons.calendar_today_outlined,

                  color:
                      AppColors.textSecondary,

                  size: 19,
                ),

                const SizedBox(width: 8),

                Text(
                  tanggal,

                  style: const TextStyle(
                    color:
                        AppColors.textSecondary,

                    fontSize: 14,
                  ),
                ),

                const Spacer(),

                Container(
                  padding:
                      const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),

                  decoration:
                      BoxDecoration(
                    color:
                        Color(0xFFFFF3E0),

                    borderRadius:
                        BorderRadius.circular(
                      20,
                    ),
                  ),

                  child: const Text(
                    'Menunggu',

                    style: TextStyle(
                      color:
                          AppColors.warning,

                      fontSize: 13,

                      fontWeight:
                          FontWeight.bold,
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