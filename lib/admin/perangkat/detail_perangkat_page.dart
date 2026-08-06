import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';

class DetailPerangkatPage extends StatelessWidget {
  final String nama;
  final String kode;
  final String kategori;
  final String jumlah;
  final String status;
  final String kondisi;

  const DetailPerangkatPage({
    super.key,
    required this.nama,
    required this.kode,
    required this.kategori,
    required this.jumlah,
    required this.status,
    required this.kondisi,
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

    if (kategori == 'Radio Komunikasi') {
      return Icons.settings_input_antenna_rounded;
    }

    if (kategori == 'Kamera') {
      return Icons.camera_alt_outlined;
    }

    return Icons.devices_other_rounded;
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
          'Detail Perangkat',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // =========================
            // HEADER PERANGKAT
            // =========================

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),

              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(20),
              ),

              child: Column(
                children: [
                  Container(
                    width: 85,
                    height: 85,

                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.18),
                      shape: BoxShape.circle,
                    ),

                    child: Icon(
                      perangkatIcon,
                      color: Colors.white,
                      size: 45,
                    ),
                  ),

                  const SizedBox(height: 15),

                  Text(
                    nama,
                    textAlign: TextAlign.center,

                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 7),

                  Text(
                    kode,
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 16,
                    ),
                  ),

                  const SizedBox(height: 15),

                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),

                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),

                    child: Text(
                      status,
                      style: TextStyle(
                        color: statusColor,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // =========================
            // INFORMASI PERANGKAT
            // =========================

            const Text(
              'Informasi Perangkat',
              style: TextStyle(
                color: AppColors.textPrimary,
                fontSize: 21,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 13),

            DetailInfoCard(
              icon: Icons.devices_other_outlined,
              title: 'Nama Perangkat',
              value: nama,
            ),

            const SizedBox(height: 11),

            DetailInfoCard(
              icon: Icons.qr_code_rounded,
              title: 'Kode Inventaris',
              value: kode,
            ),

            const SizedBox(height: 11),

            DetailInfoCard(
              icon: Icons.category_outlined,
              title: 'Kategori',
              value: kategori,
            ),

            const SizedBox(height: 11),

            DetailInfoCard(
              icon: Icons.inventory_2_outlined,
              title: 'Jumlah Perangkat',
              value: '$jumlah Unit',
            ),

            const SizedBox(height: 11),

            DetailInfoCard(
              icon: Icons.verified_outlined,
              title: 'Kondisi',
              value: kondisi,
            ),

            const SizedBox(height: 11),

            DetailInfoCard(
              icon: Icons.location_on_outlined,
              title: 'Lokasi Penyimpanan',
              value: 'Ruang Inventaris',
            ),

            const SizedBox(height: 24),

            // =========================
            // STATUS
            // =========================

            const Text(
              'Status Perangkat',
              style: TextStyle(
                color: AppColors.textPrimary,
                fontSize: 21,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 13),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(17),

              decoration: BoxDecoration(
                color: statusColor.withOpacity(0.10),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: statusColor,
                ),
              ),

              child: Row(
                children: [
                  Icon(
                    status == 'Tersedia'
                        ? Icons.check_circle_outline
                        : status == 'Dipinjam'
                            ? Icons.assignment_ind_outlined
                            : Icons.build_outlined,

                    color: statusColor,
                    size: 31,
                  ),

                  const SizedBox(width: 13),

                  Expanded(
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,

                      children: [
                        Text(
                          status,
                          style: TextStyle(
                            color: statusColor,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 3),

                        Text(
                          status == 'Tersedia'
                              ? 'Perangkat siap digunakan'
                              : status == 'Dipinjam'
                                  ? 'Perangkat sedang digunakan'
                                  : 'Perangkat sedang diperbaiki',

                          style: const TextStyle(
                            color: AppColors.textSecondary,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 28),

            // =========================
            // TOMBOL EDIT
            // =========================

            SizedBox(
              width: double.infinity,
              height: 54,

              child: ElevatedButton.icon(
                onPressed: () {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(
                    const SnackBar(
                      content: Text(
                        'Halaman edit perangkat belum dibuat',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  );
                },

                icon: const Icon(
                  Icons.edit_outlined,
                  size: 23,
                ),

                label: const Text(
                  'Edit Perangkat',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: Colors.white,
                  elevation: 0,

                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 12),

            // =========================
            // TOMBOL HAPUS
            // =========================

            SizedBox(
              width: double.infinity,
              height: 54,

              child: OutlinedButton.icon(
                onPressed: () {
                  _showDeleteDialog(context);
                },

                icon: const Icon(
                  Icons.delete_outline_rounded,
                  size: 23,
                ),

                label: const Text(
                  'Hapus Perangkat',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                style: OutlinedButton.styleFrom(
                  foregroundColor: AppColors.danger,

                  side: const BorderSide(
                    color: AppColors.danger,
                    width: 1.5,
                  ),

                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 25),
          ],
        ),
      ),
    );
  }

  void _showDeleteDialog(BuildContext context) {
    showDialog(
      context: context,

      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),

          title: const Text(
            'Hapus Perangkat?',
            style: TextStyle(
              fontSize: 21,
              fontWeight: FontWeight.bold,
            ),
          ),

          content: Text(
            'Apakah Anda yakin ingin menghapus $nama?',
            style: const TextStyle(
              fontSize: 16,
              color: AppColors.textSecondary,
            ),
          ),

          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },

              child: const Text(
                'Batal',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);

                ScaffoldMessenger.of(context)
                    .showSnackBar(
                  const SnackBar(
                    content: Text(
                      'Perangkat berhasil dihapus',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                );
              },

              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.danger,
                foregroundColor: Colors.white,
              ),

              child: const Text(
                'Hapus',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

// =========================
// CARD INFORMASI
// =========================

class DetailInfoCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;

  const DetailInfoCard({
    super.key,
    required this.icon,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),

      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(16),

        border: Border.all(
          color: AppColors.border,
        ),

        boxShadow: const [
          BoxShadow(
            color: AppColors.shadow,
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),

      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,

            decoration: BoxDecoration(
              color: AppColors.primaryLight,
              borderRadius: BorderRadius.circular(13),
            ),

            child: Icon(
              icon,
              color: Colors.white,
              size: 25,
            ),
          ),

          const SizedBox(width: 14),

          Expanded(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,

              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 14,
                  ),
                ),

                const SizedBox(height: 4),

                Text(
                  value,
                  style: const TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}