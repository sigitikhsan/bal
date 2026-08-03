import 'package:flutter/material.dart';

class RiwayatPage extends StatelessWidget {
  const RiwayatPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Data sementara
    final List<Map<String, String>> daftarRiwayat = [
      {
        'nama': 'Kamera Canon',
        'kode': 'BRG-005',
        'tanggalPinjam': '20/07/2026',
        'tanggalKembali': '22/07/2026',
        'status': 'Selesai',
      },
      {
        'nama': 'Tripod Kamera',
        'kode': 'BRG-006',
        'tanggalPinjam': '15/07/2026',
        'tanggalKembali': '17/07/2026',
        'status': 'Selesai',
      },
      {
        'nama': 'Laptop Asus',
        'kode': 'BRG-003',
        'tanggalPinjam': '10/07/2026',
        'tanggalKembali': '12/07/2026',
        'status': 'Ditolak',
      },
    ];

    return Column(
      children: [
        // BAGIAN ATAS
        Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: const Color(0xFFE7EDF5),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: const Icon(
                  Icons.history,
                  color: Color(0xFF304B70),
                  size: 28,
                ),
              ),

              const SizedBox(width: 15),

              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Riwayat Peminjaman',
                      style: TextStyle(
                        fontSize: 21,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(height: 4),

                    Text(
                      'Lihat riwayat peminjaman barang',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        // DAFTAR RIWAYAT
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),

            itemCount: daftarRiwayat.length,

            itemBuilder: (context, index) {
              final riwayat = daftarRiwayat[index];

              return _riwayatCard(
                nama: riwayat['nama']!,
                kode: riwayat['kode']!,
                tanggalPinjam: riwayat['tanggalPinjam']!,
                tanggalKembali: riwayat['tanggalKembali']!,
                status: riwayat['status']!,
              );
            },
          ),
        ),
      ],
    );
  }

  // KARTU RIWAYAT
  Widget _riwayatCard({
    required String nama,
    required String kode,
    required String tanggalPinjam,
    required String tanggalKembali,
    required String status,
  }) {
    // WARNA STATUS
    Color warnaStatus;

    if (status == 'Selesai') {
      warnaStatus = Colors.green;
    } else if (status == 'Ditolak') {
      warnaStatus = Colors.red;
    } else {
      warnaStatus = Colors.orange;
    }

    return Container(
      margin: const EdgeInsets.only(
        bottom: 15,
      ),

      padding: const EdgeInsets.all(17),

      decoration: BoxDecoration(
        color: Colors.white,

        borderRadius: BorderRadius.circular(17),

        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(
              alpha: 0.06,
            ),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          // NAMA BARANG DAN STATUS
          Row(
            children: [
              Container(
                width: 48,
                height: 48,

                decoration: BoxDecoration(
                  color: const Color(0xFFE7EDF5),

                  borderRadius: BorderRadius.circular(13),
                ),

                child: const Icon(
                  Icons.inventory_2_outlined,

                  color: Color(0xFF304B70),
                ),
              ),

              const SizedBox(width: 13),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    Text(
                      nama,

                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 4),

                    Text(
                      kode,

                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ),

              // STATUS
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 6,
                ),

                decoration: BoxDecoration(
                  color: warnaStatus.withValues(
                    alpha: 0.15,
                  ),

                  borderRadius: BorderRadius.circular(20),
                ),

                child: Text(
                  status,

                  style: TextStyle(
                    color: warnaStatus,
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),

          const Divider(
            height: 28,
          ),

          // TANGGAL PEMINJAMAN
          Row(
            children: [
              const Icon(
                Icons.calendar_month_outlined,
                color: Color(0xFF304B70),
                size: 20,
              ),

              const SizedBox(width: 10),

              Text(
                '$tanggalPinjam - $tanggalKembali',

                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}