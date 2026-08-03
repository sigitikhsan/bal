import 'package:flutter/material.dart';
import 'login_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // Key untuk memvalidasi seluruh form
  final _formKey = GlobalKey<FormState>();

  // Controller untuk mengambil data input
  final namaController = TextEditingController();
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final konfirmasiPasswordController = TextEditingController();

  // Mengatur password terlihat atau tersembunyi
  bool passwordTersembunyi = true;
  bool konfirmasiPasswordTersembunyi = true;

  // Membersihkan controller saat halaman ditutup
  @override
  void dispose() {
    namaController.dispose();
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    konfirmasiPasswordController.dispose();

    super.dispose();
  }

  // Fungsi saat tombol DAFTAR ditekan
  void daftar() {
    // Menjalankan semua validator
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Pendaftaran berhasil, silahkan login.',
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F4F8),

      appBar: AppBar(
        backgroundColor: const Color(0xFF304B70),

        title: const Text(
          'Daftar Akun',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),

        // Warna tombol kembali
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),

          child: Container(
            width: double.infinity,

            padding: const EdgeInsets.all(28),

            decoration: BoxDecoration(
              color: Colors.white,

              borderRadius: BorderRadius.circular(25),

              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(
                    alpha: 0.1,
                  ),
                  blurRadius: 15,
                  offset: const Offset(0, 5),
                ),
              ],
            ),

            // FORM
            child: Form(
              key: _formKey,

              child: Column(
                children: [
                  const Icon(
                    Icons.person_add_alt_1_outlined,
                    size: 75,
                    color: Color(0xFF304B70),
                  ),

                  const SizedBox(height: 15),

                  const Text(
                    'Buat Akun Baru',
                    style: TextStyle(
                      fontSize: 27,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 8),

                  const Text(
                    'Silakan lengkapi data di bawah ini',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 15,
                    ),
                  ),

                  const SizedBox(height: 28),

                  // =====================
                  // NAMA LENGKAP
                  // =====================

                  TextFormField(
                    controller: namaController,

                    validator: (value) {
                      if (value == null ||
                          value.trim().isEmpty) {
                        return 'Nama lengkap wajib diisi';
                      }

                      return null;
                    },

                    decoration: InputDecoration(
                      labelText: 'Nama Lengkap',

                      prefixIcon: const Icon(
                        Icons.person_outline,
                      ),

                      border: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(12),
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),

                  // =====================
                  // USERNAME
                  // =====================

                  TextFormField(
                    controller: usernameController,

                    validator: (value) {
                      if (value == null ||
                          value.trim().isEmpty) {
                        return 'Username wajib diisi';
                      }

                      return null;
                    },

                    decoration: InputDecoration(
                      labelText: 'Username',

                      prefixIcon: const Icon(
                        Icons.account_circle_outlined,
                      ),

                      border: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(12),
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),

                  // =====================
                  // EMAIL
                  // =====================

                  TextFormField(
                    controller: emailController,

                    keyboardType:
                        TextInputType.emailAddress,

                    validator: (value) {
                      if (value == null ||
                          value.trim().isEmpty) {
                        return 'Email wajib diisi';
                      }

                      // Mengecek apakah email memiliki @
                      if (!value.contains('@')) {
                        return 'Format email tidak valid';
                      }

                      return null;
                    },

                    decoration: InputDecoration(
                      labelText: 'Email',

                      prefixIcon: const Icon(
                        Icons.email_outlined,
                      ),

                      border: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(12),
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),

                  // =====================
                  // PASSWORD
                  // =====================

                  TextFormField(
                    controller: passwordController,

                    obscureText: passwordTersembunyi,

                    validator: (value) {
                      if (value == null ||
                          value.isEmpty) {
                        return 'Password wajib diisi';
                      }

                      if (value.length < 6) {
                        return 'Password minimal 6 karakter';
                      }

                      return null;
                    },

                    decoration: InputDecoration(
                      labelText: 'Password',

                      prefixIcon: const Icon(
                        Icons.lock_outline,
                      ),

                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            passwordTersembunyi =
                                !passwordTersembunyi;
                          });
                        },

                        icon: Icon(
                          passwordTersembunyi
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                      ),

                      border: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(12),
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),

                  // =====================
                  // KONFIRMASI PASSWORD
                  // =====================

                  TextFormField(
                    controller:
                        konfirmasiPasswordController,

                    obscureText:
                        konfirmasiPasswordTersembunyi,

                    validator: (value) {
                      if (value == null ||
                          value.isEmpty) {
                        return 'Konfirmasi password wajib diisi';
                      }

                      if (value !=
                          passwordController.text) {
                        return 'Password tidak sama';
                      }

                      return null;
                    },

                    decoration: InputDecoration(
                      labelText:
                          'Konfirmasi Password',

                      prefixIcon: const Icon(
                        Icons.lock_reset_outlined,
                      ),

                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            konfirmasiPasswordTersembunyi =
                                !konfirmasiPasswordTersembunyi;
                          });
                        },

                        icon: Icon(
                          konfirmasiPasswordTersembunyi
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                      ),

                      border: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(12),
                      ),
                    ),
                  ),

                  const SizedBox(height: 28),

                  // =====================
                  // TOMBOL DAFTAR
                  // =====================

                  SizedBox(
                    width: double.infinity,
                    height: 52,

                    child: ElevatedButton(
                      onPressed: daftar,

                      style:
                          ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color(
                          0xFF304B70,
                        ),

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
                        'DAFTAR',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight:
                              FontWeight.bold,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 15),

                  // =====================
                  // KEMBALI KE LOGIN
                  // =====================

                  Row(
                    mainAxisAlignment:
                        MainAxisAlignment.center,

                    children: [
                      const Text(
                        'Sudah punya akun?',
                      ),

                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const LoginPage(),
                            ),
                          );
                        },

                        child: const Text(
                          'Login',
                          style: TextStyle(
                            color:
                                Color(0xFF304B70),

                            fontWeight:
                                FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}