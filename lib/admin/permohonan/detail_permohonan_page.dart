import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';

class DetailPermohonanPage extends StatelessWidget {
  final String nama;
  final String perangkat;
  final String tanggalPengajuan;

  const DetailPermohonanPage({
    super.key,
    required this.nama,
    required this.perangkat,
    required this.tanggalPengajuan,
  });

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
          'Detail Permohonan',
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
            // STATUS
            // =========================

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(18),

              decoration: BoxDecoration(
                color: const Color(0xFFFFF3E0),

                borderRadius: BorderRadius.circular(18),

                border: Border.all(
                  color: AppColors.warning,
                ),
              ),

              child: const Row(
                children: [
                  Icon(
                    Icons.pending_actions_rounded,
                    color: AppColors.warning,
                    size: 42,
                  ),

                  SizedBox(width: 14),

                  Expanded(
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,

                      children: [
                        Text(
                          'Menunggu Persetujuan',
                          style: TextStyle(
                            color: AppColors.warning,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        SizedBox(height: 4),

                        Text(
                          'Permohonan belum diproses',
                          style: TextStyle(
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

            const SizedBox(height: 22),

            // =========================
            // DATA PEMINJAM
            // =========================

            const Text(
              'Data Peminjam',
              style: TextStyle(
                color: AppColors.textPrimary,
                fontSize: 21,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),

            DetailCard(
              icon: Icons.person_outline,
              title: 'Nama Peminjam',
              value: nama,
            ),

            const SizedBox(height: 10),

            const DetailCard(
              icon: Icons.badge_outlined,
              title: 'NIP / ID Petugas',
              value: 'BM-2026-001',
            ),

            const SizedBox(height: 22),

            // =========================
            // DATA PERANGKAT
            // =========================

            const Text(
              'Data Perangkat',
              style: TextStyle(
                color: AppColors.textPrimary,
                fontSize: 21,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),

            DetailCard(
              icon: Icons.devices_other_outlined,
              title: 'Nama Perangkat',
              value: perangkat,
            ),

            const SizedBox(height: 10),

            const DetailCard(
              icon: Icons.inventory_2_outlined,
              title: 'Jumlah',
              value: '1 Unit',
            ),

            const SizedBox(height: 22),

            // =========================
            // INFORMASI PEMINJAMAN
            // =========================

            const Text(
              'Informasi Peminjaman',
              style: TextStyle(
                color: AppColors.textPrimary,
                fontSize: 21,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),

            DetailCard(
              icon: Icons.calendar_today_outlined,
              title: 'Tanggal Pengajuan',
              value: tanggalPengajuan,
            ),

            const SizedBox(height: 10),

            const DetailCard(
              icon: Icons.login_rounded,
              title: 'Tanggal Peminjaman',
              value: '7 Agustus 2026',
            ),

            const SizedBox(height: 10),

            const DetailCard(
              icon: Icons.assignment_return_outlined,
              title: 'Tanggal Pengembalian',
              value: '10 Agustus 2026',
            ),

            const SizedBox(height: 22),

            // =========================
            // KEPERLUAN
            // =========================

            const Text(
              'Keperluan',
              style: TextStyle(
                color: AppColors.textPrimary,
                fontSize: 21,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),

              decoration: BoxDecoration(
                color: AppColors.card,

                borderRadius: BorderRadius.circular(16),

                border: Border.all(
                  color: AppColors.border,
                ),
              ),

              child: const Text(
                'Digunakan untuk kegiatan monitoring '
                'dan pengukuran frekuensi di lapangan.',
                style: TextStyle(
                  color: AppColors.textSecondary,
                  fontSize: 15,
                  height: 1.5,
                ),
              ),
            ),

            const SizedBox(height: 28),

            // =========================
            // TOMBOL TOLAK
            // =========================

            SizedBox(
              width: double.infinity,
              height: 54,

              child: OutlinedButton.icon(
                onPressed: () {
                  _showTolakDialog(context);
                },

                icon: const Icon(
                  Icons.close_rounded,
                  size: 24,
                ),

                label: const Text(
                  'Tolak Permohonan',
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
                    borderRadius:
                        BorderRadius.circular(14),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 12),

            // =========================
            // TOMBOL SETUJUI
            // =========================

            SizedBox(
              width: double.infinity,
              height: 54,

              child: ElevatedButton.icon(
                onPressed: () {
                  _showSetujuiDialog(context);
                },

                icon: const Icon(
                  Icons.check_circle_outline,
                  size: 24,
                ),

                label: const Text(
                  'Setujui Permohonan',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      AppColors.success,

                  foregroundColor:
                      Colors.white,

                  elevation: 0,

                  shape:
                      RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(14),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  // =================================
  // DIALOG SETUJUI
  // =================================

  void _showSetujuiDialog(
    BuildContext context,
  ) {
    showDialog(
      context: context,

      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(20),
          ),

          title: const Text(
            'Setujui Permohonan?',
            style: TextStyle(
              fontSize: 21,
              fontWeight: FontWeight.bold,
            ),
          ),

          content: Text(
            'Apakah Anda yakin ingin menyetujui '
            'permohonan dari $nama?',
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
                      'Permohonan berhasil disetujui',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),

                    backgroundColor:
                        AppColors.success,
                  ),
                );
              },

              style:
                  ElevatedButton.styleFrom(
                backgroundColor:
                    AppColors.success,

                foregroundColor:
                    Colors.white,
              ),

              child: const Text(
                'Setujui',
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

  // =================================
  // DIALOG TOLAK
  // =================================

  void _showTolakDialog(
    BuildContext context,
  ) {
    showDialog(
      context: context,

      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(20),
          ),

          title: const Text(
            'Tolak Permohonan?',
            style: TextStyle(
              fontSize: 21,
              fontWeight: FontWeight.bold,
            ),
          ),

          content: Text(
            'Apakah Anda yakin ingin menolak '
            'permohonan dari $nama?',
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
                      'Permohonan berhasil ditolak',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),

                    backgroundColor:
                        AppColors.danger,
                  ),
                );
              },

              style:
                  ElevatedButton.styleFrom(
                backgroundColor:
                    AppColors.danger,

                foregroundColor:
                    Colors.white,
              ),

              child: const Text(
                'Tolak',
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

// =================================
// WIDGET DETAIL CARD
// =================================

class DetailCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;

  const DetailCard({
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

        borderRadius:
            BorderRadius.circular(16),

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
              borderRadius:
                  BorderRadius.circular(13),
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
                    color:
                        AppColors.textSecondary,

                    fontSize: 14,
                  ),
                ),

                const SizedBox(height: 4),

                Text(
                  value,

                  style: const TextStyle(
                    color:
                        AppColors.textPrimary,

                    fontSize: 17,

                    fontWeight:
                        FontWeight.bold,
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