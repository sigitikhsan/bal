import 'package:flutter/material.dart';
import 'dashboard_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // 1. Kunci unik untuk mengontrol status validasi Form
  final _formKey = GlobalKey<FormState>();

  bool remember = false;
  bool hidePassword = true;

  final username = TextEditingController();
  final password = TextEditingController();

  @override
  void dispose() {
    username.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          // 2. Bungkus seluruh kolom input dengan widget Form
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(height: 50),

                Container(
                  width: 90,
                  height: 90,
                  decoration: BoxDecoration(
                    color: Colors.blue.shade700,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Icon(Icons.shield, color: Colors.white, size: 45),
                ),

                const SizedBox(height: 25),

                const Text(
                  "Selamat Datang!",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 27),
                ),

                const SizedBox(height: 8),

                const Text(
                  "Silakan masuk untuk melanjutkan",
                  style: TextStyle(color: Colors.grey),
                ),

                const SizedBox(height: 35),

                // 3. Ubah TextField menjadi TextFormField + Tambah Validator Username
                TextFormField(
                  controller: username,
                  decoration: InputDecoration(
                    hintText: "NIP / Username",
                    prefixIcon: const Icon(Icons.person),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Username tidak boleh kosong';
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 18),

                // 4. Ubah TextField menjadi TextFormField + Tambah Validator Password
                TextFormField(
                  controller: password,
                  obscureText: hidePassword,
                  decoration: InputDecoration(
                    hintText: "Password",
                    prefixIcon: const Icon(Icons.lock),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          hidePassword = !hidePassword;
                        });
                      },
                      icon: Icon(
                        hidePassword ? Icons.visibility_off : Icons.visibility,
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Password tidak boleh kosong';
                    }
                    if (value.length < 6) {
                      return 'Password minimal 6 karakter';
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 15),

                Row(
                  children: [
                    Checkbox(
                      value: remember,
                      onChanged: (v) {
                        setState(() {
                          remember = v!;
                        });
                      },
                    ),
                    const Text("Ingat saya"),
                    const Spacer(),
                    TextButton(
                      onPressed: () {},
                      child: const Text("Lupa Password?"),
                    ),
                  ],
                ),

                const SizedBox(height: 15),

                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue.shade700,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {
                      // 5. Cek validasi sebelum pindah halaman
                      if (_formKey.currentState!.validate()) {
                        // Jika semua input valid, baru pindah ke halaman utama
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const DashboardPage(),
                          ),
                        );
                      }
                    },
                    child: const Text(
                      "Masuk",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                const Text(
                  "atau masuk dengan",
                  style: TextStyle(color: Colors.grey),
                ),

                const SizedBox(height: 20),

                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: OutlinedButton(
                    onPressed: () {},
                    child: const Text("SSO Balmon"),
                  ),
                ),

                const SizedBox(height: 40),

                const Text(
                  "Belum punya akun?",
                  style: TextStyle(color: Colors.grey),
                ),

                TextButton(onPressed: () {}, child: const Text("Hubungi Admin")),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
