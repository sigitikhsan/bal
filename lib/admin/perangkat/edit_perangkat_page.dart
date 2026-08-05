import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';

class EditPerangkatPage extends StatefulWidget {
  final String nama;
  final String kode;
  final String kategori;
  final String kondisi;
  final String status;
  final String lokasi;

  const EditPerangkatPage({
    super.key,
    required this.nama,
    required this.kode,
    required this.kategori,
    required this.kondisi,
    required this.status,
    required this.lokasi,
  });

  @override
  State<EditPerangkatPage> createState() =>
      _EditPerangkatPageState();
}

class _EditPerangkatPageState
    extends State<EditPerangkatPage> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController namaController;
  late TextEditingController kodeController;
  late TextEditingController lokasiController;

  late String kategori;
  late String kondisi;
  late String status;

  @override
  void initState() {
    super.initState();

    // Menampilkan data lama ke dalam form
    namaController = TextEditingController(
      text: widget.nama,
    );

    kodeController = TextEditingController(
      text: widget.kode,
    );

    lokasiController = TextEditingController(
      text: widget.lokasi,
    );

    kategori = widget.kategori;
    kondisi = widget.kondisi;
    status = widget.status;
  }

  @override
  void dispose() {
    namaController.dispose();
    kodeController.dispose();
    lokasiController.dispose();

    super.dispose();
  }

  void simpanPerubahan() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    // Mengirim data hasil edit
    final dataHasilEdit = {
      'nama': namaController.text.trim(),
      'kode': kodeController.text.trim(),
      'kategori': kategori,
      'kondisi': kondisi,
      'status': status,
      'lokasi': lokasiController.text.trim(),
    };

    Navigator.pop(
      context,
      dataHasilEdit,
    );
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
          'Edit Perangkat',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),

          child: Form(
            key: _formKey,

            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,

              children: [
                // HEADER
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(18),

                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius:
                        BorderRadius.circular(18),
                  ),

                  child: const Row(
                    children: [
                      Icon(
                        Icons.edit_outlined,
                        color: Colors.white,
                        size: 40,
                      ),

                      SizedBox(width: 14),

                      Expanded(
                        child: Column(
                          crossAxisAlignment:
                              CrossAxisAlignment.start,

                          children: [
                            Text(
                              'Edit Data Perangkat',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight:
                                    FontWeight.bold,
                              ),
                            ),

                            SizedBox(height: 4),

                            Text(
                              'Perbarui informasi perangkat',
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 24),

                // JUDUL
                const Text(
                  'Informasi Perangkat',
                  style: TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 14),

                // NAMA
                TextFormField(
                  controller: namaController,

                  style: const TextStyle(
                    fontSize: 17,
                  ),

                  decoration: inputDecoration(
                    label: 'Nama Perangkat',
                    hint:
                        'Masukkan nama perangkat',
                    icon:
                        Icons.devices_other_outlined,
                  ),

                  validator: (value) {
                    if (value == null ||
                        value.trim().isEmpty) {
                      return 'Nama perangkat wajib diisi';
                    }

                    return null;
                  },
                ),

                const SizedBox(height: 15),

                // KODE
                TextFormField(
                  controller: kodeController,

                  textCapitalization:
                      TextCapitalization.characters,

                  style: const TextStyle(
                    fontSize: 17,
                  ),

                  decoration: inputDecoration(
                    label: 'Kode Inventaris',
                    hint:
                        'Masukkan kode inventaris',
                    icon:
                        Icons.qr_code_rounded,
                  ),

                  validator: (value) {
                    if (value == null ||
                        value.trim().isEmpty) {
                      return 'Kode inventaris wajib diisi';
                    }

                    return null;
                  },
                ),

                const SizedBox(height: 15),

                // KATEGORI
                DropdownButtonFormField<String>(
                  value: kategori,

                  decoration: inputDecoration(
                    label: 'Kategori',
                    hint: 'Pilih kategori',
                    icon:
                        Icons.category_outlined,
                  ),

                  style: const TextStyle(
                    color:
                        AppColors.textPrimary,
                    fontSize: 17,
                  ),

                  items: const [
                    DropdownMenuItem(
                      value: 'Laptop',
                      child:
                          Text('Laptop'),
                    ),

                    DropdownMenuItem(
                      value:
                          'Radio Komunikasi',
                      child:
                          Text(
                        'Radio Komunikasi',
                      ),
                    ),

                    DropdownMenuItem(
                      value: 'Kamera',
                      child:
                          Text('Kamera'),
                    ),

                    DropdownMenuItem(
                      value: 'Komputer',
                      child:
                          Text('Komputer'),
                    ),

                    DropdownMenuItem(
                      value: 'Lainnya',
                      child:
                          Text('Lainnya'),
                    ),
                  ],

                  onChanged: (value) {
                    if (value != null) {
                      setState(() {
                        kategori = value;
                      });
                    }
                  },
                ),

                const SizedBox(height: 24),

                // KONDISI DAN STATUS
                const Text(
                  'Kondisi dan Status',
                  style: TextStyle(
                    color:
                        AppColors.textPrimary,
                    fontSize: 21,
                    fontWeight:
                        FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 14),

                // KONDISI
                DropdownButtonFormField<String>(
                  value: kondisi,

                  decoration: inputDecoration(
                    label: 'Kondisi',
                    hint: 'Pilih kondisi',
                    icon:
                        Icons.verified_outlined,
                  ),

                  style: const TextStyle(
                    color:
                        AppColors.textPrimary,
                    fontSize: 17,
                  ),

                  items: const [
                    DropdownMenuItem(
                      value: 'Baik',
                      child:
                          Text('Baik'),
                    ),

                    DropdownMenuItem(
                      value:
                          'Rusak Ringan',
                      child:
                          Text(
                        'Rusak Ringan',
                      ),
                    ),

                    DropdownMenuItem(
                      value:
                          'Perlu Perbaikan',
                      child:
                          Text(
                        'Perlu Perbaikan',
                      ),
                    ),
                  ],

                  onChanged: (value) {
                    if (value != null) {
                      setState(() {
                        kondisi = value;
                      });
                    }
                  },
                ),

                const SizedBox(height: 15),

                // STATUS
                DropdownButtonFormField<String>(
                  value: status,

                  decoration: inputDecoration(
                    label: 'Status',
                    hint: 'Pilih status',
                    icon:
                        Icons.info_outline_rounded,
                  ),

                  style: const TextStyle(
                    color:
                        AppColors.textPrimary,
                    fontSize: 17,
                  ),

                  items: const [
                    DropdownMenuItem(
                      value:
                          'Tersedia',
                      child:
                          Text(
                        'Tersedia',
                      ),
                    ),

                    DropdownMenuItem(
                      value:
                          'Dipinjam',
                      child:
                          Text(
                        'Dipinjam',
                      ),
                    ),

                    DropdownMenuItem(
                      value:
                          'Maintenance',
                      child:
                          Text(
                        'Maintenance',
                      ),
                    ),
                  ],

                  onChanged: (value) {
                    if (value != null) {
                      setState(() {
                        status = value;
                      });
                    }
                  },
                ),

                const SizedBox(height: 24),

                // LOKASI
                const Text(
                  'Lokasi Penyimpanan',
                  style: TextStyle(
                    color:
                        AppColors.textPrimary,
                    fontSize: 21,
                    fontWeight:
                        FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 14),

                TextFormField(
                  controller:
                      lokasiController,

                  style:
                      const TextStyle(
                    fontSize: 17,
                  ),

                  decoration:
                      inputDecoration(
                    label: 'Lokasi',
                    hint:
                        'Masukkan lokasi',
                    icon:
                        Icons
                            .location_on_outlined,
                  ),

                  validator: (value) {
                    if (value == null ||
                        value.trim().isEmpty) {
                      return 'Lokasi wajib diisi';
                    }

                    return null;
                  },
                ),

                const SizedBox(height: 30),

                // TOMBOL SIMPAN
                SizedBox(
                  width:
                      double.infinity,
                  height: 55,

                  child:
                      ElevatedButton.icon(
                    onPressed:
                        simpanPerubahan,

                    icon:
                        const Icon(
                      Icons.save_outlined,
                      size: 24,
                    ),

                    label:
                        const Text(
                      'Simpan Perubahan',

                      style:
                          TextStyle(
                        fontSize:
                            17,

                        fontWeight:
                            FontWeight
                                .bold,
                      ),
                    ),

                    style:
                        ElevatedButton
                            .styleFrom(
                      backgroundColor:
                          AppColors
                              .primary,

                      foregroundColor:
                          Colors.white,

                      elevation:
                          0,

                      shape:
                          RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius
                                .circular(
                          14,
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(
                  height: 25,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  InputDecoration inputDecoration({
    required String label,
    required String hint,
    required IconData icon,
  }) {
    return InputDecoration(
      labelText: label,
      hintText: hint,

      labelStyle: const TextStyle(
        color:
            AppColors.textSecondary,
        fontSize: 16,
      ),

      hintStyle: const TextStyle(
        color:
            AppColors.textSecondary,
        fontSize: 15,
      ),

      prefixIcon: Icon(
        icon,
        color:
            AppColors.primary,
      ),

      filled: true,
      fillColor:
          AppColors.card,

      border:
          OutlineInputBorder(
        borderRadius:
            BorderRadius.circular(
          14,
        ),

        borderSide:
            const BorderSide(
          color:
              AppColors.border,
        ),
      ),

      enabledBorder:
          OutlineInputBorder(
        borderRadius:
            BorderRadius.circular(
          14,
        ),

        borderSide:
            const BorderSide(
          color:
              AppColors.border,
        ),
      ),

      focusedBorder:
          OutlineInputBorder(
        borderRadius:
            BorderRadius.circular(
          14,
        ),

        borderSide:
            const BorderSide(
          color:
              AppColors.primary,
          width: 2,
        ),
      ),

      errorBorder:
          OutlineInputBorder(
        borderRadius:
            BorderRadius.circular(
          14,
        ),

        borderSide:
            const BorderSide(
          color:
              AppColors.danger,
        ),
      ),

      focusedErrorBorder:
          OutlineInputBorder(
        borderRadius:
            BorderRadius.circular(
          14,
        ),

        borderSide:
            const BorderSide(
          color:
              AppColors.danger,
          width: 2,
        ),
      ),
    );
  }
}