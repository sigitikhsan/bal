import 'package:flutter/material.dart';
import 'loan/pemilihan_peminjaman_page.dart';

class DetailBarangPage extends StatelessWidget {
  final String nama;
  final String kode;
  final String kondisi;
  final String status;

  const DetailBarangPage({
    super.key,
    required this.nama,
    required this.kode,
    required this.kondisi,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    final bool tersedia = status == 'Tersedia';

    return Scaffold(
      backgroundColor: const Color(0xFFF2F4F8),

      appBar: AppBar(
        backgroundColor: const Color(0xFF304B70),

        title: const Text(
          'Detail Barang',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),

        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            // IKON BARANG
            Center(
              child: Container(
                width: 130,
                height: 130,

                decoration: BoxDecoration(
                  color: const Color(0xFFE7EDF5),

                  borderRadius:
                      BorderRadius.circular(25),
                ),

                child: const Icon(
                  Icons.inventory_2_outlined,

                  size: 70,

                  color: Color(0xFF304B70),
                ),
              ),
            ),

            const SizedBox(height: 25),

            // NAMA BARANG
            Center(
              child: Text(
                nama,

                textAlign: TextAlign.center,

                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 10),

            // STATUS
            Center(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 7,
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

                    fontWeight:
                        FontWeight.bold,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 30),

            // INFORMASI BARANG
            Container(
              width: double.infinity,

              padding: const EdgeInsets.all(20),

              decoration: BoxDecoration(
                color: Colors.white,

                borderRadius:
                    BorderRadius.circular(18),

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
                children: [
                  _infoItem(
                    icon: Icons.qr_code,

                    judul: 'Kode Barang',

                    isi: kode,
                  ),

                  const Divider(
                    height: 30,
                  ),

                  _infoItem(
                    icon:
                        Icons.health_and_safety_outlined,

                    judul: 'Kondisi',

                    isi: kondisi,
                  ),

                  const Divider(
                    height: 30,
                  ),

                  _infoItem(
                    icon:
                        Icons.check_circle_outline,

                    judul: 'Status',

                    isi: status,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // TOMBOL PINJAM
            SizedBox(
              width: double.infinity,

              height: 55,

              child: ElevatedButton(
                onPressed: tersedia
                    ? () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                const PemilihanPeminjamanPage(),
                             ),
                          );
                      }
                    : null,

                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      const Color(0xFF304B70),

                  foregroundColor:
                      Colors.white,

                  disabledBackgroundColor:
                      Colors.grey.shade300,

                  shape:
                      RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(14),
                  ),
                ),

                child: Text(
                  tersedia
                      ? 'Ajukan Peminjaman'
                      : 'Barang Tidak Tersedia',

                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight:
                        FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _infoItem({
    required IconData icon,
    required String judul,
    required String isi,
  }) {
    return Row(
      children: [
        Icon(
          icon,

          color: const Color(
            0xFF304B70,
          ),
        ),

        const SizedBox(width: 15),          

        Expanded(
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start,

            children: [
              Text(
                judul,

                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 13,
                ),
              ),

              const SizedBox(height: 4),

              Text(
                isi,

                style: const TextStyle(
                  fontSize: 16,
                  fontWeight:
                      FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}