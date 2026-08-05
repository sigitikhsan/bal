import 'package:flutter/material.dart';
import '../dashboard_page.dart';
import '../../theme/app_colors.dart';
import '../login_page.dart'; // Menghubungkan ke halaman login

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // ================= HEADER / PROFIL TOP =================
            Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(16, 45, 20, 30),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [AppColors.primaryDark, AppColors.primary],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: Column(
                children: [
                  // Tombol Back ke Dashboard
                  Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: 26,
                      ),
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const DashboardPage(),
                          ),
                          (route) => false,
                        );
                      },
                    ),
                  ),

                  // Foto Profil
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 3),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.15),
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: const CircleAvatar(
                      radius: 46,
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.person,
                        size: 58,
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    "Andi Pratama",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text(
                      "Pengguna BALMON",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // ================= DETAIL INFORMASI =================
            Padding(
              padding: const EdgeInsets.all(18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Card Detail Identitas
                  Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      children: const [
                        ListTile(
                          leading: Icon(Icons.badge, color: AppColors.primary),
                          title: Text(
                            "NIP",
                            style: TextStyle(fontSize: 12, color: Colors.grey),
                          ),
                          subtitle: Text(
                            "1987654321",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                        Divider(height: 1, indent: 50, endIndent: 16),
                        ListTile(
                          leading: Icon(Icons.email, color: AppColors.primary),
                          title: Text(
                            "Email",
                            style: TextStyle(fontSize: 12, color: Colors.grey),
                          ),
                          subtitle: Text(
                            "andi@balmon.go.id",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                        Divider(height: 1, indent: 50, endIndent: 16),
                        ListTile(
                          leading: Icon(Icons.phone, color: AppColors.primary),
                          title: Text(
                            "Nomor HP",
                            style: TextStyle(fontSize: 12, color: Colors.grey),
                          ),
                          subtitle: Text(
                            "081234567890",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                        Divider(height: 1, indent: 50, endIndent: 16),
                        ListTile(
                          leading: Icon(
                            Icons.business,
                            color: AppColors.primary,
                          ),
                          title: Text(
                            "Unit Kerja",
                            style: TextStyle(fontSize: 12, color: Colors.grey),
                          ),
                          subtitle: Text(
                            "Balai Monitor Spektrum Frekuensi Radio",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Section Pengaturan Akun
                  const Padding(
                    padding: EdgeInsets.only(left: 4, bottom: 8),
                    child: Text(
                      "PENGATURAN AKUN",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),
                  ),

                  // Menu Pengaturan
                  Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      children: [
                        ListTile(
                          leading: const Icon(
                            Icons.edit_outlined,
                            color: AppColors.primary,
                          ),
                          title: const Text(
                            "Ubah Profil",
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                          trailing: const Icon(
                            Icons.arrow_forward_ios,
                            size: 16,
                            color: Colors.grey,
                          ),
                          onTap: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Fitur segera hadir"),
                              ),
                            );
                          },
                        ),
                        const Divider(height: 1, indent: 50, endIndent: 16),
                        ListTile(
                          leading: const Icon(
                            Icons.lock_outline,
                            color: AppColors.primary,
                          ),
                          title: const Text(
                            "Ganti Password",
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                          trailing: const Icon(
                            Icons.arrow_forward_ios,
                            size: 16,
                            color: Colors.grey,
                          ),
                          onTap: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Fitur segera hadir"),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Section Lainnya
                  const Padding(
                    padding: EdgeInsets.only(left: 4, bottom: 8),
                    child: Text(
                      "INFORMASI LAINNYA",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),
                  ),

                  // Card Bantuan & Tentang
                  Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      children: [
                        ListTile(
                          leading: const Icon(
                            Icons.help_outline,
                            color: AppColors.primary,
                          ),
                          title: const Text(
                            "Bantuan",
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                          trailing: const Icon(
                            Icons.arrow_forward_ios,
                            size: 16,
                            color: Colors.grey,
                          ),
                          onTap: () {
                            showAboutDialog(
                              context: context,
                              applicationName: "BALMON",
                              applicationVersion: "Versi 1.0.0",
                              applicationLegalese:
                                  "© 2026 Balai Monitor Spektrum Frekuensi Radio",
                            );
                          },
                        ),
                        const Divider(height: 1, indent: 50, endIndent: 16),
                        ListTile(
                          leading: const Icon(
                            Icons.info_outline,
                            color: AppColors.primary,
                          ),
                          title: const Text(
                            "Tentang Aplikasi",
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                          trailing: const Icon(
                            Icons.arrow_forward_ios,
                            size: 16,
                            color: Colors.grey,
                          ),
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (_) => AlertDialog(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                title: const Text("BALMON"),
                                content: const Text(
                                  "BALMON adalah aplikasi peminjaman perangkat Balai Monitor Spektrum Frekuensi Radio.\n\nVersi 1.0.0",
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text("Tutup"),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 30),

                  // ================= TOMBOL LOGOUT (SUDAH DIUBAH KE LOGINPAGE) =================
                  SizedBox(
                    width: double.infinity,
                    height: 52,
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                      icon: const Icon(Icons.logout),
                      label: const Text(
                        "Keluar",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (_) => AlertDialog(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            title: const Text("Konfirmasi"),
                            content: const Text(
                              "Apakah Anda yakin ingin keluar dari aplikasi?",
                            ),
                            actions: [
                              // 1. Tombol Batal
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context); // Hanya menutup dialog konfirmasi
                                },
                                child: const Text("Batal"),
                              ),
                              // 2. Tombol Keluar (Diubah ke LoginPage)
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.red,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.pop(context); // Tutup dialog konfirmasi
                                  
                                  // Pindah ke LoginPage & hapus semua halaman sebelumnya
                                  Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const LoginPage(), // <-- Arah ke LOGIN
                                    ),
                                    (route) => false,
                                  );
                                },
                                child: const Text(
                                  "Keluar",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}