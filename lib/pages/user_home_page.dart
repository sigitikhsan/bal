import 'package:flutter/material.dart';
import 'barang_page.dart';

class UserHomePage extends StatefulWidget {
  const UserHomePage({super.key});

  @override
  State<UserHomePage> createState() => _UserHomePageState();
}

class _UserHomePageState extends State<UserHomePage> {
  // Index navbar yang sedang dipilih
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    // Daftar halaman berdasarkan navbar
    final List<Widget> pages = [
      _dashboardPage(),
      const BarangPage(),
      _riwayatPage(),
      _profilPage(),
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF2F4F8),

      appBar: AppBar(
        backgroundColor: const Color(0xFF304B70),
        automaticallyImplyLeading: false,

        title: Text(
          _selectedIndex == 0
              ? 'SIMBA'
              : _selectedIndex == 1
                  ? 'Daftar Barang'
                  : _selectedIndex == 2
                      ? 'Riwayat Peminjaman'
                      : 'Profil',
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),

        actions: [
          if (_selectedIndex == 0)
            IconButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      'Belum ada notifikasi',
                    ),
                  ),
                );
              },
              icon: const Icon(
                Icons.notifications_none,
                color: Colors.white,
              ),
            ),
        ],
      ),

      // Isi berubah sesuai navbar
      body: pages[_selectedIndex],

      // Navbar tetap berada di bawah
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,

        selectedItemColor: const Color(
          0xFF304B70,
        ),

        unselectedItemColor: Colors.grey,

        type: BottomNavigationBarType.fixed,

        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },

        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: 'Beranda',
          ),

          BottomNavigationBarItem(
            icon: Icon(
              Icons.inventory_2_outlined,
            ),
            activeIcon: Icon(
              Icons.inventory_2,
            ),
            label: 'Barang',
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'Riwayat',
          ),

          BottomNavigationBarItem(
            icon: Icon(
              Icons.person_outline,
            ),
            activeIcon: Icon(Icons.person),
            label: 'Profil',
          ),
        ],
      ),
    );
  }

  // =========================
  // HALAMAN DASHBOARD
  // =========================

  Widget _dashboardPage() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),

      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start,

        children: [
          const Text(
            'Selamat Datang 👋',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 5),

          const Text(
            'Silakan kelola peminjaman barang Anda',
            style: TextStyle(
              fontSize: 15,
              color: Colors.grey,
            ),
          ),

          const SizedBox(height: 25),

          Row(
            children: [
              Expanded(
                child: _infoCard(
                  icon:
                      Icons.inventory_2_outlined,
                  jumlah: '24',
                  judul: 'Barang Tersedia',
                ),
              ),

              const SizedBox(width: 15),

              Expanded(
                child: _infoCard(
                  icon:
                      Icons.assignment_outlined,
                  jumlah: '2',
                  judul:
                      'Peminjaman Aktif',
                ),
              ),
            ],
          ),

          const SizedBox(height: 30),

          const Text(
            'Menu Utama',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 15),

          // MENU DAFTAR BARANG
          _menuCard(
            icon:
                Icons.inventory_2_outlined,
            judul: 'Daftar Barang',
            deskripsi:
                'Lihat barang dan alat yang tersedia',

            onTap: () {
              setState(() {
                _selectedIndex = 1;
              });
            },
          ),

          const SizedBox(height: 15),

          _menuCard(
            icon:
                Icons.assignment_outlined,
            judul:
                'Peminjaman Saya',
            deskripsi:
                'Lihat status peminjaman barang',
          ),

          const SizedBox(height: 15),

          _menuCard(
            icon: Icons.history,
            judul:
                'Riwayat Peminjaman',
            deskripsi:
                'Lihat riwayat peminjaman Anda',

            onTap: () {
              setState(() {
                _selectedIndex = 2;
              });
            },
          ),

          const SizedBox(height: 15),

          _menuCard(
            icon:
                Icons.person_outline,
            judul: 'Profil',
            deskripsi:
                'Lihat dan ubah informasi akun',

            onTap: () {
              setState(() {
                _selectedIndex = 3;
              });
            },
          ),

          const SizedBox(height: 20),
        ],
      ),
    );
  }

  // =========================
  // HALAMAN RIWAYAT SEMENTARA
  // =========================

  Widget _riwayatPage() {
    return const Center(
      child: Text(
        'Halaman Riwayat',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  // =========================
  // HALAMAN PROFIL SEMENTARA
  // =========================

  Widget _profilPage() {
    return const Center(
      child: Text(
        'Halaman Profil',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  // =========================
  // KARTU INFORMASI
  // =========================

  Widget _infoCard({
    required IconData icon,
    required String jumlah,
    required String judul,
  }) {
    return Container(
      padding: const EdgeInsets.all(18),

      decoration: BoxDecoration(
        color: Colors.white,

        borderRadius:
            BorderRadius.circular(18),

        boxShadow: [
          BoxShadow(
            color: Colors.black
                .withValues(alpha: 0.08),

            blurRadius: 10,

            offset:
                const Offset(0, 4),
          ),
        ],
      ),

      child: Column(
        children: [
          Icon(
            icon,
            size: 35,
            color:
                const Color(0xFF304B70),
          ),

          const SizedBox(height: 10),

          Text(
            jumlah,
            style: const TextStyle(
              fontSize: 25,
              fontWeight:
                  FontWeight.bold,
            ),
          ),

          const SizedBox(height: 5),

          Text(
            judul,
            textAlign:
                TextAlign.center,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }

  // =========================
  // KARTU MENU
  // =========================

  Widget _menuCard({
    required IconData icon,
    required String judul,
    required String deskripsi,
    VoidCallback? onTap,
  }) {
    return InkWell(
      onTap: onTap ??
          () {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(
              SnackBar(
                content: Text(
                  '$judul belum dibuat',
                ),
              ),
            );
          },

      borderRadius:
          BorderRadius.circular(16),

      child: Container(
        width: double.infinity,

        padding:
            const EdgeInsets.all(18),

        decoration: BoxDecoration(
          color: Colors.white,

          borderRadius:
              BorderRadius.circular(16),

          boxShadow: [
            BoxShadow(
              color: Colors.black
                  .withValues(
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
              padding:
                  const EdgeInsets.all(12),

              decoration:
                  BoxDecoration(
                color: const Color(
                  0xFFE7EDF5,
                ),

                borderRadius:
                    BorderRadius.circular(
                  12,
                ),
              ),

              child: Icon(
                icon,
                color: const Color(
                  0xFF304B70,
                ),
              ),
            ),

            const SizedBox(
              width: 15,
            ),

            Expanded(
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment
                        .start,

                children: [
                  Text(
                    judul,
                    style:
                        const TextStyle(
                      fontSize: 17,
                      fontWeight:
                          FontWeight.bold,
                    ),
                  ),

                  const SizedBox(
                    height: 4,
                  ),

                  Text(
                    deskripsi,
                    style:
                        const TextStyle(
                      color:
                          Colors.grey,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),

            const Icon(
              Icons.arrow_forward_ios,
              size: 18,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}