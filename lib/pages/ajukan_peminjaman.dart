import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class AjukanPeminjamanPage extends StatefulWidget {
  const AjukanPeminjamanPage({super.key});

  @override
  State<AjukanPeminjamanPage> createState() =>
      _AjukanPeminjamanPageState();
}

class _AjukanPeminjamanPageState
    extends State<AjukanPeminjamanPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController namaController =
      TextEditingController();

  final TextEditingController keperluanController =
      TextEditingController();

  String? perangkatDipilih;

  DateTime? tanggalPinjam;
  DateTime? tanggalKembali;

  final List<String> daftarPerangkat = [
    'Handy Talky',
    'Spectrum Analyzer',
    'Laptop Monitoring',
    'Antena Monitoring',
    'Radio Receiver',
  ];

  @override
  void dispose() {
    namaController.dispose();
    keperluanController.dispose();
    super.dispose();
  }

  Future<void> pilihTanggal({
    required bool tanggalMulai,
  }) async {
    final DateTime sekarang = DateTime.now();

    final DateTime? hasil = await showDatePicker(
      context: context,
      initialDate: tanggalMulai
          ? (tanggalPinjam ?? sekarang)
          : (tanggalKembali ??
              tanggalPinjam ??
              sekarang),
      firstDate: sekarang,
      lastDate: DateTime(2035),
    );

    if (hasil == null) return;

    setState(() {
      if (tanggalMulai) {
        tanggalPinjam = hasil;

        // Jika tanggal kembali lebih awal,
        // tanggal kembali dihapus.
        if (tanggalKembali != null &&
            tanggalKembali!.isBefore(hasil)) {
          tanggalKembali = null;
        }
      } else {
        tanggalKembali = hasil;
      }
    });
  }

  String formatTanggal(DateTime? tanggal) {
    if (tanggal == null) {
      return 'Pilih tanggal';
    }

    return '${tanggal.day.toString().padLeft(2, '0')}/'
        '${tanggal.month.toString().padLeft(2, '0')}/'
        '${tanggal.year}';
  }

  void ajukanPeminjaman() {
    final bool formValid =
        _formKey.currentState!.validate();

    if (!formValid) return;

    if (perangkatDipilih == null) {
      tampilkanPesan(
        'Silakan pilih perangkat',
        warna: AppColors.warning,
      );
      return;
    }

    if (tanggalPinjam == null) {
      tampilkanPesan(
        'Silakan pilih tanggal peminjaman',
        warna: AppColors.warning,
      );
      return;
    }

    if (tanggalKembali == null) {
      tampilkanPesan(
        'Silakan pilih tanggal pengembalian',
        warna: AppColors.warning,
      );
      return;
    }

    if (tanggalKembali!.isBefore(tanggalPinjam!)) {
      tampilkanPesan(
        'Tanggal kembali tidak boleh lebih awal',
        warna: AppColors.danger,
      );
      return;
    }

    tampilkanDialogBerhasil();
  }

  void tampilkanPesan(
    String pesan, {
    required Color warna,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(pesan),
        backgroundColor: warna,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void tampilkanDialogBerhasil() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(22),
          ),
          title: const Column(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundColor: Color(0xFFE8F5E9),
                child: Icon(
                  Icons.check_rounded,
                  size: 35,
                  color: AppColors.success,
                ),
              ),
              SizedBox(height: 14),
              Text(
                'Pengajuan Berhasil',
                textAlign: TextAlign.center,
              ),
            ],
          ),
          content: const Text(
            'Permohonan peminjaman berhasil dikirim '
            'dan sedang menunggu persetujuan.',
            textAlign: TextAlign.center,
          ),
          actions: [
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pop(context);
                },
                child: const Text('Kembali'),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      appBar: AppBar(
        title: const Text(
          'Ajukan Peminjaman',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        elevation: 0,
      ),

      body: SafeArea(
        child: Form(
          key: _formKey,

          child: SingleChildScrollView(
            padding: const EdgeInsets.all(18),

            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,

              children: [
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(18),

                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [
                        AppColors.primary,
                        AppColors.primaryLight,
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),

                    borderRadius:
                        BorderRadius.circular(20),
                  ),

                  child: const Row(
                    children: [
                      CircleAvatar(
                        radius: 27,
                        backgroundColor:
                            Colors.white24,

                        child: Icon(
                          Icons.assignment_add,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),

                      SizedBox(width: 15),

                      Expanded(
                        child: Column(
                          crossAxisAlignment:
                              CrossAxisAlignment.start,

                          children: [
                            Text(
                              'Form Peminjaman',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 19,
                                fontWeight:
                                    FontWeight.bold,
                              ),
                            ),

                            SizedBox(height: 4),

                            Text(
                              'Lengkapi data untuk '
                              'mengajukan perangkat',
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 24),

                const Text(
                  'Data Peminjam',
                  style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary,
                  ),
                ),

                const SizedBox(height: 12),

                TextFormField(
                  controller: namaController,

                  textCapitalization:
                      TextCapitalization.words,

                  decoration: const InputDecoration(
                    labelText: 'Nama Peminjam',
                    hintText:
                        'Masukkan nama lengkap',

                    prefixIcon: Icon(
                      Icons.person_outline,
                    ),
                  ),

                  validator: (value) {
                    if (value == null ||
                        value.trim().isEmpty) {
                      return 'Nama wajib diisi';
                    }

                    return null;
                  },
                ),

                const SizedBox(height: 22),

                const Text(
                  'Perangkat',
                  style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary,
                  ),
                ),

                const SizedBox(height: 12),

                DropdownButtonFormField<String>(
                  value: perangkatDipilih,

                  isExpanded: true,

                  decoration: const InputDecoration(
                    labelText: 'Pilih Perangkat',

                    prefixIcon: Icon(
                      Icons.devices_other,
                    ),
                  ),

                  hint: const Text(
                    'Pilih perangkat yang dipinjam',
                  ),

                  items: daftarPerangkat
                      .map((perangkat) {
                    return DropdownMenuItem(
                      value: perangkat,
                      child: Text(perangkat),
                    );
                  }).toList(),

                  onChanged: (value) {
                    setState(() {
                      perangkatDipilih = value;
                    });
                  },
                ),

                const SizedBox(height: 22),

                const Text(
                  'Waktu Peminjaman',
                  style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary,
                  ),
                ),

                const SizedBox(height: 12),

                Row(
                  children: [
                    Expanded(
                      child: _tanggalCard(
                        judul: 'Tanggal Pinjam',
                        tanggal:
                            formatTanggal(
                          tanggalPinjam,
                        ),

                        icon:
                            Icons.calendar_today,

                        onTap: () {
                          pilihTanggal(
                            tanggalMulai: true,
                          );
                        },
                      ),
                    ),

                    const SizedBox(width: 12),

                    Expanded(
                      child: _tanggalCard(
                        judul:
                            'Tanggal Kembali',

                        tanggal:
                            formatTanggal(
                          tanggalKembali,
                        ),

                        icon:
                            Icons.event_available,

                        onTap: () {
                          pilihTanggal(
                            tanggalMulai: false,
                          );
                        },
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 22),

                const Text(
                  'Keperluan',
                  style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary,
                  ),
                ),

                const SizedBox(height: 12),

                TextFormField(
                  controller:
                      keperluanController,

                  minLines: 4,
                  maxLines: 5,

                  textCapitalization:
                      TextCapitalization.sentences,

                  decoration:
                      const InputDecoration(
                    labelText:
                        'Keperluan Peminjaman',

                    hintText:
                        'Contoh: Digunakan untuk '
                        'kegiatan monitoring '
                        'frekuensi',

                    alignLabelWithHint: true,

                    prefixIcon: Padding(
                      padding:
                          EdgeInsets.only(
                        bottom: 70,
                      ),

                      child: Icon(
                        Icons.description_outlined,
                      ),
                    ),
                  ),

                  validator: (value) {
                    if (value == null ||
                        value.trim().isEmpty) {
                      return 'Keperluan wajib diisi';
                    }

                    if (value.trim().length < 10) {
                      return 'Keperluan minimal '
                          '10 karakter';
                    }

                    return null;
                  },
                ),

                const SizedBox(height: 28),

                SizedBox(
                  width: double.infinity,
                  height: 54,

                  child: ElevatedButton.icon(
                    onPressed:
                        ajukanPeminjaman,

                    icon: const Icon(
                      Icons.send_rounded,
                    ),

                    label: const Text(
                      'Ajukan Peminjaman',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight:
                            FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 25),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _tanggalCard({
    required String judul,
    required String tanggal,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,

      borderRadius:
          BorderRadius.circular(15),

      child: Container(
        padding:
            const EdgeInsets.all(14),

        decoration: BoxDecoration(
          color: Colors.white,

          borderRadius:
              BorderRadius.circular(15),

          border: Border.all(
            color: AppColors.border,
          ),
        ),

        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,

          children: [
            Icon(
              icon,
              color: AppColors.primary,
              size: 22,
            ),

            const SizedBox(height: 10),

            Text(
              judul,
              style: const TextStyle(
                color:
                    AppColors.textSecondary,
                fontSize: 12,
              ),
            ),

            const SizedBox(height: 4),

            Text(
              tanggal,
              maxLines: 1,

              overflow:
                  TextOverflow.ellipsis,

              style: const TextStyle(
                fontWeight:
                    FontWeight.w600,
                fontSize: 13,
              ),
            ),
          ],
        ),
      ),
    );
  }
}