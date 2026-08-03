import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),

      child: Column(
        children: [
          // FOTO PROFIL
          Container(
            width: 100,
            height: 100,

            decoration: const BoxDecoration(
              color: Color(0xFFE7EDF5),
              shape: BoxShape.circle,
            ),

            child: const Icon(
              Icons.person,
              size: 55,
              color: Color(0xFF304B70),
            ),
          ),

          const SizedBox(height: 15),

          // NAMA
          const Text(
            'Sigit',
            style: TextStyle(
              fontSize: 23,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 5),

          // EMAIL
          const Text(
            'sigitikhsan3@gmail.com',
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey,
            ),
          ),

          const SizedBox(height: 8),

          // ROLE
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 14,
              vertical: 7,
            ),

            decoration: BoxDecoration(
              color: const Color(
                0xFFE7EDF5,
              ),

              borderRadius:
                  BorderRadius.circular(20),
            ),

            child: const Text(
              'User',
              style: TextStyle(
                color: Color(
                  0xFF304B70,
                ),
                fontWeight:
                    FontWeight.bold,
              ),
            ),
          ),

          const SizedBox(height: 30),

          // MENU PROFIL
          _profileMenu(
            context: context,
            icon: Icons.edit_outlined,
            judul: 'Edit Profil',
            deskripsi:
                'Ubah nama dan informasi akun',
            onTap: () {
              _showMessage(
                context,
                'Halaman Edit Profil belum dibuat',
              );
            },
          ),

          const SizedBox(height: 15),

          _profileMenu(
            context: context,
            icon: Icons.lock_outline,
            judul: 'Ubah Password',
            deskripsi:
                'Ganti password akun Anda',
            onTap: () {
              _showMessage(
                context,
                'Halaman Ubah Password belum dibuat',
              );
            },
          ),

          const SizedBox(height: 15),

          _profileMenu(
            context: context,
            icon: Icons.info_outline,
            judul: 'Tentang Aplikasi',
            deskripsi:
                'Informasi aplikasi SIMBA',
            onTap: () {
              showAboutDialog(
                context: context,
                applicationName: 'SIMBA',
                applicationVersion: '1.0.0',
                applicationLegalese:
                    'Sistem Manajemen Barang dan Alat',
              );
            },
          ),

          const SizedBox(height: 25),

          // TOMBOL LOGOUT
          SizedBox(
            width: double.infinity,
            height: 52,

            child: OutlinedButton.icon(
              onPressed: () {
                _showLogoutDialog(context);
              },

              icon: const Icon(
                Icons.logout,
              ),

              label: const Text(
                'Logout',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight:
                      FontWeight.bold,
                ),
              ),

              style:
                  OutlinedButton.styleFrom(
                foregroundColor:
                    Colors.red,

                side: const BorderSide(
                  color: Colors.red,
                ),

                shape:
                    RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(
                    14,
                  ),
                ),
              ),
            ),
          ),

          const SizedBox(height: 20),
        ],
      ),
    );
  }

  // KARTU MENU PROFIL
  Widget _profileMenu({
    required BuildContext context,
    required IconData icon,
    required String judul,
    required String deskripsi,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,

      borderRadius:
          BorderRadius.circular(16),

      child: Container(
        width: double.infinity,

        padding:
            const EdgeInsets.all(17),

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

              offset:
                  const Offset(0, 4),
            ),
          ],
        ),

        child: Row(
          children: [
            Container(
              width: 48,
              height: 48,

              decoration: BoxDecoration(
                color: const Color(
                  0xFFE7EDF5,
                ),

                borderRadius:
                    BorderRadius.circular(
                  13,
                ),
              ),

              child: Icon(
                icon,
                color: const Color(
                  0xFF304B70,
                ),
              ),
            ),

            const SizedBox(width: 15),

            Expanded(
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment
                        .start,

                children: [
                  Text(
                    judul,

                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight:
                          FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 4),

                  Text(
                    deskripsi,

                    style: const TextStyle(
                      fontSize: 13,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),

            const Icon(
              Icons.arrow_forward_ios,
              size: 17,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }

  // PESAN SEMENTARA
  void _showMessage(
    BuildContext context,
    String pesan,
  ) {
    ScaffoldMessenger.of(context)
        .showSnackBar(
      SnackBar(
        content: Text(pesan),
      ),
    );
  }

  // DIALOG LOGOUT
  void _showLogoutDialog(
    BuildContext context,
  ) {
    showDialog(
      context: context,

      builder: (context) {
        return AlertDialog(
          title: const Text(
            'Logout',
          ),

          content: const Text(
            'Apakah Anda yakin ingin keluar?',
          ),

          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },

              child: const Text(
                'Batal',
              ),
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);

                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(
                  const SnackBar(
                    content: Text(
                      'Logout berhasil',
                    ),
                  ),
                );
              },

              style:
                  ElevatedButton.styleFrom(
                backgroundColor:
                    Colors.red,

                foregroundColor:
                    Colors.white,
              ),

              child: const Text(
                'Logout',
              ),
            ),
          ],
        );
      },
    );
  }
}