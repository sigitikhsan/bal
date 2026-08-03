import 'package:flutter/material.dart';

class PeminjamanSayaPage extends StatefulWidget {
  const PeminjamanSayaPage({super.key});

  @override
  State<PeminjamanSayaPage> createState() =>
      _PeminjamanSayaPageState();
}

class _PeminjamanSayaPageState extends State<PeminjamanSayaPage> {
  final TextEditingController searchController =
      TextEditingController();

  String selectedFilter = 'Semua';

  final List<Map<String, dynamic>> daftarPeminjaman = [
    {
      'nama': 'Laptop Lenovo ThinkPad',
      'kode': 'BRG-001',
      'tanggalPinjam': '10 Agustus 2026',
      'tanggalKembali': '15 Agustus 2026',
      'keperluan': 'Kegiatan monitoring lapangan',
      'status': 'Menunggu',
      'icon': Icons.laptop_mac_outlined,
    },
    {
      'nama': 'Handy Talky Motorola',
      'kode': 'BRG-002',
      'tanggalPinjam': '5 Agustus 2026',
      'tanggalKembali': '8 Agustus 2026',
      'keperluan': 'Komunikasi kegiatan lapangan',
      'status': 'Disetujui',
      'icon': Icons.settings_input_antenna,
    },
    {
      'nama': 'Proyektor Epson',
      'kode': 'BRG-004',
      'tanggalPinjam': '1 Agustus 2026',
      'tanggalKembali': '3 Agustus 2026',
      'keperluan': 'Presentasi kegiatan',
      'status': 'Dipinjam',
      'icon': Icons.video_camera_back_outlined,
    },
    {
      'nama': 'Kamera Canon',
      'kode': 'BRG-005',
      'tanggalPinjam': '2 Agustus 2026',
      'tanggalKembali': '6 Agustus 2026',
      'keperluan': 'Dokumentasi kegiatan',
      'status': 'Ditolak',
      'icon': Icons.camera_alt_outlined,
    },
  ];

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  List<Map<String, dynamic>> get filteredData {
    final String keyword =
        searchController.text.trim().toLowerCase();

    return daftarPeminjaman.where((item) {
      final String nama =
          item['nama'].toString().toLowerCase();

      final String kode =
          item['kode'].toString().toLowerCase();

      final String status = item['status'].toString();

      final bool cocokPencarian =
          nama.contains(keyword) || kode.contains(keyword);

      final bool cocokFilter =
          selectedFilter == 'Semua' ||
          status == selectedFilter;

      return cocokPencarian && cocokFilter;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> data = filteredData;

    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),

      appBar: AppBar(
        backgroundColor: const Color(0xFF304B70),
        elevation: 0,

        iconTheme: const IconThemeData(
          color: Colors.white,
        ),

        title: const Text(
          'Peminjaman Saya',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: Column(
        children: [
          _buildHeader(),

          Expanded(
            child: data.isEmpty
                ? _buildEmptyState()
                : ListView.builder(
                    padding: const EdgeInsets.fromLTRB(
                      20,
                      20,
                      20,
                      30,
                    ),
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      return _buildPeminjamanCard(
                        context,
                        data[index],
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      width: double.infinity,

      padding: const EdgeInsets.fromLTRB(
        20,
        8,
        20,
        22,
      ),

      decoration: const BoxDecoration(
        color: Color(0xFF304B70),

        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(28),
          bottomRight: Radius.circular(28),
        ),
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          const Text(
            'Pantau status peminjaman Anda',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 6),

          const Text(
            'Lihat pengajuan dan barang yang sedang dipinjam.',
            style: TextStyle(
              color: Colors.white70,
              fontSize: 14,
            ),
          ),

          const SizedBox(height: 20),

          TextField(
            controller: searchController,

            onChanged: (_) {
              setState(() {});
            },

            decoration: InputDecoration(
              hintText: 'Cari nama atau kode barang...',

              prefixIcon: const Icon(
                Icons.search,
                color: Color(0xFF304B70),
              ),

              suffixIcon: searchController.text.isNotEmpty
                  ? IconButton(
                      onPressed: () {
                        searchController.clear();
                        setState(() {});
                      },
                      icon: const Icon(
                        Icons.close,
                        color: Colors.grey,
                      ),
                    )
                  : null,

              filled: true,
              fillColor: Colors.white,

              contentPadding: const EdgeInsets.symmetric(
                vertical: 15,
              ),

              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide.none,
              ),

              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide.none,
              ),

              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(
                  color: Color(0xFF88A4C5),
                  width: 2,
                ),
              ),
            ),
          ),

          const SizedBox(height: 17),

          SingleChildScrollView(
            scrollDirection: Axis.horizontal,

            child: Row(
              children: [
                _buildFilterChip('Semua'),
                _buildFilterChip('Menunggu'),
                _buildFilterChip('Disetujui'),
                _buildFilterChip('Dipinjam'),
                _buildFilterChip('Ditolak'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterChip(String label) {
    final bool dipilih = selectedFilter == label;

    return Padding(
      padding: const EdgeInsets.only(right: 10),

      child: ChoiceChip(
        label: Text(label),

        selected: dipilih,

        onSelected: (_) {
          setState(() {
            selectedFilter = label;
          });
        },

        backgroundColor: Colors.white,

        selectedColor: const Color(0xFFDDE8F5),

        side: BorderSide(
          color: dipilih
              ? const Color(0xFF88A4C5)
              : Colors.transparent,
        ),

        labelStyle: TextStyle(
          color: dipilih
              ? const Color(0xFF304B70)
              : Colors.grey.shade700,
          fontWeight:
              dipilih ? FontWeight.bold : FontWeight.normal,
        ),

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),

        showCheckmark: false,
      ),
    );
  }

  Widget _buildPeminjamanCard(
    BuildContext context,
    Map<String, dynamic> item,
  ) {
    final String status = item['status'].toString();

    final Color statusColor = _getStatusColor(status);

    final Color statusBackground =
        _getStatusBackground(status);

    return Container(
      margin: const EdgeInsets.only(bottom: 17),

      decoration: BoxDecoration(
        color: Colors.white,

        borderRadius: BorderRadius.circular(20),

        boxShadow: const [
          BoxShadow(
            color: Color(0x14000000),
            blurRadius: 14,
            offset: Offset(0, 5),
          ),
        ],
      ),

      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(18),

            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    Container(
                      width: 58,
                      height: 58,

                      decoration: BoxDecoration(
                        color: const Color(0xFFE7EDF5),

                        borderRadius:
                            BorderRadius.circular(15),
                      ),

                      child: Icon(
                        item['icon'] as IconData,
                        size: 30,
                        color: const Color(0xFF304B70),
                      ),
                    ),

                    const SizedBox(width: 14),

                    Expanded(
                      child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start,

                        children: [
                          Text(
                            item['nama'].toString(),

                            style: const TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF1F2937),
                            ),
                          ),

                          const SizedBox(height: 5),

                          Text(
                            item['kode'].toString(),

                            style: const TextStyle(
                              fontSize: 13,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),

                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 11,
                        vertical: 7,
                      ),

                      decoration: BoxDecoration(
                        color: statusBackground,

                        borderRadius:
                            BorderRadius.circular(20),
                      ),

                      child: Text(
                        status,

                        style: TextStyle(
                          color: statusColor,
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),

                const Divider(height: 30),

                _buildInfoRow(
                  icon: Icons.calendar_today_outlined,
                  label: 'Tanggal Pinjam',
                  value: item['tanggalPinjam'].toString(),
                ),

                const SizedBox(height: 14),

                _buildInfoRow(
                  icon: Icons.event_available_outlined,
                  label: 'Tanggal Kembali',
                  value: item['tanggalKembali'].toString(),
                ),

                const SizedBox(height: 14),

                _buildInfoRow(
                  icon: Icons.description_outlined,
                  label: 'Keperluan',
                  value: item['keperluan'].toString(),
                ),
              ],
            ),
          ),

          Container(
            width: double.infinity,

            decoration: const BoxDecoration(
              color: Color(0xFFF8FAFC),

              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),

            child: TextButton(
              onPressed: () {
                _showDetailPeminjaman(
                  context,
                  item,
                );
              },

              style: TextButton.styleFrom(
                foregroundColor:
                    const Color(0xFF304B70),

                padding: const EdgeInsets.symmetric(
                  vertical: 15,
                ),

                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
              ),

              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  Text(
                    'Lihat Detail',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(width: 7),

                  Icon(
                    Icons.arrow_forward,
                    size: 18,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow({
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        Container(
          padding: const EdgeInsets.all(8),

          decoration: BoxDecoration(
            color: const Color(0xFFEFF4FA),

            borderRadius: BorderRadius.circular(10),
          ),

          child: Icon(
            icon,
            size: 19,
            color: const Color(0xFF304B70),
          ),
        ),

        const SizedBox(width: 12),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Text(
                label,

                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),

              const SizedBox(height: 3),

              Text(
                value,

                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF374151),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(30),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            Container(
              width: 120,
              height: 120,

              decoration: const BoxDecoration(
                color: Color(0xFFE7EDF5),
                shape: BoxShape.circle,
              ),

              child: const Icon(
                Icons.assignment_outlined,
                size: 60,
                color: Color(0xFF304B70),
              ),
            ),

            const SizedBox(height: 24),

            const Text(
              'Peminjaman tidak ditemukan',

              textAlign: TextAlign.center,

              style: TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1F2937),
              ),
            ),

            const SizedBox(height: 8),

            const Text(
              'Coba gunakan kata pencarian atau filter yang berbeda.',

              textAlign: TextAlign.center,

              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
                height: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color _getStatusColor(String status) {
    switch (status) {
      case 'Menunggu':
        return const Color(0xFFB45309);

      case 'Disetujui':
        return const Color(0xFF15803D);

      case 'Dipinjam':
        return const Color(0xFF1D4ED8);

      case 'Ditolak':
        return const Color(0xFFB91C1C);

      default:
        return Colors.grey.shade700;
    }
  }

  Color _getStatusBackground(String status) {
    switch (status) {
      case 'Menunggu':
        return const Color(0xFFFFF3CD);

      case 'Disetujui':
        return const Color(0xFFDCFCE7);

      case 'Dipinjam':
        return const Color(0xFFDBEAFE);

      case 'Ditolak':
        return const Color(0xFFFEE2E2);

      default:
        return Colors.grey.shade200;
    }
  }

  void _showDetailPeminjaman(
    BuildContext context,
    Map<String, dynamic> item,
  ) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,

      builder: (context) {
        final String status = item['status'].toString();

        final Color statusColor =
            _getStatusColor(status);

        return Container(
          padding: const EdgeInsets.fromLTRB(
            22,
            14,
            22,
            30,
          ),

          decoration: const BoxDecoration(
            color: Colors.white,

            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(28),
              topRight: Radius.circular(28),
            ),
          ),

          child: SafeArea(
            top: false,

            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Center(
                  child: Container(
                    width: 48,
                    height: 5,

                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,

                      borderRadius:
                          BorderRadius.circular(20),
                    ),
                  ),
                ),

                const SizedBox(height: 22),

                const Text(
                  'Detail Peminjaman',

                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 22),

                _buildBottomSheetRow(
                  'Nama Barang',
                  item['nama'].toString(),
                ),

                _buildBottomSheetRow(
                  'Kode Barang',
                  item['kode'].toString(),
                ),

                _buildBottomSheetRow(
                  'Tanggal Pinjam',
                  item['tanggalPinjam'].toString(),
                ),

                _buildBottomSheetRow(
                  'Tanggal Kembali',
                  item['tanggalKembali'].toString(),
                ),

                _buildBottomSheetRow(
                  'Keperluan',
                  item['keperluan'].toString(),
                ),

                const SizedBox(height: 8),

                Row(
                  mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,

                  children: [
                    const Text(
                      'Status',

                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),

                    Text(
                      status,

                      style: TextStyle(
                        color: statusColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 25),

                SizedBox(
                  width: double.infinity,
                  height: 50,

                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },

                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          const Color(0xFF304B70),

                      foregroundColor: Colors.white,

                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(14),
                      ),
                    ),

                    child: const Text(
                      'TUTUP',

                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildBottomSheetRow(
    String label,
    String value,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),

      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          SizedBox(
            width: 125,

            child: Text(
              label,

              style: const TextStyle(
                color: Colors.grey,
              ),
            ),
          ),

          Expanded(
            child: Text(
              value,

              textAlign: TextAlign.right,

              style: const TextStyle(
                fontWeight: FontWeight.w600,
                color: Color(0xFF374151),
              ),
            ),
          ),
        ],
      ),
    );
  }
}