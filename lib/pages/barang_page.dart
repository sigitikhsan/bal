import 'package:flutter/material.dart';
import 'detail_barang.dart';

class BarangPage extends StatelessWidget {
  const BarangPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Data barang sementara
    final List<Map<String, String>> daftarBarang = [
      {
        'nama': 'Laptop Lenovo',
        'kode': 'BRG-001',
        'kondisi': 'Baik',
        'status': 'Tersedia',
      },
      {
        'nama': 'Handy Talky',
        'kode': 'BRG-002',
        'kondisi': 'Baik',
        'status': 'Tersedia',
      },
      {
        'nama': 'Kamera Canon',
        'kode': 'BRG-003',
        'kondisi': 'Baik',
        'status': 'Dipinjam',
      },
      {
        'nama': 'Proyektor Epson',
        'kode': 'BRG-004',
        'kondisi': 'Baik',
        'status': 'Tersedia',
      },
      {
        'nama': 'Printer HP',
        'kode': 'BRG-005',
        'kondisi': 'Perlu Perbaikan',
        'status': 'Tidak Tersedia',
      },
    ];

    return Column(
      children: [
        // BAGIAN PENCARIAN
        Padding(
          padding: const EdgeInsets.all(20),
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Cari barang...',
              prefixIcon: const Icon(
                Icons.search,
              ),
              filled: true,
              fillColor: Colors.white,

              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),

        // JUDUL DAN JUMLAH BARANG
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Row(
            children: [
              const Text(
                'Daftar Barang',
                style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const Spacer(),

              Text(
                '${daftarBarang.length} Barang',
                style: const TextStyle(
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 15),

        // DAFTAR BARANG
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),

            itemCount: daftarBarang.length,

            itemBuilder: (context, index) {
              final barang = daftarBarang[index];

              return _barangCard(
                context: context,
                nama: barang['nama']!,
                kode: barang['kode']!,
                kondisi: barang['kondisi']!,
                status: barang['status']!,
              );
            },
          ),
        ),
      ],
    );
  }

  // KARTU BARANG
  Widget _barangCard({
    required BuildContext context,
    required String nama,
    required String kode,
    required String kondisi,
    required String status,
  }) {
    final bool tersedia = status == 'Tersedia';

    return Container(
      margin: const EdgeInsets.only(
        bottom: 15,
      ),

      padding: const EdgeInsets.all(16),

      decoration: BoxDecoration(
        color: Colors.white,

        borderRadius: BorderRadius.circular(16),

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

      child: Row(
        children: [
          // IKON BARANG
          Container(
            width: 60,
            height: 60,

            decoration: BoxDecoration(
              color: const Color(
                0xFFE7EDF5,
              ),

              borderRadius: BorderRadius.circular(14),
            ),

            child: const Icon(
              Icons.inventory_2_outlined,

              color: Color(
                0xFF304B70,
              ),

              size: 32,
            ),
          ),

          const SizedBox(width: 15),

          // INFORMASI BARANG
          Expanded(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,

              children: [
                Text(
                  nama,

                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 5),

                Text(
                  kode,

                  style: const TextStyle(
                    color: Colors.grey,
                  ),
                ),

                const SizedBox(height: 5),

                Text(
                  'Kondisi: $kondisi',

                  style: const TextStyle(
                    fontSize: 13,
                    color: Colors.grey,
                  ),
                ),

                const SizedBox(height: 8),

                // STATUS BARANG
                Container(
                  padding:
                      const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5,
                  ),

                  decoration: BoxDecoration(
                    color: tersedia
                        ? Colors.green.shade100
                        : Colors.red.shade100,

                    borderRadius:
                        BorderRadius.circular(20),
                  ),

                  child: Text(
                    status,

                    style: TextStyle(
                      color: tersedia
                          ? Colors.green.shade800
                          : Colors.red.shade800,

                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // TOMBOL DETAIL
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      DetailBarangPage(
                    nama: nama,
                    kode: kode,
                    kondisi: kondisi,
                    status: status,
                  ),
                ),
              );
            },

            icon: const Icon(
              Icons.arrow_forward_ios,
              size: 18,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}