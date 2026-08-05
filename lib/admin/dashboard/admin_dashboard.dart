import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';
import '../permohonan/daftar_permohonan_page.dart';
import '../perangkat/daftar_perangkat_page.dart';
import '../pengembalian/pengembalian_page.dart';

class AdminDashboardPage extends StatelessWidget {
  const AdminDashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        scrolledUnderElevation: 0,

        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Halo, Admin 👋',
              style: TextStyle(
                color: AppColors.textPrimary,
                fontSize: 21,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 3),

            Text(
              'Kelola perangkat dan peminjaman',
              style: TextStyle(
                color: AppColors.textSecondary,
                fontSize: 12,
              ),
            ),
          ],
        ),

        actions: [
          IconButton(
            onPressed: () {
              // Halaman notifikasi nanti
            },

            icon: const Icon(
              Icons.notifications_none_rounded,
              color: AppColors.textPrimary,
              size: 27,
            ),
          ),

          const SizedBox(width: 5),
        ],
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(
          16,
          10,
          16,
          25,
        ),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            // =========================
            // RINGKASAN
            // =========================

            const Text(
              'Ringkasan',
              style: TextStyle(
                color: AppColors.textPrimary,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),

            GridView.count(
              crossAxisCount: 2,

              shrinkWrap: true,

              physics:
                  const NeverScrollableScrollPhysics(),

              crossAxisSpacing: 12,

              mainAxisSpacing: 12,

              childAspectRatio: 1.55,

              children: const [
                AdminStatCard(
                  jumlah: '12',
                  judul: 'Total Perangkat',
                  icon:
                      Icons.devices_other_outlined,
                  warna:
                      AppColors.primary,
                  warnaLatar:
                      Color(0xFFE3F2FD),
                ),

                AdminStatCard(
                  jumlah: '8',
                  judul: 'Total Pengguna',
                  icon:
                      Icons.people_outline,
                  warna:
                      AppColors.primary,
                  warnaLatar:
                      Color(0xFFE3F2FD),
                ),

                AdminStatCard(
                  jumlah: '5',
                  judul: 'Menunggu Approval',
                  icon:
                      Icons.pending_actions_outlined,
                  warna:
                      AppColors.warning,
                  warnaLatar:
                      Color(0xFFFFF3E0),
                ),

                AdminStatCard(
                  jumlah: '3',
                  judul: 'Maintenance',
                  icon:
                      Icons.build_outlined,
                  warna:
                      AppColors.danger,
                  warnaLatar:
                      Color(0xFFFFEBEE),
                ),
              ],
            ),

            const SizedBox(height: 26),

            // =========================
            // MENU CEPAT
            // =========================

            const Text(
              'Menu Cepat',
              style: TextStyle(
                color: AppColors.textPrimary,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),

            Row(
              children: [
                // PERMOHONAN

                Expanded(
                  child: AdminMenuCard(
                    icon:
                        Icons.description_outlined,

                    title:
                        'Permohonan',

                    onTap: () {
                      Navigator.push(
                        context,

                        MaterialPageRoute(
                          builder: (context) =>
                              const DaftarPermohonanPage(),
                        ),
                      );
                    },
                  ),
                ),

                const SizedBox(width: 10),

                // PERANGKAT

                Expanded(
                  child: AdminMenuCard(
                    icon:
                        Icons.devices_other_outlined,

                    title:
                        'Perangkat',

                    onTap: () {
                      Navigator.push(
                        context,

                        MaterialPageRoute(
                          builder: (context) =>
                              const DaftarPerangkatPage(),
                        ),
                      );
                    },
                  ),
                ),

                const SizedBox(width: 10),

                // PENGEMBALIAN

                Expanded(
                  child: AdminMenuCard(
                    icon:
                        Icons.assignment_return_outlined,

                    title:
                        'Pengembalian',

                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const PengembalianPage(),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),

            const SizedBox(height: 26),

            // =========================
            // AKTIVITAS TERBARU
            // =========================

            Row(
              mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,

              children: [
                const Text(
                  'Aktivitas Terbaru',
                  style: TextStyle(
                    color:
                        AppColors.textPrimary,
                    fontSize: 18,
                    fontWeight:
                        FontWeight.bold,
                  ),
                ),

                TextButton(
                  onPressed: () {
                    // Halaman riwayat nanti
                  },

                  child: const Text(
                    'Lihat Semua',

                    style: TextStyle(
                      color:
                          AppColors.primary,
                    ),
                  ),
                ),
              ],
            ),

            const AdminActivityCard(
              nama:
                  'Andi Pratama',

              perangkat:
                  'Laptop Lenovo ThinkPad',

              status:
                  'Menunggu',

              warnaStatus:
                  AppColors.warning,
            ),

            const SizedBox(height: 10),

            const AdminActivityCard(
              nama:
                  'Siti Aisyah',

              perangkat:
                  'HT Motorola',

              status:
                  'Disetujui',

              warnaStatus:
                  AppColors.success,
            ),

            const SizedBox(height: 10),

            const AdminActivityCard(
              nama:
                  'Budi Santoso',

              perangkat:
                  'Laptop ASUS',

              status:
                  'Dikembalikan',

              warnaStatus:
                  AppColors.primary,
            ),
          ],
        ),
      ),
    );
  }
}

// =================================
// KARTU STATISTIK
// =================================

class AdminStatCard extends StatelessWidget {
  final String jumlah;
  final String judul;
  final IconData icon;
  final Color warna;
  final Color warnaLatar;

  const AdminStatCard({
    super.key,
    required this.jumlah,
    required this.judul,
    required this.icon,
    required this.warna,
    required this.warnaLatar,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          const EdgeInsets.all(14),

      decoration:
          BoxDecoration(
        color:
            warnaLatar,

        borderRadius:
            BorderRadius.circular(16),

        border:
            Border.all(
          color:
              AppColors.border,
        ),
      ),

      child: Row(
        children: [
          Container(
            width:
                42,

            height:
                42,

            decoration:
                BoxDecoration(
              color:
                  AppColors.card,

              borderRadius:
                  BorderRadius.circular(
                12,
              ),

              boxShadow:
                  const [
                BoxShadow(
                  color:
                      AppColors.shadow,

                  blurRadius:
                      5,

                  offset:
                      Offset(
                    0,
                    2,
                  ),
                ),
              ],
            ),

            child: Icon(
              icon,

              color:
                  warna,

              size:
                  24,
            ),
          ),

          const SizedBox(
            width:
                10,
          ),

          Expanded(
            child: Column(
              mainAxisAlignment:
                  MainAxisAlignment.center,

              crossAxisAlignment:
                  CrossAxisAlignment.start,

              children: [
                Text(
                  jumlah,

                  style:
                      TextStyle(
                    color:
                        warna,

                    fontSize:
                        23,

                    fontWeight:
                        FontWeight.bold,
                  ),
                ),

                const SizedBox(
                  height:
                      2,
                ),

                Text(
                  judul,

                  maxLines:
                      2,

                  overflow:
                      TextOverflow.ellipsis,

                  style:
                      const TextStyle(
                    color:
                        AppColors
                            .textSecondary,

                    fontSize:
                        11,
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

// =================================
// MENU CEPAT
// =================================

class AdminMenuCard
    extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const AdminMenuCard({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(
    BuildContext context,
  ) {
    return InkWell(
      onTap:
          onTap,

      borderRadius:
          BorderRadius.circular(
        14,
      ),

      child:
          Container(
        padding:
            const EdgeInsets
                .symmetric(
          vertical:
              14,

          horizontal:
              5,
        ),

        decoration:
            BoxDecoration(
          color:
              AppColors.card,

          borderRadius:
              BorderRadius.circular(
            14,
          ),

          border:
              Border.all(
            color:
                AppColors.border,
          ),

          boxShadow:
              const [
            BoxShadow(
              color:
                  AppColors.shadow,

              blurRadius:
                  5,

              offset:
                  Offset(
                0,
                2,
              ),
            ),
          ],
        ),

        child:
            Column(
          mainAxisSize:
              MainAxisSize.min,

          children: [
            Icon(
              icon,

              color:
                  AppColors.primary,

              size:
                  28,
            ),

            const SizedBox(
              height:
                  7,
            ),

            Text(
              title,

              textAlign:
                  TextAlign.center,

              maxLines:
                  2,

              overflow:
                  TextOverflow.ellipsis,

              style:
                  const TextStyle(
                color:
                    AppColors
                        .textPrimary,

                fontSize:
                    12,

                fontWeight:
                    FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// =================================
// KARTU AKTIVITAS
// =================================

class AdminActivityCard
    extends StatelessWidget {
  final String nama;
  final String perangkat;
  final String status;
  final Color warnaStatus;

  const AdminActivityCard({
    super.key,
    required this.nama,
    required this.perangkat,
    required this.status,
    required this.warnaStatus,
  });

  @override
  Widget build(
    BuildContext context,
  ) {
    return Container(
      padding:
          const EdgeInsets.all(
        13,
      ),

      decoration:
          BoxDecoration(
        color:
            AppColors.card,

        borderRadius:
            BorderRadius.circular(
          15,
        ),

        border:
            Border.all(
          color:
              AppColors.border,
        ),
      ),

      child:
          Row(
        children: [
          CircleAvatar(
            radius:
                21,

            backgroundColor:
                AppColors
                    .primaryLight,

            child:
                Text(
              nama[0],

              style:
                  const TextStyle(
                color:
                    Colors.white,

                fontSize:
                    16,

                fontWeight:
                    FontWeight.bold,
              ),
            ),
          ),

          const SizedBox(
            width:
                12,
          ),

          Expanded(
            child:
                Column(
              crossAxisAlignment:
                  CrossAxisAlignment
                      .start,

              children: [
                Text(
                  nama,

                  style:
                      const TextStyle(
                    color:
                        AppColors
                            .textPrimary,

                    fontSize:
                        15,

                    fontWeight:
                        FontWeight
                            .bold,
                  ),
                ),

                const SizedBox(
                  height:
                      3,
                ),

                Text(
                  perangkat,

                  maxLines:
                      1,

                  overflow:
                      TextOverflow
                          .ellipsis,

                  style:
                      const TextStyle(
                    color:
                        AppColors
                            .textSecondary,

                    fontSize:
                        12,
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
                  9,

              vertical:
                  5,
            ),

            decoration:
                BoxDecoration(
              color:
                  warnaStatus
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
                    warnaStatus,

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
    );
  }
}