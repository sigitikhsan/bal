import 'package:flutter/material.dart';

class PengajuanPeminjamanPage extends StatefulWidget {
  final String namaBarang;
  final String kodeBarang;

  const PengajuanPeminjamanPage({
    super.key,
    required this.namaBarang,
    required this.kodeBarang,
  });

  @override
  State<PengajuanPeminjamanPage> createState() =>
      _PengajuanPeminjamanPageState();
}

class _PengajuanPeminjamanPageState
    extends State<PengajuanPeminjamanPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _keperluanController =
      TextEditingController();

  final TextEditingController _catatanController =
      TextEditingController();

  DateTime? _tanggalPinjam;
  DateTime? _tanggalKembali;

  // MEMILIH TANGGAL PINJAM
  Future<void> _pilihTanggalPinjam() async {
    final DateTime? tanggal = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2030),
    );

    if (tanggal != null) {
      setState(() {
        _tanggalPinjam = tanggal;

        // Menghapus tanggal kembali
        // jika tanggal pinjam diganti
        if (_tanggalKembali != null &&
            _tanggalKembali!.isBefore(tanggal)) {
          _tanggalKembali = null;
        }
      });
    }
  }

  // MEMILIH TANGGAL PENGEMBALIAN
  Future<void> _pilihTanggalKembali() async {
    if (_tanggalPinjam == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Pilih tanggal peminjaman terlebih dahulu',
          ),
        ),
      );
      return;
    }

    final DateTime? tanggal = await showDatePicker(
      context: context,
      initialDate: _tanggalPinjam!,
      firstDate: _tanggalPinjam!,
      lastDate: DateTime(2030),
    );

    if (tanggal != null) {
      setState(() {
        _tanggalKembali = tanggal;
      });
    }
  }

  // FORMAT TANGGAL
  String _formatTanggal(DateTime? tanggal) {
    if (tanggal == null) {
      return 'Pilih tanggal';
    }

    return '${tanggal.day.toString().padLeft(2, '0')}/'
        '${tanggal.month.toString().padLeft(2, '0')}/'
        '${tanggal.year}';
  }

  // KIRIM PENGAJUAN
  void _kirimPengajuan() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    if (_tanggalPinjam == null ||
        _tanggalKembali == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Tanggal peminjaman dan pengembalian wajib dipilih',
          ),
        ),
      );
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.green,
        content: Text(
          'Pengajuan ${widget.namaBarang} berhasil dikirim',
        ),
      ),
    );

    // Nanti data dikirim ke backend di bagian ini
  }

  @override
  void dispose() {
    _keperluanController.dispose();
    _catatanController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F4F8),

      appBar: AppBar(
        backgroundColor: const Color(0xFF304B70),

        title: const Text(
          'Ajukan Peminjaman',
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

        child: Form(
          key: _formKey,

          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start,

            children: [
              // INFORMASI BARANG
              Container(
                width: double.infinity,

                padding: const EdgeInsets.all(18),

                decoration: BoxDecoration(
                  color: Colors.white,

                  borderRadius:
                      BorderRadius.circular(16),

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
                    Container(
                      width: 55,
                      height: 55,

                      decoration: BoxDecoration(
                        color: const Color(
                          0xFFE7EDF5,
                        ),

                        borderRadius:
                            BorderRadius.circular(14),
                      ),

                      child: const Icon(
                        Icons.inventory_2_outlined,

                        color: Color(
                          0xFF304B70,
                        ),

                        size: 30,
                      ),
                    ),

                    const SizedBox(width: 15),

                    Expanded(
                      child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start,

                        children: [
                          Text(
                            widget.namaBarang,

                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight:
                                  FontWeight.bold,
                            ),
                          ),

                          const SizedBox(height: 5),

                          Text(
                            widget.kodeBarang,

                            style: const TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 25),

              const Text(
                'Data Peminjaman',

                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 15),

              // TANGGAL PINJAM
              _tanggalButton(
                judul: 'Tanggal Peminjaman',
                tanggal: _formatTanggal(
                  _tanggalPinjam,
                ),
                onTap: _pilihTanggalPinjam,
              ),

              const SizedBox(height: 15),

              // TANGGAL KEMBALI
              _tanggalButton(
                judul: 'Tanggal Pengembalian',
                tanggal: _formatTanggal(
                  _tanggalKembali,
                ),
                onTap: _pilihTanggalKembali,
              ),

              const SizedBox(height: 15),

              // KEPERLUAN
              TextFormField(
                controller: _keperluanController,

                maxLines: 3,

                decoration: InputDecoration(
                  labelText: 'Keperluan',
                  hintText:
                      'Contoh: Kegiatan monitoring',

                  alignLabelWithHint: true,

                  filled: true,
                  fillColor: Colors.white,

                  border: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(14),
                  ),
                ),

                validator: (value) {
                  if (value == null ||
                      value.trim().isEmpty) {
                    return 'Keperluan wajib diisi';
                  }

                  return null;
                },
              ),

              const SizedBox(height: 15),

              // CATATAN
              TextFormField(
                controller: _catatanController,

                maxLines: 3,

                decoration: InputDecoration(
                  labelText:
                      'Catatan Tambahan (Opsional)',

                  hintText:
                      'Tambahkan catatan jika diperlukan',

                  alignLabelWithHint: true,

                  filled: true,
                  fillColor: Colors.white,

                  border: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(14),
                  ),
                ),
              ),

              const SizedBox(height: 30),

              // TOMBOL KIRIM
              SizedBox(
                width: double.infinity,
                height: 54,

                child: ElevatedButton(
                  onPressed: _kirimPengajuan,

                  style:
                      ElevatedButton.styleFrom(
                    backgroundColor:
                        const Color(0xFF304B70),

                    foregroundColor:
                        Colors.white,

                    shape:
                        RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(
                        14,
                      ),
                    ),
                  ),

                  child: const Text(
                    'KIRIM PENGAJUAN',

                    style: TextStyle(
                      fontSize: 16,
                      fontWeight:
                          FontWeight.bold,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  // WIDGET PILIH TANGGAL
  Widget _tanggalButton({
    required String judul,
    required String tanggal,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,

      borderRadius:
          BorderRadius.circular(14),

      child: Container(
        width: double.infinity,

        padding:
            const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 15,
        ),

        decoration: BoxDecoration(
          color: Colors.white,

          borderRadius:
              BorderRadius.circular(14),

          border: Border.all(
            color: Colors.grey.shade400,
          ),
        ),

        child: Row(
          children: [
            const Icon(
              Icons.calendar_month_outlined,

              color: Color(
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
                    tanggal,

                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight:
                          FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),

            const Icon(
              Icons.arrow_drop_down,
            ),
          ],
        ),
      ),
    );
  }
}